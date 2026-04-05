using BlackMoon.Application.Abstractions.Repositories;
using BlackMoon.Domain.Entities;
using BlackMoon.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace BlackMoon.Infrastructure.Repositories;

public sealed class AlbumRepository : IAlbumRepository
{
    private readonly CatalogDbContext _dbContext;

    public AlbumRepository(CatalogDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<IReadOnlyList<Album>> GetCatalogAsync(CancellationToken cancellationToken = default)
    {
        return await _dbContext.Albums
            .AsNoTracking()
            .Include(album => album.Series)
            .Include(album => album.Credits)
                .ThenInclude(credit => credit.Contributor)
            .OrderBy(album => album.VolumeNumber)
            .ToListAsync(cancellationToken);
    }

    public async Task<Album?> GetByIdAsync(int albumId, CancellationToken cancellationToken = default)
    {
        return await _dbContext.Albums
            .AsNoTracking()
            .Include(album => album.Series)
            .Include(album => album.Credits)
                .ThenInclude(credit => credit.Contributor)
            .SingleOrDefaultAsync(album => album.Id == albumId, cancellationToken);
    }

    public async Task<Album> CreateAsync(Album album, CancellationToken cancellationToken = default)
    {
        _dbContext.Albums.Add(album);
        await _dbContext.SaveChangesAsync(cancellationToken);
        return (await GetByIdAsync(album.Id, cancellationToken))!;
    }

    public async Task<Album?> UpdateAsync(Album album, CancellationToken cancellationToken = default)
    {
        var existing = await _dbContext.Albums
            .Include(item => item.Credits)
            .SingleOrDefaultAsync(item => item.Id == album.Id, cancellationToken);

        if (existing is null)
        {
            return null;
        }

        existing.SeriesId = album.SeriesId;
        existing.VolumeNumber = album.VolumeNumber;
        existing.Title = album.Title;
        existing.DargaudPublicationDate = album.DargaudPublicationDate;
        existing.Scenario = album.Scenario;
        existing.Drawing = album.Drawing;
        existing.IsbnEan = album.IsbnEan;
        existing.ReleaseYear = album.ReleaseYear;
        existing.Summary = album.Summary;
        existing.DargaudUrl = album.DargaudUrl;
        existing.CoverImageUrl = album.CoverImageUrl;
        existing.SummarySourceUrl = album.SummarySourceUrl;
        existing.IsOwned = album.IsOwned;

        _dbContext.AlbumContributors.RemoveRange(existing.Credits);
        existing.Credits.Clear();

        foreach (var credit in album.Credits)
        {
            existing.Credits.Add(new AlbumContributor
            {
                AlbumId = existing.Id,
                ContributorId = credit.ContributorId,
                ContributionType = credit.ContributionType
            });
        }

        await _dbContext.SaveChangesAsync(cancellationToken);
        return await GetByIdAsync(existing.Id, cancellationToken);
    }

    public async Task<Album?> SetOwnedAsync(int albumId, bool isOwned, CancellationToken cancellationToken = default)
    {
        var existing = await _dbContext.Albums
            .SingleOrDefaultAsync(item => item.Id == albumId, cancellationToken);

        if (existing is null)
        {
            return null;
        }

        existing.IsOwned = isOwned;
        await _dbContext.SaveChangesAsync(cancellationToken);
        return await GetByIdAsync(existing.Id, cancellationToken);
    }
}
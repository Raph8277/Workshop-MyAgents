using BlackMoon.Application.Abstractions.Repositories;
using BlackMoon.Application.Abstractions.Services;
using BlackMoon.Application.Dtos;
using BlackMoon.Domain.Entities;

namespace BlackMoon.Application.Services;

public sealed class CatalogService : ICatalogService
{
    private readonly IAlbumRepository _albumRepository;
    private readonly ISeriesRepository _seriesRepository;
    private readonly IContributorRepository _contributorRepository;

    public CatalogService(
        IAlbumRepository albumRepository,
        ISeriesRepository seriesRepository,
        IContributorRepository contributorRepository)
    {
        _albumRepository = albumRepository;
        _seriesRepository = seriesRepository;
        _contributorRepository = contributorRepository;
    }

    public async Task<IReadOnlyList<AlbumListItemDto>> GetCatalogAsync(CancellationToken cancellationToken = default)
    {
        var albums = await _albumRepository.GetCatalogAsync(cancellationToken);
        return albums
            .OrderBy(album => album.Series?.Title)
            .ThenBy(album => album.VolumeNumber)
            .ThenBy(album => album.Title)
            .Select(MapListItem)
            .ToArray();
    }

    public async Task<AlbumDetailDto?> GetAlbumAsync(int albumId, CancellationToken cancellationToken = default)
    {
        var album = await _albumRepository.GetByIdAsync(albumId, cancellationToken);
        return album is null ? null : MapDetail(album);
    }

    public async Task<AlbumDetailDto> CreateAlbumAsync(AlbumUpsertDto request, CancellationToken cancellationToken = default)
    {
        var series = await EnsureSeriesAsync(request, cancellationToken);
        var contributors = await EnsureIllustratorsAsync(request.Illustrators, cancellationToken);

        var created = await _albumRepository.CreateAsync(BuildAlbum(request with { Id = null }, series, contributors), cancellationToken);
        return MapDetail(created);
    }

    public async Task<AlbumDetailDto?> UpdateAlbumAsync(AlbumUpsertDto request, CancellationToken cancellationToken = default)
    {
        if (request.Id is null)
        {
            throw new ArgumentException("An album id is required for updates.", nameof(request));
        }

        var series = await EnsureSeriesAsync(request, cancellationToken);
        var contributors = await EnsureIllustratorsAsync(request.Illustrators, cancellationToken);
        var updated = await _albumRepository.UpdateAsync(BuildAlbum(request, series, contributors), cancellationToken);
        return updated is null ? null : MapDetail(updated);
    }

    public async Task<AlbumDetailDto?> SetAlbumOwnedAsync(int albumId, bool isOwned, CancellationToken cancellationToken = default)
    {
        var updated = await _albumRepository.SetOwnedAsync(albumId, isOwned, cancellationToken);
        return updated is null ? null : MapDetail(updated);
    }

    private async Task<Series> EnsureSeriesAsync(AlbumUpsertDto request, CancellationToken cancellationToken)
    {
        var code = request.SeriesCode.Trim();
        var title = request.SeriesTitle.Trim();

        var existing = await _seriesRepository.GetByCodeAsync(code, cancellationToken);
        if (existing is not null)
        {
            return existing;
        }

        return await _seriesRepository.AddAsync(new Series
        {
            Code = code,
            Title = string.IsNullOrWhiteSpace(title) ? code : title
        }, cancellationToken);
    }

    private async Task<IReadOnlyList<Contributor>> EnsureIllustratorsAsync(IReadOnlyList<string> illustrators, CancellationToken cancellationToken)
    {
        var normalizedNames = illustrators
            .Select(name => name.Trim())
            .Where(name => !string.IsNullOrWhiteSpace(name))
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToArray();

        var existing = await _contributorRepository.GetByDisplayNamesAsync(normalizedNames, cancellationToken);
        var missing = normalizedNames
            .Where(name => existing.All(contributor => !string.Equals(contributor.DisplayName, name, StringComparison.OrdinalIgnoreCase)))
            .Select(name => new Contributor { DisplayName = name })
            .ToArray();

        if (missing.Length == 0)
        {
            return existing;
        }

        var created = await _contributorRepository.AddRangeAsync(missing, cancellationToken);
        return existing.Concat(created).ToArray();
    }

    private static Album BuildAlbum(AlbumUpsertDto request, Series series, IReadOnlyList<Contributor> contributors)
    {
        var album = new Album
        {
            Id = request.Id ?? 0,
            SeriesId = series.Id,
            Series = series,
            VolumeNumber = request.VolumeNumber,
            Title = request.Title.Trim(),
            DargaudPublicationDate = request.DargaudPublicationDate.Trim(),
            Scenario = request.Scenario.Trim(),
            Drawing = request.Drawing.Trim(),
            IsbnEan = request.IsbnEan.Trim(),
            ReleaseYear = request.ReleaseYear,
            Summary = request.Summary.Trim(),
            DargaudUrl = request.DargaudUrl.Trim(),
            CoverImageUrl = request.CoverImageUrl.Trim(),
            SummarySourceUrl = request.SummarySourceUrl.Trim(),
            IsOwned = request.IsOwned
        };

        foreach (var contributor in contributors)
        {
            album.Credits.Add(new AlbumContributor
            {
                AlbumId = album.Id,
                ContributorId = contributor.Id,
                Contributor = contributor,
                ContributionType = "dessin"
            });
        }

        return album;
    }

    private static AlbumListItemDto MapListItem(Album album) => new(
        album.Id,
        album.VolumeNumber,
        album.Title,
        album.DargaudPublicationDate,
        album.Scenario,
        album.Drawing,
        album.IsbnEan,
        album.ReleaseYear,
        album.Summary,
        album.DargaudUrl,
        album.CoverImageUrl,
        album.SummarySourceUrl,
        album.Series?.Title ?? string.Empty,
        GetIllustrators(album),
        album.IsOwned);

    private static AlbumDetailDto MapDetail(Album album) => new(
        album.Id,
        album.VolumeNumber,
        album.Title,
        album.DargaudPublicationDate,
        album.Scenario,
        album.Drawing,
        album.IsbnEan,
        album.ReleaseYear,
        album.Summary,
        album.DargaudUrl,
        album.CoverImageUrl,
        album.SummarySourceUrl,
        album.Series?.Code ?? string.Empty,
        album.Series?.Title ?? string.Empty,
        GetIllustrators(album),
        album.IsOwned);

    private static IReadOnlyList<string> GetIllustrators(Album album) => album.Credits
        .Where(credit => string.Equals(credit.ContributionType, "dessin", StringComparison.OrdinalIgnoreCase))
        .Select(credit => credit.Contributor?.DisplayName)
        .Where(name => !string.IsNullOrWhiteSpace(name))
        .Cast<string>()
        .Distinct(StringComparer.OrdinalIgnoreCase)
        .ToArray();
}
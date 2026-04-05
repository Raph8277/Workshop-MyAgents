using BlackMoon.Application.Abstractions.Repositories;
using BlackMoon.Domain.Entities;
using BlackMoon.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace BlackMoon.Infrastructure.Repositories;

public sealed class SeriesRepository : ISeriesRepository
{
    private readonly CatalogDbContext _dbContext;

    public SeriesRepository(CatalogDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<IReadOnlyList<Series>> GetAllAsync(CancellationToken cancellationToken = default)
    {
        return await _dbContext.Series
            .AsNoTracking()
            .OrderBy(series => series.Title)
            .ToListAsync(cancellationToken);
    }

    public async Task<Series?> GetByCodeAsync(string code, CancellationToken cancellationToken = default)
    {
        return await _dbContext.Series
            .AsNoTracking()
            .SingleOrDefaultAsync(series => series.Code == code, cancellationToken);
    }

    public async Task<Series> AddAsync(Series series, CancellationToken cancellationToken = default)
    {
        _dbContext.Series.Add(series);
        await _dbContext.SaveChangesAsync(cancellationToken);
        return series;
    }
}
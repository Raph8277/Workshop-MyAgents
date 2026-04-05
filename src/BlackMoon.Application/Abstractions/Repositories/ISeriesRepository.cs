using BlackMoon.Domain.Entities;

namespace BlackMoon.Application.Abstractions.Repositories;

public interface ISeriesRepository
{
    Task<IReadOnlyList<Series>> GetAllAsync(CancellationToken cancellationToken = default);
    Task<Series?> GetByCodeAsync(string code, CancellationToken cancellationToken = default);
    Task<Series> AddAsync(Series series, CancellationToken cancellationToken = default);
}
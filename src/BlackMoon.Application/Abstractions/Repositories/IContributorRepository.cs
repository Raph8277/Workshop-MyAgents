using BlackMoon.Domain.Entities;

namespace BlackMoon.Application.Abstractions.Repositories;

public interface IContributorRepository
{
    Task<IReadOnlyList<Contributor>> GetByDisplayNamesAsync(IEnumerable<string> names, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<Contributor>> AddRangeAsync(IEnumerable<Contributor> contributors, CancellationToken cancellationToken = default);
}
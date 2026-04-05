using BlackMoon.Application.Abstractions.Repositories;
using BlackMoon.Domain.Entities;
using BlackMoon.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace BlackMoon.Infrastructure.Repositories;

public sealed class ContributorRepository : IContributorRepository
{
    private readonly CatalogDbContext _dbContext;

    public ContributorRepository(CatalogDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<IReadOnlyList<Contributor>> GetByDisplayNamesAsync(IEnumerable<string> names, CancellationToken cancellationToken = default)
    {
        var normalized = names
            .Select(name => name.Trim())
            .Where(name => !string.IsNullOrWhiteSpace(name))
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToArray();

        return await _dbContext.Contributors
            .Where(contributor => normalized.Contains(contributor.DisplayName))
            .ToListAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<Contributor>> AddRangeAsync(IEnumerable<Contributor> contributors, CancellationToken cancellationToken = default)
    {
        var created = contributors.ToArray();
        _dbContext.Contributors.AddRange(created);
        await _dbContext.SaveChangesAsync(cancellationToken);
        return created;
    }
}
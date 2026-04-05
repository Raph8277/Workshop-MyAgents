using BlackMoon.Domain.Entities;

namespace BlackMoon.Application.Abstractions.Repositories;

public interface IAlbumRepository
{
    Task<IReadOnlyList<Album>> GetCatalogAsync(CancellationToken cancellationToken = default);
    Task<Album?> GetByIdAsync(int albumId, CancellationToken cancellationToken = default);
    Task<Album> CreateAsync(Album album, CancellationToken cancellationToken = default);
    Task<Album?> UpdateAsync(Album album, CancellationToken cancellationToken = default);
    Task<Album?> SetOwnedAsync(int albumId, bool isOwned, CancellationToken cancellationToken = default);
}
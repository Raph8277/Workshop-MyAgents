using BlackMoon.Application.Dtos;

namespace BlackMoon.Application.Abstractions.Services;

public interface ICatalogService
{
    Task<IReadOnlyList<AlbumListItemDto>> GetCatalogAsync(CancellationToken cancellationToken = default);
    Task<AlbumDetailDto?> GetAlbumAsync(int albumId, CancellationToken cancellationToken = default);
    Task<AlbumDetailDto> CreateAlbumAsync(AlbumUpsertDto request, CancellationToken cancellationToken = default);
    Task<AlbumDetailDto?> UpdateAlbumAsync(AlbumUpsertDto request, CancellationToken cancellationToken = default);
    Task<AlbumDetailDto?> SetAlbumOwnedAsync(int albumId, bool isOwned, CancellationToken cancellationToken = default);
}
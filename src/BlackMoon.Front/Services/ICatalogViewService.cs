using BlackMoon.Front.Models;

namespace BlackMoon.Front.Services;

public interface ICatalogViewService
{
    Task<IReadOnlyList<AlbumCardModel>> GetCatalogAsync(CancellationToken cancellationToken = default);
    Task<AlbumCardModel> CreateAlbumAsync(AlbumAdminModel model, CancellationToken cancellationToken = default);
    Task<AlbumCardModel> UpdateAlbumAsync(AlbumAdminModel model, CancellationToken cancellationToken = default);
    Task<AlbumCardModel> SetOwnedAsync(int albumId, bool isOwned, CancellationToken cancellationToken = default);
}
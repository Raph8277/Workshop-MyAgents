using BlackMoon.Application.Abstractions.Services;
using BlackMoon.Contracts;
using Grpc.Core;

namespace BlackMoon.Grpc.Services;

public sealed class CatalogGrpcService : CatalogGrpc.CatalogGrpcBase
{
    private readonly ICatalogService _catalogService;

    public CatalogGrpcService(ICatalogService catalogService)
    {
        _catalogService = catalogService;
    }

    public override async Task<GetCatalogReply> GetCatalog(GetCatalogRequest request, ServerCallContext context)
    {
        var albums = await _catalogService.GetCatalogAsync(context.CancellationToken);
        var reply = new GetCatalogReply();
        reply.Items.AddRange(albums.Select(Map));
        return reply;
    }

    public override async Task<GetAlbumReply> GetAlbum(GetAlbumRequest request, ServerCallContext context)
    {
        var album = await _catalogService.GetAlbumAsync(request.Id, context.CancellationToken);
        if (album is null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, $"Album {request.Id} was not found."));
        }

        return new GetAlbumReply
        {
            Album = Map(album)
        };
    }

    public override async Task<GetAlbumReply> CreateAlbum(CreateAlbumRequest request, ServerCallContext context)
    {
        var created = await _catalogService.CreateAlbumAsync(new BlackMoon.Application.Dtos.AlbumUpsertDto(
            null,
            request.VolumeNumber,
            request.Title,
            request.DargaudPublicationDate,
            request.Scenario,
            request.Drawing,
            request.IsbnEan,
            request.ReleaseYear,
            request.Summary,
            request.DargaudUrl,
            request.CoverImageUrl,
            request.SummarySourceUrl,
            request.SeriesCode,
            request.SeriesTitle,
            request.Illustrators.ToArray(),
            request.IsOwned), context.CancellationToken);

        return new GetAlbumReply { Album = Map(created) };
    }

    public override async Task<GetAlbumReply> UpdateAlbum(UpdateAlbumRequest request, ServerCallContext context)
    {
        var updated = await _catalogService.UpdateAlbumAsync(new BlackMoon.Application.Dtos.AlbumUpsertDto(
            request.Id,
            request.VolumeNumber,
            request.Title,
            request.DargaudPublicationDate,
            request.Scenario,
            request.Drawing,
            request.IsbnEan,
            request.ReleaseYear,
            request.Summary,
            request.DargaudUrl,
            request.CoverImageUrl,
            request.SummarySourceUrl,
            request.SeriesCode,
            request.SeriesTitle,
            request.Illustrators.ToArray(),
            request.IsOwned), context.CancellationToken);

        if (updated is null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, $"Album {request.Id} was not found."));
        }

        return new GetAlbumReply { Album = Map(updated) };
    }

    public override async Task<GetAlbumReply> SetAlbumOwned(SetAlbumOwnedRequest request, ServerCallContext context)
    {
        var updated = await _catalogService.SetAlbumOwnedAsync(request.Id, request.IsOwned, context.CancellationToken);

        if (updated is null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, $"Album {request.Id} was not found."));
        }

        return new GetAlbumReply { Album = Map(updated) };
    }

    private static AlbumItem Map(BlackMoon.Application.Dtos.AlbumListItemDto album)
    {
        var item = new AlbumItem
        {
            Id = album.Id,
            VolumeNumber = album.VolumeNumber,
            Title = album.Title,
            DargaudPublicationDate = album.DargaudPublicationDate,
            Scenario = album.Scenario,
            Drawing = album.Drawing,
            IsbnEan = album.IsbnEan,
            ReleaseYear = album.ReleaseYear,
            Summary = album.Summary,
            DargaudUrl = album.DargaudUrl,
            CoverImageUrl = album.CoverImageUrl,
            SummarySourceUrl = album.SummarySourceUrl,
            SeriesTitle = album.SeriesTitle,
            IsOwned = album.IsOwned
        };

        item.Illustrators.AddRange(album.Illustrators);
        return item;
    }

    private static AlbumItem Map(BlackMoon.Application.Dtos.AlbumDetailDto album)
    {
        var item = new AlbumItem
        {
            Id = album.Id,
            VolumeNumber = album.VolumeNumber,
            Title = album.Title,
            DargaudPublicationDate = album.DargaudPublicationDate,
            Scenario = album.Scenario,
            Drawing = album.Drawing,
            IsbnEan = album.IsbnEan,
            ReleaseYear = album.ReleaseYear,
            Summary = album.Summary,
            DargaudUrl = album.DargaudUrl,
            CoverImageUrl = album.CoverImageUrl,
            SummarySourceUrl = album.SummarySourceUrl,
            SeriesCode = album.SeriesCode,
            SeriesTitle = album.SeriesTitle,
            IsOwned = album.IsOwned
        };

        item.Illustrators.AddRange(album.Illustrators);
        return item;
    }
}
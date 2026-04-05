using BlackMoon.Contracts;
using BlackMoon.Front.Models;

namespace BlackMoon.Front.Services;

public sealed class CatalogViewService : ICatalogViewService
{
    private readonly CatalogGrpc.CatalogGrpcClient _client;

    public CatalogViewService(CatalogGrpc.CatalogGrpcClient client)
    {
        _client = client;
    }

    public async Task<IReadOnlyList<AlbumCardModel>> GetCatalogAsync(CancellationToken cancellationToken = default)
    {
        var reply = await _client.GetCatalogAsync(new GetCatalogRequest(), cancellationToken: cancellationToken);

        return reply.Items
            .OrderBy(item => item.SeriesTitle)
            .ThenBy(item => item.VolumeNumber)
            .ThenBy(item => item.Title)
            .Select(Map)
            .ToArray();
    }

    public async Task<AlbumCardModel> CreateAlbumAsync(AlbumAdminModel model, CancellationToken cancellationToken = default)
    {
        var request = new CreateAlbumRequest
        {
            VolumeNumber = model.VolumeNumber,
            Title = model.Title,
            DargaudPublicationDate = model.DargaudPublicationDate,
            Scenario = model.Scenario,
            Drawing = model.Drawing,
            IsbnEan = model.IsbnEan,
            ReleaseYear = model.ReleaseYear,
            Summary = model.Summary,
            DargaudUrl = model.DargaudUrl,
            CoverImageUrl = model.CoverImageUrl,
            SummarySourceUrl = model.SummarySourceUrl,
            SeriesCode = model.SeriesCode,
            SeriesTitle = model.SeriesTitle,
            IsOwned = model.IsOwned
        };
        request.Illustrators.AddRange(ParseIllustrators(string.IsNullOrWhiteSpace(model.IllustratorsText) ? model.Drawing : model.IllustratorsText));

        var reply = await _client.CreateAlbumAsync(request, cancellationToken: cancellationToken);
        return Map(reply.Album);
    }

    public async Task<AlbumCardModel> UpdateAlbumAsync(AlbumAdminModel model, CancellationToken cancellationToken = default)
    {
        if (model.Id is null)
        {
            throw new InvalidOperationException("Album id is required for updates.");
        }

        var request = new UpdateAlbumRequest
        {
            Id = model.Id.Value,
            VolumeNumber = model.VolumeNumber,
            Title = model.Title,
            DargaudPublicationDate = model.DargaudPublicationDate,
            Scenario = model.Scenario,
            Drawing = model.Drawing,
            IsbnEan = model.IsbnEan,
            ReleaseYear = model.ReleaseYear,
            Summary = model.Summary,
            DargaudUrl = model.DargaudUrl,
            CoverImageUrl = model.CoverImageUrl,
            SummarySourceUrl = model.SummarySourceUrl,
            SeriesCode = model.SeriesCode,
            SeriesTitle = model.SeriesTitle,
            IsOwned = model.IsOwned
        };
        request.Illustrators.AddRange(ParseIllustrators(string.IsNullOrWhiteSpace(model.IllustratorsText) ? model.Drawing : model.IllustratorsText));

        var reply = await _client.UpdateAlbumAsync(request, cancellationToken: cancellationToken);
        return Map(reply.Album);
    }

    public async Task<AlbumCardModel> SetOwnedAsync(int albumId, bool isOwned, CancellationToken cancellationToken = default)
    {
        var reply = await _client.SetAlbumOwnedAsync(new SetAlbumOwnedRequest
        {
            Id = albumId,
            IsOwned = isOwned
        }, cancellationToken: cancellationToken);

        return Map(reply.Album);
    }

    private static AlbumCardModel Map(AlbumItem item) => new(
        item.Id,
        item.VolumeNumber,
        item.Title,
        item.DargaudPublicationDate,
        item.Scenario,
        item.Drawing,
        item.IsbnEan,
        item.ReleaseYear,
        item.Summary,
        item.DargaudUrl,
        item.CoverImageUrl,
        item.SummarySourceUrl,
        item.SeriesCode,
        item.SeriesTitle,
        item.Illustrators.ToArray(),
        item.IsOwned);

    private static IReadOnlyList<string> ParseIllustrators(string text)
    {
        return text
            .Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)
            .Where(name => !string.IsNullOrWhiteSpace(name))
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToArray();
    }
}
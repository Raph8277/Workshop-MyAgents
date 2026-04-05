namespace BlackMoon.Front.Models;

public sealed class AlbumAdminModel
{
    public int? Id { get; set; }
    public int VolumeNumber { get; set; }
    public string Title { get; set; } = string.Empty;
    public string DargaudPublicationDate { get; set; } = string.Empty;
    public string Scenario { get; set; } = string.Empty;
    public string Drawing { get; set; } = string.Empty;
    public string IsbnEan { get; set; } = string.Empty;
    public int ReleaseYear { get; set; }
    public string Summary { get; set; } = string.Empty;
    public string DargaudUrl { get; set; } = string.Empty;
    public string CoverImageUrl { get; set; } = string.Empty;
    public string SummarySourceUrl { get; set; } = string.Empty;
    public string SeriesCode { get; set; } = "LUNE-NOIRE";
    public string SeriesTitle { get; set; } = "Les Chroniques de la Lune Noire";
    public string IllustratorsText { get; set; } = string.Empty;
    public bool IsOwned { get; set; }

    public static AlbumAdminModel FromCard(AlbumCardModel album)
    {
        return new AlbumAdminModel
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
            IllustratorsText = string.Join(", ", album.Illustrators),
            IsOwned = album.IsOwned
        };
    }

    public AlbumAdminModel Clone()
    {
        return new AlbumAdminModel
        {
            Id = Id,
            VolumeNumber = VolumeNumber,
            Title = Title,
            DargaudPublicationDate = DargaudPublicationDate,
            Scenario = Scenario,
            Drawing = Drawing,
            IsbnEan = IsbnEan,
            ReleaseYear = ReleaseYear,
            Summary = Summary,
            DargaudUrl = DargaudUrl,
            CoverImageUrl = CoverImageUrl,
            SummarySourceUrl = SummarySourceUrl,
            SeriesCode = SeriesCode,
            SeriesTitle = SeriesTitle,
            IllustratorsText = IllustratorsText,
            IsOwned = IsOwned
        };
    }
}
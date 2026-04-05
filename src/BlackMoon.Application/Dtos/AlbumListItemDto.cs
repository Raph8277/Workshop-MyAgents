namespace BlackMoon.Application.Dtos;

public sealed record AlbumListItemDto(
    int Id,
    int VolumeNumber,
    string Title,
    string DargaudPublicationDate,
    string Scenario,
    string Drawing,
    string IsbnEan,
    int ReleaseYear,
    string Summary,
    string DargaudUrl,
    string CoverImageUrl,
    string SummarySourceUrl,
    string SeriesTitle,
    IReadOnlyList<string> Illustrators,
    bool IsOwned);
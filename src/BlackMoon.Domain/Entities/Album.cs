namespace BlackMoon.Domain.Entities;

public sealed class Album
{
    public int Id { get; set; }
    public int SeriesId { get; set; }
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
    public bool IsOwned { get; set; }
    public Series? Series { get; set; }
    public ICollection<AlbumContributor> Credits { get; set; } = new List<AlbumContributor>();
}
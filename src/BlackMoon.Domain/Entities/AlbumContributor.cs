namespace BlackMoon.Domain.Entities;

public sealed class AlbumContributor
{
    public int AlbumId { get; set; }
    public int ContributorId { get; set; }
    public string ContributionType { get; set; } = string.Empty;
    public Album? Album { get; set; }
    public Contributor? Contributor { get; set; }
}
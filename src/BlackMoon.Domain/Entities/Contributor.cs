namespace BlackMoon.Domain.Entities;

public sealed class Contributor
{
    public int Id { get; set; }
    public string DisplayName { get; set; } = string.Empty;
    public ICollection<AlbumContributor> AlbumContributions { get; set; } = new List<AlbumContributor>();
}
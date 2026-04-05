namespace BlackMoon.Domain.Entities;

public sealed class Series
{
    public int Id { get; set; }
    public string Code { get; set; } = string.Empty;
    public string Title { get; set; } = string.Empty;
    public ICollection<Album> Albums { get; set; } = new List<Album>();
}
using BlackMoon.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace BlackMoon.Infrastructure.Persistence;

public sealed class CatalogDbContext : DbContext
{
    public CatalogDbContext(DbContextOptions<CatalogDbContext> options)
        : base(options)
    {
    }

    public DbSet<Series> Series => Set<Series>();
    public DbSet<Contributor> Contributors => Set<Contributor>();
    public DbSet<Album> Albums => Set<Album>();
    public DbSet<AlbumContributor> AlbumContributors => Set<AlbumContributor>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Series>(entity =>
        {
            entity.ToTable("series");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.Code).HasColumnName("code").IsRequired();
            entity.Property(x => x.Title).HasColumnName("title").IsRequired();
            entity.HasIndex(x => x.Code).IsUnique();
            entity.HasIndex(x => x.Title).IsUnique();
        });

        modelBuilder.Entity<Contributor>(entity =>
        {
            entity.ToTable("contributor");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.DisplayName).HasColumnName("display_name").IsRequired();
            entity.HasIndex(x => x.DisplayName).IsUnique();
        });

        modelBuilder.Entity<Album>(entity =>
        {
            entity.ToTable("album");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.SeriesId).HasColumnName("series_id");
            entity.Property(x => x.VolumeNumber).HasColumnName("volume_number");
            entity.Property(x => x.Title).HasColumnName("title").IsRequired();
            entity.Property(x => x.DargaudPublicationDate).HasColumnName("dargaud_publication_date").IsRequired();
            entity.Property(x => x.Scenario).HasColumnName("scenario").IsRequired();
            entity.Property(x => x.Drawing).HasColumnName("drawing").IsRequired();
            entity.Property(x => x.IsbnEan).HasColumnName("isbn_ean").IsRequired();
            entity.Property(x => x.ReleaseYear).HasColumnName("release_year");
            entity.Property(x => x.Summary).HasColumnName("summary").IsRequired();
            entity.Property(x => x.DargaudUrl).HasColumnName("dargaud_url").IsRequired();
            entity.Property(x => x.CoverImageUrl).HasColumnName("cover_image_url").IsRequired();
            entity.Property(x => x.SummarySourceUrl).HasColumnName("summary_source_url").IsRequired();
            entity.Property(x => x.IsOwned).HasColumnName("is_owned");
            entity.HasIndex(x => x.SeriesId);
            entity.HasIndex(x => new { x.SeriesId, x.VolumeNumber }).IsUnique();
            entity.HasIndex(x => x.ReleaseYear);
            entity.HasIndex(x => x.IsbnEan).IsUnique();
            entity.HasIndex(x => x.DargaudUrl).IsUnique();
            entity.HasIndex(x => x.CoverImageUrl).IsUnique();
            entity.HasOne(x => x.Series)
                .WithMany(x => x.Albums)
                .HasForeignKey(x => x.SeriesId);
        });

        modelBuilder.Entity<AlbumContributor>(entity =>
        {
            entity.ToTable("album_contributor");
            entity.HasKey(x => new { x.AlbumId, x.ContributorId, x.ContributionType });
            entity.Property(x => x.AlbumId).HasColumnName("album_id");
            entity.Property(x => x.ContributorId).HasColumnName("contributor_id");
            entity.Property(x => x.ContributionType).HasColumnName("contribution_type").IsRequired();
            entity.HasOne(x => x.Album)
                .WithMany(x => x.Credits)
                .HasForeignKey(x => x.AlbumId);
            entity.HasOne(x => x.Contributor)
                .WithMany(x => x.AlbumContributions)
                .HasForeignKey(x => x.ContributorId);
            entity.HasIndex(x => x.ContributorId);
        });
    }
}
using BlackMoon.Application.Abstractions.Repositories;
using BlackMoon.Application.Services;
using BlackMoon.Domain.Entities;

namespace BlackMoon.Tests;

public sealed class CatalogServiceTests
{
    [Fact]
    public async Task GetCatalogAsync_OrdersAlbumsByVolumeNumber()
    {
        var repository = new FakeAlbumRepository(
            new Album { Id = 2, VolumeNumber = 2, Title = "Volume 2", ReleaseYear = 1990, Summary = "Second", CoverImageUrl = "cover-2", Series = new Series { Code = "LUNE-NOIRE", Title = "Les Chroniques de la Lune Noire" } },
            new Album { Id = 1, VolumeNumber = 1, Title = "Volume 1", ReleaseYear = 1989, Summary = "First", CoverImageUrl = "cover-1", Series = new Series { Code = "LUNE-NOIRE", Title = "Les Chroniques de la Lune Noire" } });

        var service = new CatalogService(repository, new FakeSeriesRepository(), new FakeContributorRepository());

        var result = await service.GetCatalogAsync();

        Assert.Collection(
            result,
            first => Assert.Equal(1, first.VolumeNumber),
            second => Assert.Equal(2, second.VolumeNumber));
    }

    private sealed class FakeAlbumRepository : IAlbumRepository
    {
        private readonly IReadOnlyList<Album> _albums;

        public FakeAlbumRepository(params Album[] albums)
        {
            _albums = albums;
        }

        public Task<IReadOnlyList<Album>> GetCatalogAsync(CancellationToken cancellationToken = default)
            => Task.FromResult(_albums);

        public Task<Album?> GetByIdAsync(int albumId, CancellationToken cancellationToken = default)
            => Task.FromResult(_albums.SingleOrDefault(album => album.Id == albumId));

        public Task<Album> CreateAsync(Album album, CancellationToken cancellationToken = default)
            => Task.FromResult(album);

        public Task<Album?> UpdateAsync(Album album, CancellationToken cancellationToken = default)
            => Task.FromResult<Album?>(album);
    }

    private sealed class FakeSeriesRepository : ISeriesRepository
    {
        public Task<IReadOnlyList<Series>> GetAllAsync(CancellationToken cancellationToken = default)
            => Task.FromResult<IReadOnlyList<Series>>(Array.Empty<Series>());

        public Task<Series?> GetByCodeAsync(string code, CancellationToken cancellationToken = default)
            => Task.FromResult<Series?>(null);

        public Task<Series> AddAsync(Series series, CancellationToken cancellationToken = default)
            => Task.FromResult(series);
    }

    private sealed class FakeContributorRepository : IContributorRepository
    {
        public Task<IReadOnlyList<Contributor>> GetByDisplayNamesAsync(IEnumerable<string> names, CancellationToken cancellationToken = default)
            => Task.FromResult<IReadOnlyList<Contributor>>(Array.Empty<Contributor>());

        public Task<IReadOnlyList<Contributor>> AddRangeAsync(IEnumerable<Contributor> contributors, CancellationToken cancellationToken = default)
            => Task.FromResult<IReadOnlyList<Contributor>>(contributors.ToArray());
    }
}

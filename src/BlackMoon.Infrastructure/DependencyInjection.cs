using BlackMoon.Application.Abstractions.Repositories;
using BlackMoon.Infrastructure.Persistence;
using BlackMoon.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace BlackMoon.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddBlackMoonInfrastructure(this IServiceCollection services, string connectionString)
    {
        services.AddDbContext<CatalogDbContext>(options => options.UseSqlite(connectionString));
        services.AddScoped<IAlbumRepository, AlbumRepository>();
        services.AddScoped<ISeriesRepository, SeriesRepository>();
        services.AddScoped<IContributorRepository, ContributorRepository>();
        return services;
    }
}
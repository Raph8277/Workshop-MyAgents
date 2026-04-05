using BlackMoon.Application.Abstractions.Services;
using BlackMoon.Application.Services;
using Microsoft.Extensions.DependencyInjection;

namespace BlackMoon.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddBlackMoonApplication(this IServiceCollection services)
    {
        services.AddScoped<ICatalogService, CatalogService>();
        return services;
    }
}
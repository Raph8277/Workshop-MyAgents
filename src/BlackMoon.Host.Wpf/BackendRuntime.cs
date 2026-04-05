using System.IO;
using BlackMoon.Application;
using BlackMoon.Infrastructure;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace BlackMoon.Host.Wpf;

internal static class BackendRuntime
{
    private const int BackendPort = 5117;
    private static WebApplication? _app;

    public static bool IsRunning => _app is not null;

    public static async Task StartAsync(Action<string>? log = null)
    {
        if (_app is not null)
        {
            log?.Invoke("Backend gRPC already running in WPF host.");
            return;
        }

        var repositoryRoot = FindRepositoryRoot();
        var databasePath = Path.Combine(repositoryRoot, "data", "library.sqlite");

        var builder = WebApplication.CreateBuilder(new WebApplicationOptions
        {
            ContentRootPath = repositoryRoot,
            EnvironmentName = Environments.Development
        });

        builder.WebHost.ConfigureKestrel(options =>
        {
            options.ListenLocalhost(BackendPort, listenOptions =>
            {
                listenOptions.Protocols = HttpProtocols.Http2;
            });
        });

        builder.Services.AddGrpc();
        builder.Services.AddGrpcReflection();
        builder.Services.AddBlackMoonApplication();
        builder.Services.AddBlackMoonInfrastructure($"Data Source={databasePath}");

        var app = builder.Build();
        app.MapGrpcReflectionService();
        app.MapGrpcService<WpfCatalogGrpcService>();

        await app.StartAsync();
        _app = app;
        log?.Invoke("Backend gRPC started in-process inside WPF host on http://localhost:5117.");
    }

    public static async Task StopAsync(Action<string>? log = null)
    {
        if (_app is null)
        {
            log?.Invoke("No in-process backend to stop.");
            return;
        }

        await _app.StopAsync();
        await _app.DisposeAsync();
        _app = null;
        log?.Invoke("Backend gRPC stopped.");
    }

    private static string FindRepositoryRoot()
    {
        var current = AppContext.BaseDirectory;
        var directory = new DirectoryInfo(current);

        while (directory is not null)
        {
            if (File.Exists(Path.Combine(directory.FullName, "Workshop-MyAgents.sln")))
            {
                return directory.FullName;
            }

            directory = directory.Parent;
        }

        throw new DirectoryNotFoundException("Repository root could not be located.");
    }
}
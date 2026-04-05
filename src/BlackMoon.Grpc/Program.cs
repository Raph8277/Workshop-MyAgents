using BlackMoon.Application;
using BlackMoon.Grpc.Services;
using BlackMoon.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddGrpc();
builder.Services.AddGrpcReflection();
builder.Services.AddBlackMoonApplication();

var databasePath = Path.GetFullPath(Path.Combine(builder.Environment.ContentRootPath, "..", "..", "data", "library.sqlite"));
builder.Services.AddBlackMoonInfrastructure($"Data Source={databasePath}");

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
	app.MapGrpcReflectionService();
}

app.MapGrpcService<CatalogGrpcService>();
app.MapGet("/", () => "BlackMoon gRPC backend is running. Use a gRPC client from the Blazor front-end.");

app.Run();

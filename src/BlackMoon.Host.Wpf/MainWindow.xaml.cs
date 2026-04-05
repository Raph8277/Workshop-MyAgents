using System.Diagnostics;
using System.IO;
using System.Net.NetworkInformation;
using System.Windows;

namespace BlackMoon.Host.Wpf;

public partial class MainWindow : Window
{
    private const int FrontPort = 5000;
    private const int BackendPort = 5117;
    private readonly Uri _frontUri = new("http://localhost:5000");
    private Process? _frontProcess;

    public MainWindow()
    {
        InitializeComponent();
        Loaded += MainWindow_Loaded;
        Closed += MainWindow_Closed;
    }

    private async void MainWindow_Loaded(object sender, RoutedEventArgs e)
    {
        if (BackendRuntime.IsRunning)
        {
            AddLog("Backend gRPC already running in WPF host.");
        }
        RefreshStatuses();
    }

    private async void StartBackend_Click(object sender, RoutedEventArgs e)
    {
        await BackendRuntime.StartAsync(AddLog);
        RefreshStatuses();
    }

    private async void StopBackend_Click(object sender, RoutedEventArgs e)
    {
        await BackendRuntime.StopAsync(AddLog);
        RefreshStatuses();
    }

    private async void StartFront_Click(object sender, RoutedEventArgs e)
    {
        await BackendRuntime.StartAsync(AddLog);

        if (!IsPortListening(FrontPort))
        {
            _frontProcess = StartDotNetProject("src\\BlackMoon.Front", "BlackMoon.Front");
            AddLog("Blazor front started.");
        }
        else
        {
            AddLog("Blazor front already running.");
        }

        RefreshStatuses();
    }

    private void OpenFront_Click(object sender, RoutedEventArgs e)
    {
        Process.Start(new ProcessStartInfo
        {
            FileName = _frontUri.ToString(),
            UseShellExecute = true
        });

        AddLog("Front URL opened in the default browser.");
    }

    private static Process StartDotNetProject(string relativeProjectPath, string launchProfile)
    {
        var repositoryRoot = FindRepositoryRoot();
        var startInfo = new ProcessStartInfo
        {
            FileName = "dotnet",
            WorkingDirectory = repositoryRoot,
            Arguments = $"run --project {relativeProjectPath} --launch-profile {launchProfile}",
            UseShellExecute = false,
            CreateNoWindow = true
        };

        return Process.Start(startInfo) ?? throw new InvalidOperationException($"Unable to start project {relativeProjectPath}.");
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

    private static bool IsPortListening(int port)
    {
        return IPGlobalProperties.GetIPGlobalProperties()
            .GetActiveTcpListeners()
            .Any(endpoint => endpoint.Port == port);
    }

    private void MainWindow_Closed(object? sender, EventArgs e)
    {
        TryStop(_frontProcess);
    }

    private void RefreshStatuses()
    {
        var backendRunning = BackendRuntime.IsRunning || IsPortListening(BackendPort);
        var frontRunning = IsPortListening(FrontPort);

        BackendStatusText.Text = backendRunning ? "Running" : "Stopped";
        FrontStatusText.Text = frontRunning ? "Running" : "Stopped";
        StatusText.Text = $"Backend: {(backendRunning ? "Running" : "Stopped")}, Front: {(frontRunning ? "Running" : "Stopped")}";
    }

    private void AddLog(string message)
    {
        LogList.Items.Add($"[{DateTime.Now:HH:mm:ss}] {message}");
        LogList.ScrollIntoView(LogList.Items[^1]);
    }

    private static void TryStop(Process? process)
    {
        if (process is null)
        {
            return;
        }

        try
        {
            if (!process.HasExited)
            {
                process.Kill(entireProcessTree: true);
            }
        }
        catch
        {
        }
    }
}
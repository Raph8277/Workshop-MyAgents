using System.Windows;

namespace BlackMoon.Host.Wpf;

public partial class App : System.Windows.Application
{
	protected override void OnStartup(StartupEventArgs e)
	{
		base.OnStartup(e);

		try
		{
			BackendRuntime.StartAsync().GetAwaiter().GetResult();
		}
		catch (Exception exception)
		{
			MessageBox.Show(
				$"Unable to start the in-process gRPC backend.\n\n{exception}",
				"BlackMoon Host WPF",
				MessageBoxButton.OK,
				MessageBoxImage.Error);
		}
	}

	protected override void OnExit(ExitEventArgs e)
	{
		BackendRuntime.StopAsync().GetAwaiter().GetResult();
		base.OnExit(e);
	}
}


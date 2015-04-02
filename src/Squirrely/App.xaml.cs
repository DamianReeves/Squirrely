using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using Squirrel;

namespace Squirrely
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        protected override async void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);
            using (var mgr = new UpdateManager(@"C:\dev\git\samples\squirrel\Squirrely\Releases", "Squirrely", FrameworkVersion.Net45))
            {
                await mgr.UpdateApp();
            }
        }
    }
}

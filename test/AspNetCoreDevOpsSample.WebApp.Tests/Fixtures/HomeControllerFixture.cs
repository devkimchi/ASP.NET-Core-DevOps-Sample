using System;

using AspNetCoreDevOpsSample.WebApp.Controllers;

namespace AspNetCoreDevOpsSample.WebApp.Tests.Fixtures
{
    /// <summary>
    /// This represents the fixture entity for the <see cref="HomeControllerTest"/> class.
    /// </summary>
    public class HomeControllerFixture : IDisposable
    {
        private bool _disposed;

        /// <summary>
        /// Initialises a new instance of the <see cref="HomeControllerFixture"/> class.
        /// </summary>
        public HomeControllerFixture()
        {
            this.HomeController = new HomeController();
        }

        /// <summary>
        /// Gets the <see cref="HomeController"/> instance.
        /// </summary>
        public HomeController HomeController { get; }

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        public void Dispose()
        {
            if (this._disposed)
            {
                return;
            }

            this._disposed = true;
        }
    }
}

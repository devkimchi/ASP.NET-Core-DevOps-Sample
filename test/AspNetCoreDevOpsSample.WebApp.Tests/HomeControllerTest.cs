using AspNetCoreDevOpsSample.WebApp.Controllers;
using AspNetCoreDevOpsSample.WebApp.Tests.Fixtures;

using FluentAssertions;

using Xunit;

namespace AspNetCoreDevOpsSample.WebApp.Tests
{
    /// <summary>
    /// This represents the test entity for the <see cref="HomeController"/> class.
    /// </summary>
    public class HomeControllerTest : IClassFixture<HomeControllerFixture>
    {
        private readonly HomeController _controller;

        /// <summary>
        /// Initialises a new instance of the <see cref="HomeControllerTest"/> class.
        /// </summary>
        /// <param name="fixture"><see cref="HomeControllerFixture"/> instance.</param>
        public HomeControllerTest(HomeControllerFixture fixture)
        {
            this._controller = fixture.HomeController;
        }

        /// <summary>
        /// Tests whether Index should return result or not.
        /// </summary>
        [Fact]
        public void Given_Index_ShouldReturn_Result()
        {
            var action = this._controller.Index();
            var message = this._controller.ViewBag.Message as string;
            message.Should().NotBeNullOrWhiteSpace();
            message.Should().BeEquivalentTo("Hello World");
        }
    }
}

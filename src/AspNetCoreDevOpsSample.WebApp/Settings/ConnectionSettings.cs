namespace AspNetCoreDevOpsSample.WebApp.Settings
{
    /// <summary>
    /// This represents the model entity for the connection string settings.
    /// </summary>
    public class ConnectionSettings
    {
        /// <summary>
        /// Gets or sets the <see cref="DatabaseConnection"/> instance.
        /// </summary>
        public DatabaseConnection Database { get; set; }
    }
}
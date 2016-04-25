namespace AspNetCoreDevOpsSample.WebApp.Settings
{
    /// <summary>
    /// This represents the model entity for the database connection.
    /// </summary>
    public class DatabaseConnection
    {
        /// <summary>
        /// Gets or sets the name of the database.
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets the connection string of the database.
        /// </summary>
        public string ConnectionString { get; set; }
    }
}
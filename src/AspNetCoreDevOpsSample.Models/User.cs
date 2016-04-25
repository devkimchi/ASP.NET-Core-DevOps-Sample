using System;

namespace AspNetCoreDevOpsSample.Models
{
    /// <summary>
    /// This represents the model entity for user.
    /// </summary>
    public class User
    {
        /// <summary>
        /// Gets or sets the user Id.
        /// </summary>
        public Guid UserId { get; set; }

        /// <summary>
        /// Gets or sets the username.
        /// </summary>
        public string Username { get; set; }
    }
}
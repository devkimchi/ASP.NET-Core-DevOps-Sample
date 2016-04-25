using System;

using AspNetCoreDevOpsSample.Models.Extensions;
using AspNetCoreDevOpsSample.Models.Mapping;

using Microsoft.Data.Entity;
using Microsoft.Data.Entity.Infrastructure;

namespace AspNetCoreDevOpsSample.Models
{
    public class SampleDbContext : DbContext
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="SampleDbContext"/> class.
        /// </summary>
        public SampleDbContext()
            : base()
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="SampleDbContext"/> class.
        /// </summary>
        /// <param name="serviceProvider"><see cref="IServiceProvider"/> instance.</param>
        public SampleDbContext(IServiceProvider serviceProvider)
            : base(serviceProvider)
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="SampleDbContext"/> class.
        /// </summary>
        /// <param name="options"><see cref="DbContextOptions"/> instance.</param>
        public SampleDbContext(DbContextOptions options)
            : base(options)
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="SampleDbContext"/> class.
        /// </summary>
        /// <param name="serviceProvider"><see cref="IServiceProvider"/> instance.</param>
        /// <param name="options"><see cref="DbContextOptions"/> instance.</param>
        public SampleDbContext(IServiceProvider serviceProvider, DbContextOptions options)
            : base(serviceProvider, options)
        {
        }

        public DbSet<User> Users { get; set; }

        /// <summary>
        /// Called while entity models are created.
        /// </summary>
        /// <param name="builder"><see cref="ModelBuilder"/> instance.</param>
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<User>().Map(new UserMap());
        }
    }
}
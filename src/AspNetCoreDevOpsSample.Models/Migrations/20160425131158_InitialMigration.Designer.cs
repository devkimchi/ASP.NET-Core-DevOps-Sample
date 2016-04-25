using System;
using Microsoft.Data.Entity;
using Microsoft.Data.Entity.Infrastructure;
using Microsoft.Data.Entity.Metadata;
using Microsoft.Data.Entity.Migrations;
using AspNetCoreDevOpsSample.Models;

namespace AspNetCoreDevOpsSample.Models.Migrations
{
    [DbContext(typeof(SampleDbContext))]
    [Migration("20160425131158_InitialMigration")]
    partial class InitialMigration
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.0-rc1-16348")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("AspNetCoreDevOpsSample.Models.User", b =>
                {
                    b.Property<Guid>("UserId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("Relational:ColumnName", "UserId");

                    b.Property<string>("Username")
                        .IsRequired()
                        .HasAnnotation("MaxLength", 256)
                        .HasAnnotation("Relational:ColumnName", "Username");

                    b.HasKey("UserId");

                    b.HasAnnotation("Relational:TableName", "User");
                });
        }
    }
}

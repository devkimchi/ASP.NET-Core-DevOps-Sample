using System;

using AspNetCoreDevOpsSample.Models.Mapping;

using Microsoft.Data.Entity.Metadata.Builders;

namespace AspNetCoreDevOpsSample.Models.Extensions
{
    /// <summary>
    /// This represents the extension entity for the <see cref="EntityTypeBuilder{TEntity}"/> class.
    /// </summary>
    public static class EntityTypeBuilderExtenions
    {
        /// <summary>
        /// Maps entity model through entity type builder.
        /// </summary>
        /// <typeparam name="TEntity">Entity model class type.</typeparam>
        /// <typeparam name="TMapper">Entity model mapper type.</typeparam>
        /// <param name="builder"><see cref="EntityTypeBuilder{TEntity}"/> instance.</param>
        /// <param name="mapper"><see cref="IEntityMapper{TEntity}"/> instance.</param>
        public static void Map<TEntity, TMapper>(this EntityTypeBuilder<TEntity> builder, TMapper mapper)
            where TEntity : class where TMapper : IEntityMapper<TEntity>
        {
            if (builder == null)
            {
                throw new ArgumentNullException(nameof(builder));
            }

            if (mapper == null)
            {
                throw new ArgumentNullException(nameof(mapper));
            }

            mapper.Map(builder);
        }
    }
}
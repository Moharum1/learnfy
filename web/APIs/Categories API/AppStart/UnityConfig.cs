using Unity;
using Unity.WebApi;
using System.Web.Http;
using IBSRA.Data;
using IBSRA.Repositories;
using IBSRA.Services;
using AutoMapper;
using IBSRA.Mapping;

namespace IBSRA
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
            var container = new UnityContainer();

            // Register DbContext
            container.RegisterType<AppDbContext>(new ContainerControlledLifetimeManager());

            // Repository Layer
            container.RegisterType<ICategoryRepository, CategoryRepository>();

            // Service Layer
            container.RegisterType<ICategoryService, CategoryService>();

            // Register AutoMapper
            var mapperConfig = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<MappingProfile>();
            });
            container.RegisterInstance(mapperConfig.CreateMapper());

            // Set dependency resolver
            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}

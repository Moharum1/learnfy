using System.Web.Http;

namespace IBSRA
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Enable dependency injection
            UnityConfig.RegisterComponents();

            // Enable CORS
            config.EnableCors();

            // Configure JSON formatting
            config.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling = 
                Newtonsoft.Json.ReferenceLoopHandling.Ignore;

            // Map routes
            config.MapHttpAttributeRoutes();

            // Remove XML formatter
            config.Formatters.Remove(config.Formatters.XmlFormatter);
        }
    }
}

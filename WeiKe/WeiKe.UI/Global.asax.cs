using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WeiKe.UI
{
    // 注意: 有关启用 IIS6 或 IIS7 经典模式的说明，
    // 请访问 http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                "Login", // Route name
                "login.html", // URL with parameters
                new { controller = "Account", action = "Login" } // Parameter defaults
            );


            routes.MapRoute(
                "Index", // Route name
                "index.html", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

            //验证码
            routes.MapRoute(
                "validateCode", // Route name
                "validateCode.html", // URL with parameters
                new { controller = "Home", action = "ValidateCode" }
            );      

            routes.MapRoute(
                "News-action", // Route name
                "news-{action}.html", // URL with parameters
                new { controller = "News", action = "Commonweal" } // Parameter defaults
            );

            routes.MapRoute(
                "News", // Route name
                "news.html", // URL with parameters
                new { controller = "News", action = "Index" } // Parameter defaults
            );

            routes.MapRoute(
                "NewDetail", // Route name
                "new-{id}.html", // URL with parameters
                new { controller = "News", action = "Detail", id = UrlParameter.Optional } // Parameter defaults
            );



            routes.MapRoute(
                "About", // Route name
                "about.html", // URL with parameters
                new { controller = "About", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);
        }
    }
}
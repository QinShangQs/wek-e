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
                new { controller = "Account", action = "LogOn" } // Parameter defaults
            );

            routes.MapRoute(
                "Register", // Route name
                "register.html", // URL with parameters
                new { controller = "Account", action = "Register" } // Parameter defaults
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
                "About", // Route name
                "about.html", // URL with parameters
                new { controller = "Home", action = "About", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "Center", // Route name
                "center.html", // URL with parameters
                new { controller = "Center", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "CenterDetail", // Route name
                "center-{id}.html", // URL with parameters
                new { controller = "Center", action = "Detail", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
               "Course", // Route name
               "course.html", // URL with parameters
               new { controller = "Course", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
               "CourseSub", // Route name
               "course-{id}.html", // URL with parameters
               new { controller = "Course", action = "Detail", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
               "CourseItem", // Route name
               "courseitem-{id}.html", // URL with parameters
               new { controller = "Course", action = "Itemx", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
               "TeacherSub", // Route name
               "teacher-{id}.html", // URL with parameters
               new { controller = "Teachers", action = "Detail", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "Teachers", // Route name
                "teachers.html", // URL with parameters
                new { controller = "Teachers", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "My", // Route name
                "my.html", // URL with parameters
                new { controller = "My", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "Error", // Route name
                "error.html", // URL with parameters
                new { controller = "Error", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "Error404", // Route name
                "404.html", // URL with parameters
                new { controller = "Error", action = "A404", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "Error403", // Route name
                "403.html", // URL with parameters
                new { controller = "Error", action = "A403", id = UrlParameter.Optional } // Parameter defaults
            );

            //routes.MapRoute(
            //    "News-action", // Route name
            //    "news-{action}.html", // URL with parameters
            //    new { controller = "News", action = "Commonweal" } // Parameter defaults
            //);

            //routes.MapRoute(
            //    "News", // Route name
            //    "news.html", // URL with parameters
            //    new { controller = "News", action = "Index" } // Parameter defaults
            //);

            //routes.MapRoute(
            //    "NewDetail", // Route name
            //    "new-{id}.html", // URL with parameters
            //    new { controller = "News", action = "Detail", id = UrlParameter.Optional } // Parameter defaults
            //);


            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WeiKe.UI.Controllers
{
    public class ErrorController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult A404()
        {
            return View();
        }

        public ActionResult A403()
        {
            return View();
        }

    }
}

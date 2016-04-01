using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiKe.Service;

namespace WeiKe.UI.Controllers
{
    [Authorize]
    public class MyController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Info()
        {
            ViewData["grads"] = CategroyService.FindByParent(0);
            ViewData["cates"] = CategroyService.FindByParent(1);
            return View();
        }

        public ActionResult HeaderImg()
        {

            ViewData["grads"] = CategroyService.FindByParent(0);
            ViewData["cates"] = CategroyService.FindByParent(1);
            return View();
        }

        public ActionResult Reset() 
        {
            return View();
        }
    }
}

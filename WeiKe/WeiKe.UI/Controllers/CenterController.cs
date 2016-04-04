using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiKe.Service;

namespace WeiKe.UI.Controllers
{
    public class CenterController : Controller
    {
        //
        // GET: /Center/

        public ActionResult Index()
        {
            return View(ActionsService.RetrievesAll());
        }

        public ActionResult Detail(int id) 
        {
            return View(ActionsService.GetById(id));
        }
    }
}

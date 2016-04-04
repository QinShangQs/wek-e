using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiKe.Model;
using WeiKe.Service;

namespace WeiKe.UI.Controllers
{
    [Authorize]
    public class MyActionController : BaseController
    {
        public ActionResult Index()
        {
            return View(ActionsService.RetrievesAll());
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(string name, string begint, string endt, string content)
        {
            Actions action = new Actions
            {
                name = name,
                begint = begint,
                endt = endt,
                content = content
            };
            bool success = ActionsService.Create(action);
            if (success)
            {
                ViewData["resp"] = base.RespResult(true, "添加成功！！");
            }
            else
            {
                ViewData["resp"] = base.RespResult(false, "操作失败，请稍后重试！");
            }

            return View();
        }

        public ActionResult Remove(int id)
        {
            bool success = ActionsService.Remove(id);
            if (success)
            {
                return Json(base.RespResult(true, "删除成功！"));
            }
            else
            {
                return Json(base.RespResult(false, "删除失败，请稍后重试！"));
            }
        }
    }
}

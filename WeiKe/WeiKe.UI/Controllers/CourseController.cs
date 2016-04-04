using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiKe.Service;
using WeiKe.Model;

namespace WeiKe.UI.Controllers
{
    public class CourseController : BaseController
    {
        //
        // GET: /Course/

        public ActionResult Index(string g = "", string c = "", string key = "")
        {
            ViewData["grads"] = CategroyService.FindByParent(0);
            ViewData["cates"] = CategroyService.FindByParent(1);

            ViewData["g"] = g;
            ViewData["c"] = c;
            ViewData["key"] = key;
            IList<Course> list = CourseService.RetrievesAll();
            if (!string.IsNullOrEmpty(g))
            {
                list = list.Where(m => m.grad == g).ToList();
            }
            if (!string.IsNullOrEmpty(c))
            {
                list = list.Where(m => m.categoryName == c).ToList();
            }
            if (!string.IsNullOrEmpty(key))
            {
                list = list.Where(m => m.title.Contains(key)).ToList();
            }
            return View(list);
        }

        public ActionResult Detail(int id)
        {
            return View(CourseService.GetById(id));
        }

        public ActionResult Itemx(int id)
        {
            ViewData["cmts"] = CommentsService.RetrievesByCourseItemId(id);
            return View(CourseItemService.GetById(id));
        }
        [HttpPost]
        public ActionResult Send(string content, int courseItemId)
        {
            bool success = CommentsService.Create(new Comments
            {
                courseItemId = courseItemId,
                content = content,
                userName = base.CurrentUser.name
            });
            if (success)
            {
                return Json(base.RespResult(true, "评论成功，请稍后刷新页面查看！"));
            }
            else
            {
                return Json(base.RespResult(false, "操作失败，请稍后重试！"));
            }
        }
    }
}

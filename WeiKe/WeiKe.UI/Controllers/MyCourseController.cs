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
    public class MyCourseController : BaseController
    {
        public ActionResult Index()
        {
            return View(CourseService.RetrievesByTeacher(base.CurrentUser.id));
        }

        public ActionResult Create()
        {
            return View(base.CurrentUser);
        }

        [HttpPost]
        public ActionResult Create(string title, string unionNumber, string remark, string pathName)
        {
            Course course = new Course
            {
                title = title,
                remark = remark,
                unionNumber = unionNumber,
                teacherId = base.CurrentUser.id,
                grad = base.CurrentUser.grad,
                categoryName = base.CurrentUser.category.title,
                picture = pathName
            };

            string message = string.Empty;
            int newId = 0;
            bool success = CourseService.Create(course, ref message, ref newId);
            if (success)
            {
                return Redirect("/MyCourse/DetailItem?id=" + newId);
            }
            else
            {
                ViewData["resp"] = base.RespResult(false, message);
                return View(base.CurrentUser);
            }
        }

        public ActionResult Remove(int id) 
        {
            bool success = CourseService.Remove(id);
            if (success)
            {
                return Json(base.RespResult(true, "删除成功！"));
            }
            else
            {
                return Json(base.RespResult(false, "删除失败，请稍后重试！"));
            }
        }

        public ActionResult DetailItem(int id)
        {
            Course course = CourseService.GetById(id);
            return View(course);
        }

        [HttpPost]
        public ActionResult DetailItem(int courseId, string title, string remark, string filePath)
        {
            CourseItem item = new CourseItem
            {
                courseId = courseId,
                title = title,
                remark = remark,
                filePath = filePath
            };
            bool success = CourseItemService.Create(item);
            if (success)
            {
                ViewData["resp"] = base.RespResult(true, "上传成功！");
            }
            else
            {
                ViewData["resp"] = base.RespResult(false, "上传失败，请稍后重试！");
            }


            Course course = CourseService.GetById(courseId);
            return View(course);
        }

        [HttpPost]
        public ActionResult RemoveItem(int id)
        {
            bool success = CourseItemService.Remove(id);
            if (success)
            {
                return Json(base.RespResult(true, "删除成功！"));
            }
            else
            {
                return Json(base.RespResult(false, "删除失败，请稍后重试！"));
            }
        }

        public ActionResult Edit(int id)
        {
            return View();
        }
    }
}

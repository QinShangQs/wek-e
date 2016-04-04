using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiKe.Service;

namespace WeiKe.UI.Controllers
{
    public class TeachersController : Controller
    {
        //
        // GET: /Teachers/

        public ActionResult Index()
        {

            return View(UsersService.FindByRoleName(UsersService._TEACHER));
        }

        public ActionResult Detail(int id)
        {
            ViewData["Courses"] = CourseService.RetrievesByTeacher(id);
            return View(UsersService.GetById(id));
        }
    }
}

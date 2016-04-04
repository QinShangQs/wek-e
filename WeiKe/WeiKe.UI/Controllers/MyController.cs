using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiKe.Service;
using WeiKe.Model;

namespace WeiKe.UI.Controllers
{
    [Authorize]
    public class MyController : BaseController
    {

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Info()
        {
            ViewData["grads"] = CategroyService.FindByParent(0);
            ViewData["cates"] = CategroyService.FindByParent(1);
            if (base.CurrentUser.roleName == UsersService._STUDENT)
            {
                return View(base.CurrentUser);
            }
            else 
            {
                return View("InfoTeacher", base.CurrentUser);
            }
            
        }

        [HttpPost]
        public ActionResult Info(string phone, string grad,string school,string parentName, string parentPhone,
            //教师属性
            string email, int categoryId, string degree, string experience)
        {
            ViewData["grads"] = CategroyService.FindByParent(0);
            ViewData["cates"] = CategroyService.FindByParent(1);
            Users user = base.CurrentUser;
            user.phone = phone;
            user.grad = grad;
            user.school = school;
            user.parentName = parentName;
            user.parentPhone = parentPhone;
            user.email = email;
            user.categoryId = categoryId;
            user.degree = degree;
            user.experience = experience;

            bool success = UsersService.Edit(user);
            if (success)
            {
                FormsAuthent(user);
                ViewData["resp"] = base.RespResult(true, "资料更新成功!");
            }
            else
            {
                ViewData["resp"] = base.RespResult(false, "操作失败请稍后重试！");
            }

            if (base.CurrentUser.roleName == UsersService._STUDENT)
            {
                return View(user);
            }
            else
            {
                return View("InfoTeacher", user);
            }
        }

        public ActionResult HeaderImg()
        {
            return View(base.CurrentUser);
        }

        [HttpPost]
        public ActionResult HeaderImg(string pathName) 
        {
            Users user = base.CurrentUser;
            user.headerImg = pathName;
            bool success = UsersService.Edit(user);
            if (success)
            {
                FormsAuthent(user);
                ViewData["resp"] =  (base.RespResult(true, "头像更新成功!"));
            }
            else
            {
                ViewData["resp"] = (base.RespResult(true, "操作失败请稍后重试！"));
            }
            return View(user);
        }

        public ActionResult Reset() 
        {
            return View();
        }

        [HttpPost]
        public ActionResult Reset(string oldPwd, string pwd) 
        {
            if (oldPwd != base.CurrentUser.pwd)
            {
                ViewData["resp"] = base.RespResult(false, "原始密码错误!");
            }
            else 
            {
                Users user = base.CurrentUser;
                user.pwd = pwd;
                if (UsersService.Edit(user))
                {
                    ViewData["resp"] = base.RespResult(true, "密码重置成功，请下次登录时使用新密码!");
                }
                else 
                {
                    ViewData["resp"] = base.RespResult(false, "操作失败，请稍后重试!");
                }
            }
            return View();
        }
    }
}

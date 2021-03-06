﻿using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using WeiKe.UI.Models;
using WeiKe.Service;
using WeiKe.Model;
using System.Web.Script.Serialization;
using WeiKe.Infrastructure;

namespace WeiKe.UI.Controllers
{

    [HandleError]
    public class AccountController : BaseController
    {
     

        [HttpPost]
        public ActionResult AjaxLogin(string userName, string password)
        {
            string message = string.Empty;
            Users user = LoginService.Login(userName, password, ref message);
            if (string.IsNullOrEmpty(message))
            {
                FormsAuthent(user);
                return Json(new { Success = true, Message = string.Empty });
            }
            else
            {
                return Json(new { Success = false, Message = message });
            }

        }


        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            Session.RemoveAll();
            Session.Abandon();
            return Redirect("/");
        }

        public ActionResult Register(string act = "")
        {
            ViewData["grads"] = CategroyService.FindByParent(0);
            ViewData["cates"] = CategroyService.FindByParent(1);
            if (act == "teacher") 
            {                
                return View("RegisterTeacher");
            }
            return View();
        }
        [HttpPost]
        public ActionResult Register(string name, string pwd, string phone, string validateCode, string roleName, string grad, 
            //教师属性
            string email, int categoryId, string degree, string experience)
        {
            ViewData["grads"] = CategroyService.FindByParent(0);
            ViewData["cates"] = CategroyService.FindByParent(1);
            Users student = new Users
            {
                name = name,
                pwd = pwd,
                phone = phone,
                roleName = roleName,
                grad = grad,
                email = email,
                categoryId = categoryId,
                degree = degree,
                experience = experience
            };

            if (validateCode != base.GetSessionByKey("ValidateCode"))
            {
                ViewData["resp"] = base.RespResult(false,"验证码错误");
            }
            else 
            {
                string message = string.Empty;
                Users user = LoginService.Register(student, ref message);
                if (string.IsNullOrEmpty(message))
                {
                    FormsAuthent(user);
                    ViewData["resp"] = base.RespResult(true, "注册成功!");
                }
                else 
                {
                    ViewData["resp"] = base.RespResult(false, message);
                }                
            }

            return View();
        }


    }
}

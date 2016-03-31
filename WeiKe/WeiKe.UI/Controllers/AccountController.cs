using System;
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

namespace WeiKe.UI.Controllers
{

    [HandleError]
    public class AccountController : Controller
    {

        public ActionResult LogOn()
        {
            return View();
        }


        [HttpPost]
        public ActionResult LogOn(string userName, string password, string returnUrl)
        {
            string message = string.Empty;
            Users user = LoginService.Login(userName, password, ref message);
            if (user != null)
            {
                FormsAuthentication.SetAuthCookie(userName, false);
                if (!String.IsNullOrEmpty(returnUrl))
                    return Redirect(returnUrl);
                else
                    return Redirect("/index.html");
            }
            else
            {
                ModelState.AddModelError("", message);
            }

            return View();
        }


        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            Session.RemoveAll();
            Session.Abandon();
            return Redirect("/");
        }

        public ActionResult Register()
        {
            return View();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiKe.UI.Models;
using WeiKe.Model;
using WeiKe.Infrastructure;
using System.Text;
using System.Web.Security;

namespace WeiKe.UI.Controllers
{
    public class BaseController : Controller
    {
        protected const int _PAGE_SIZE = 1;

        protected Response RespResult(bool success, string message) 
        {
            return new Response { Success = success, Message = message };
        }

        protected string GetSessionByKey(string key) 
        {
            if (Session[key] != null)
                return Session[key].ToString();
            return string.Empty;
        }

        protected static void FormsAuthent(Users user)
        {
            FormsAuthentication.SetAuthCookie(CommonUtil.Serialize(user), false);
        }

        protected Users CurrentUser 
        {
            get 
            {
                try
                {
                    return CommonUtil.DeSerialize<Users>(User.Identity.Name);
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }

        
    }


}
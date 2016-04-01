using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiKe.UI.Models;

namespace WeiKe.UI.Controllers
{
    public class BaseController : Controller
    {
        public Response RespResult(bool success, string message) 
        {
            return new Response { Success = success, Message = message };
        }
    }


}
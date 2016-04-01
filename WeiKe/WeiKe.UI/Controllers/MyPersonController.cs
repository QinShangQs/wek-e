using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WeiKe.Service;

namespace WeiKe.UI.Controllers
{
    [Authorize]
    public class MyPersonController : BaseController
    {

        public ActionResult Students(int page = 1) 
        {
            return Pager(page,UsersService._STUDENT);
        }

        
        public ActionResult Teachers(int page = 1)
        {
            return Pager(page, UsersService._TEACHER);
        }

        private ActionResult Pager(int page, string roleName)
        {
            var list = UsersService.FindByRoleName(roleName).OrderByDescending(m => m.id).ToList();
            PagerInfo pager = new PagerInfo
            {
                CurrentPageIndex = page,
                PageSize = _PAGE_SIZE,
                RecordCount = list.Count
            };
            ViewData["pager"] = pager;
            return View(list.Skip((page - 1) * pager.PageSize).Take(pager.PageSize).ToList());
        }

    }
}

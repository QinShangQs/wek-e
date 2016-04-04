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
using System.IO;

namespace WeiKe.UI.Controllers
{
    public class BaseController : Controller
    {
        protected const int _PAGE_SIZE = 20;

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

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult Upload(HttpPostedFileBase fileData)
        {
            if (fileData != null)
            {
                try
                {
                    // 文件上传后的保存路径
                    string filePath = Server.MapPath("~/Uploads/") + DateTime.Now.ToString("yyyy-MM-dd") + "\\";
                    if (!Directory.Exists(filePath))
                    {
                        Directory.CreateDirectory(filePath);
                    }
                    string fileName = Path.GetFileName(fileData.FileName);// 原始文件名称
                    string fileExtension = Path.GetExtension(fileName); // 文件扩展名
                    string saveName = Guid.NewGuid().ToString() + fileExtension; // 保存文件名称

                    fileData.SaveAs(filePath + saveName);

                    string pathName = "/Uploads/" + DateTime.Now.ToString("yyyy-MM-dd") + "/" + saveName;

                    return Json(new { Success = true, FileName = fileName, SaveName = saveName, PathName = pathName });
                }
                catch (Exception ex)
                {
                    return Json(new { Success = false, Message = ex.Message }, JsonRequestBehavior.AllowGet);
                }
            }
            else
            {

                return Json(new { Success = false, Message = "请选择要上传的文件！" }, JsonRequestBehavior.AllowGet);
            }
        }
    }


}
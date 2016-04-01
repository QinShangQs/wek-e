using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;

namespace System.Web.Mvc
{
    public class PagerInfo
    {
        public int RecordCount { get; set; }
        public int CurrentPageIndex { get; set; }
        public int PageSize { get; set; }
        //放置查询参数
        public Dictionary<string, string> SearchParameter { get; set; }
    }

    public static class HtmlHelpers
    {
        /// <summary>
        /// 街区字符串
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="orientStr"></param>
        /// <param name="length"></param>
        /// <returns></returns>        
        public static string CustStr(this HtmlHelper helper, string orientStr, int length)
        {
            if (orientStr.Length >= length)
            {
                orientStr = orientStr.Substring(0, length) + "...";
            }

            return orientStr;
        }

        public static HtmlString ShowPageNavigate(this HtmlHelper htmlHelper, int currentPage, int pageSize, int totalCount, Dictionary<string, string> parameters = null)
        {
            var redirectTo = htmlHelper.ViewContext.RequestContext.HttpContext.Request.Url.AbsolutePath;
            pageSize = pageSize == 0 ? 3 : pageSize;
            var totalPages = Math.Max((totalCount + pageSize - 1) / pageSize, 1); //总页数
            string searchCode = string.Empty;
            if (parameters != null)
            {
                searchCode = UrlGetParameter(parameters);
            }
            var output = new StringBuilder("<ul class='pagination pagination-sm' style='margin-top:auto;float:right'>");
            if (totalPages > 1)
            {
                output.AppendFormat("<li><a class='pageLink' href='{0}?page=1{1}'>首页</a></li> ", redirectTo, searchCode);
                if (currentPage > 1)
                {//处理上一页的连接
                    output.AppendFormat("<li><a class='pageLink' href='{0}?page={1}{2}'>上一页</a></li> ", redirectTo, currentPage - 1, searchCode);
                }

                output.Append(" ");
                int currint = 5;
                for (int i = 0; i <= 10; i++)
                {//一共最多显示10个页码，前面5个，后面5个
                    if ((currentPage + i - currint) >= 1 && (currentPage + i - currint) <= totalPages)
                    {
                        if (currint == i)
                        {//当前页处理                            
                            output.AppendFormat("<li  class='active'><a href='{0}?page={1}{2}'>{3}</a></li> ", redirectTo, currentPage, searchCode, currentPage);
                        }
                        else
                        {//一般页处理
                            output.AppendFormat("<li><a class='pageLink' href='{0}?page={1}{3}'>{2}</a></li> ", redirectTo, currentPage + i - currint, currentPage + i - currint, searchCode);
                        }
                    }
                    output.Append(" ");
                }
                if (currentPage < totalPages)
                {//处理下一页的链接
                    output.AppendFormat("<li><a class='pageLink' href='{0}?page={1}{2}'>下一页</a></li> ", redirectTo, currentPage + 1, searchCode);
                }

                output.Append(" ");
                if (currentPage != totalPages)
                {
                    output.AppendFormat("<li><a class='pageLink' href='{0}?page={1}{2}'>末页</a></li> ", redirectTo, totalPages, searchCode);
                }
                output.Append(" ");
            }
            //output.AppendFormat("<label>第{0}页 / 共{1}页</label>", currentPage, totalPages);//这个统计加不加都行
            output.Append("</ul>");
            return new HtmlString(output.ToString());
        }

        /// <summary>
        /// 根据查询字典，拼写查询参数
        /// </summary>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static string UrlGetParameter(Dictionary<string, string> parameters)
        {
            if (parameters != null && parameters.Count > 0)
            {
                StringBuilder sb = new StringBuilder();
                foreach (var item in parameters)
                {
                    sb.Append("&" + item.Key.ToLower() + "=" + item.Value);
                }
                return sb.ToString();
            }
            else
            {
                return "";
            }
        }

    }
}
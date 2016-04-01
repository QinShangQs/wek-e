using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiKe.UI.Views.Shared
{
    public partial class My : System.Web.UI.MasterPage
    {
        protected WeiKe.Model.Users userInfo = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Page.User.Identity.IsAuthenticated)
                userInfo = WeiKe.Infrastructure.CommonUtil.DeSerialize<WeiKe.Model.Users>(Page.User.Identity.Name);
        }
    }
}
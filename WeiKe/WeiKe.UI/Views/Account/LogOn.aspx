<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeiKe.UI.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    登录
</asp:Content>
<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
 
        <div style="width: 350px; float: right; margin-top: 50px">
            <% if (Html.ValidationSummary() != null)
               {%>
            <div id="myAlert" class="alert alert-warning">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                <%: Html.ValidationSummary() %>
            </div>
            <%} %>
            <div class="panel panel-default">
                <div class="panel-body">
                    <h5>登录</h5>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="post">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-2 control-label">
                            账号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="firstname" placeholder="请输入账号" name="userName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastname" class="col-sm-2 control-label">
                            密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="lastname" placeholder="请输入密码" name="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">
                                登录</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="/register.html">快速注册</a>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>

</asp:Content>

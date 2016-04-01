<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
            <div style="height:3px"></div>
            <% if (ViewData["resp"] != null) {
                   if (((dynamic)ViewData["resp"]).Success)
                   {
                   %>
                    <div class="alert alert-success">
                        <%:((dynamic)ViewData["resp"]).Message%>，正在登录...
                        <script type="text/javascript">
                            setTimeout(function () {
                                location.href = "/center.html";
                            });                            
                        </script>
                    </div>
                   <%
                   }
                   else 
                   {
                    %>
                    <div class="alert alert-danger"><%:((dynamic)ViewData["resp"]).Message%></div>
                    
                   <%
                   }
              } %>
            <form id="f1" role="form" style="width: 300px; margin: auto" action="" method=post>
            <fieldset>
                
                <div class="form-group">
                    <label class="control-label">
                        账号</label>
                    <div class="controls">
                        <input name="name" type="text" placeholder="必填项" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">
                        密码</label>
                    <div class="controls">
                        <input id="pwd" name="pwd" type="password" placeholder="必填项" class="form-control"
                            required onchange="checkPasswords()">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">
                        确认密码</label>
                    <div class="controls">
                        <input id="pwd1" name="pwd1" type="password" placeholder="必填项" class="form-control"
                            required onchange="checkPasswords()">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label" for="input01">
                        移动电话</label>
                    <div class="controls">
                        <input name="phone" type="text" placeholder="必填项" class="form-control"
                        pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$" required="required"  />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label" for="input01">
                        验证码</label>
                    <div class="controls">
                        <table width="100%">
                            <tr>
                                <td>
                                    <input name="validateCode" type="text" placeholder="必填项" class="form-control" style="width: 100px;"
                                        required>
                                </td>
                                <td>
                                    <img style="float: right" src="/ValidateCode.html" id="imgCode" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">
                        年级</label>
                    <div id="controls" class="controls">
                        <% foreach (WeiKe.Model.Category grad in (IList<WeiKe.Model.Category>)ViewData["grads"])
                           { %>
                           
                            <button gradId="<%:grad.id %>" gradTitle='<%:grad.title %>' type="button" class="btn btn-default">
                            <%:grad.title %></button>
                        <%} %>
                    </div>
                    <div id="alert_grad" class="alert alert-warning" style="display:none">请选择年级！</div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="roleName" value="学生" />
                    <input type="hidden" name="categoryId" value="0"/>
                    <input type="hidden" id="grad" name="grad" value=""/>
                    <button id="ok" class="btn btn-primary" type="submit" style="width: 100%;">
                        保存</button>
                </div>
            </fieldset>
            </form>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
    重置密码
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>个人信息</li>
        <li class="active">个人资料</li>
    </ol>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeiKe.UI.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    注册
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <ul id="myTab" class="nav nav-tabs">
        <li class="active"><a href="#" data-toggle="tab">学生</a></li>
        <li><a href="/register.html?act=teacher" >教师</a></li>
    </ul>


    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="home">
            <div style="height:3px"></div>
            <% if (ViewData["resp"] != null) {
                   if (((dynamic)ViewData["resp"]).Success)
                   {
                   %>
                    <div class="alert alert-success">
                        <%:((dynamic)ViewData["resp"]).Message%>，正在登录...
                        <script type="text/javascript">
                            setTimeout(function () {
                                location.href = "/my.html";
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
                            required rangelength='[6,10]'>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">
                        确认密码</label>
                    <div class="controls">
                        <input id="confirm_password"  name="confirm_password" type="password" placeholder="必填项" 
                        equalTo="#pwd" class="form-control" required >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label" for="input01">
                        移动电话</label>
                    <div class="controls">
                        <input name="phone" type="text" placeholder="必填项" class="form-control" digits='true'
                            minlength=11 maxlength=11    required="required"  />
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
                    <button id="ok" class="btn btn-default" type="submit" style="width: 100%; background-color: #f17700">
                        立即注册</button>
                </div>
            </fieldset>
            </form>
        </div>

    </div>
	<script type="text/javascript">
	    $("#controls").find("button").click(function () {
	        $("#controls").find("button").removeClass('active');
	        $(this).addClass('active');
	        $("#grad").val($(this).attr('gradTitle'));
	    });

	    $("#f1").submit(function () {
	        $("#alert_grad").hide();
	        if ($("#controls").find(".active").length == 0) {
	            $("#alert_grad").show();
	            return false;
	        }
	    });

	    function checkval() {
	        $("#alert_grad").hide();
	        if ($("#controls").find(".active").length == 0) {
	            $("#alert_grad").show();
	            return false;
	        }
	        return true;
        }

	    $("#imgCode").click(function () {
	        $(this).attr('src', "/ValidateCode.html?r="+Math.random());
	    });

	    $("#imgCode").click();
	</script>
    <%: Html.Partial("ValidateUserControl")%>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WeiKe.UI.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    注册
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <ul id="myTab" class="nav nav-tabs">
        <li ><a href="/register.html" >学生</a></li>
        <li class="active"><a href="#" >教师</a></li>
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
                    <label class="control-label">
                        邮箱</label>
                    <div class="controls">
                        <input name="email" type="email" placeholder="必填项" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">
                        学历</label>
                    <div class="controls">
                        <input name="degree" type="text" placeholder="必填项" class="form-control" required>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="control-label">
                        经验</label>
                    <div class="controls">
                        <input name="experience" type="text" placeholder="必填项（如3年）" class="form-control" required>
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
                    <label class="control-label">
                        科目</label>
                    <div id="cats" class="controls">
                        <% foreach (WeiKe.Model.Category cat in (IList<WeiKe.Model.Category>)ViewData["cates"])
                           { %>
                           
                            <button catId="<%:cat.id %>" catTitle='<%:cat.title %>' type="button" class="btn btn-default">
                            <%:cat.title%></button>
                        <%} %>
                    </div>
                    <div id="alert_cat" class="alert alert-warning" style="display:none">请选择科目！</div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="roleName" value="教师" />
                    <input type="hidden" id="categoryId" name="categoryId" value="0"/>
                    <input type="hidden" id="grad" name="grad" value=""/>
                    <button id="ok" class="btn btn-default" type="submit" style="width: 100%; background-color: #f17700">
                        立即注册</button>
                </div>
            </fieldset>
            </form>
        </div>

    </div>
	<script type="text/javascript">
	    function checkPasswords() {
	        var passl = document.getElementById("pwd");
	        var pass2 = document.getElementById("pwd1");
	        if (passl.value != pass2.value)
	            passl.setCustomValidity("两次密码必须输入一致！");
	        else
	            passl.setCustomValidity('');
	    }


	    $("#controls").find("button").click(function () {
	        $("#controls").find("button").removeClass('active');
	        $(this).addClass('active');
	        $("#grad").val($(this).attr('gradTitle'));
	    });

	    $("#cats").find("button").click(function () {
	        $("#cats").find("button").removeClass('active');
	        $(this).addClass('active');
	        $("#categoryId").val($(this).attr('catId'));
	    });

	    $("#f1").submit(function () {
	        $("#alert_grad").hide();
	        if ($("#controls").find(".active").length == 0) {
	            $("#alert_grad").show();
	            return false;
	        }

	        $("#alert_cat").hide();
	        if ($("#cats").find(".active").length == 0) {
	            $("#alert_cat").show();
	            return false;
	        }
	    });

	    $("#imgCode").click(function () {
	        $(this).attr('src', "/ValidateCode.html?r="+Math.random());
	    });

	    $("#imgCode").click();
	</script>
</asp:Content>

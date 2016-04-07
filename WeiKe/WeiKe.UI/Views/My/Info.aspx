<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <div style="height: 3px">
    </div>
    <%: Html.Partial("RespUserControl") %>
    <form id="f1" role="form" style="width: 300px; margin: auto" action="" method="post">
    <fieldset>
        <div class="form-group">
            <label class="control-label">
                账号</label>
            <div class="controls">
                <input name="name" type="text" placeholder="必填项" readonly value="<%: Model.name %>"
                    class="form-control" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label" for="input01">
                手机</label>
            <div class="controls">
                <input name="phone" type="text" placeholder="必填项" 
                    value="<%: Model.phone %>"
                    class="form-control" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$"
                    required="required" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                年级</label>
            <div id="controls" class="controls">
                <% foreach (WeiKe.Model.Category grad in (IList<WeiKe.Model.Category>)ViewData["grads"])
                   { %>
                <button gradid="<%:grad.id %>" gradtitle='<%:grad.title %>' type="button" class="btn btn-default
                             <% if(grad.title == Model.grad) {%>
                                active
                             <%} %>
                            ">
                    <%:grad.title %></button>
                <%} %>
            </div>
            <div id="alert_grad" class="alert alert-warning" style="display: none">
                请选择年级！</div>
        </div>
        <div class="form-group">
            <label class="control-label">
                学校</label>
            <div class="controls">
                <input name="school" type="text" placeholder="" value="<%: Model.school %>" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                监护人</label>
            <div class="controls">
                <input name="parentName" type="text" placeholder="" value="<%: Model.parentName %>"
                    class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                监护人手机</label>
            <div class="controls">
                <input name="parentPhone" type="text" placeholder="" value="<%: Model.parentPhone %>"
                    class="form-control" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$">
            </div>
        </div>
        <div class="form-group">
            <input type="hidden" name="categoryId" value="0" />
            <input type="hidden" id="grad" name="grad" value="" />
            <button id="ok" class="btn btn-primary" type="submit" style="width: 100%;">
                保存</button>
        </div>
    </fieldset>
    </form>
    <script type="text/javascript">

        $("#controls").find("button").click(function () {
            $("#controls").find("button").removeClass('active');
            $(this).addClass('active');
            $("#grad").val($(this).attr('gradTitle'));
        });

        $("#f1").submit(function () {
            return checkval();
        });

        function checkval() {
            $("#alert_grad").hide();
            if ($("#controls").find(".active").length == 0) {
                $("#alert_grad").show();
                return false;
            }
            return true;
        }
    </script>
    <%: Html.Partial("ValidateUserControl")%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
    个人资料
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>个人信息</li>
        <li class="active">个人资料</li>
    </ol>
</asp:Content>

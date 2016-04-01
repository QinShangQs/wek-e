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
                <input name="phone" type="text" placeholder="必填项" value="<%: Model.phone %>" class="form-control"
                    pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$"
                    required="required" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                邮箱</label>
            <div class="controls">
                <input name="email" type="email" placeholder="必填项"
                     value="<%: Model.email %>"
                 class="form-control" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                学历</label>
            <div class="controls">
                <input name="degree" type="text" placeholder="必填项"
                    value="<%: Model.degree %>"
                 class="form-control" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                经验</label>
            <div class="controls">
                <input name="experience" type="text" placeholder="必填项（如3年）" class="form-control"
                    value="<%: Model.experience %>"
                    required>
            </div>
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
                科目</label>
            <div id="cats" class="controls">
                <% foreach (WeiKe.Model.Category cat in (IList<WeiKe.Model.Category>)ViewData["cates"])
                   { %>
                <button catid="<%:cat.id %>" cattitle='<%:cat.title %>' type="button" class="btn btn-default
                    <% if(cat.id == Model.categoryId) {%>
                                active
                             <%} %>
                ">
                    <%:cat.title%></button>
                <%} %>
            </div>
            <div id="alert_cat" class="alert alert-warning" style="display: none">
                请选择科目！</div>
        </div>
        <div class="form-group">
            <input type="hidden" id="categoryId" name="categoryId" value="0" />
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
            $("#grad").val($(this).attr('gradtitle'));
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
    </script>
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

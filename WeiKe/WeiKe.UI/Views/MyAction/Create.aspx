<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <div style="height: 3px">
    </div>
    <%: Html.Partial("RespUserControl") %>
    <form id="f1" role="form" style="width: 300px; margin: auto" action="" method="post">
    <fieldset>
        <div class="form-group">
            <label class="control-label">
                活动标题</label>
            <div class="controls">
                <input name="name" type="text" placeholder="必填项" class="form-control" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                活动时间起</label>
            <div class="controls">
                <input name="begint" type="text" placeholder="必填项，如(2016-03-01)" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                活动时间止</label>
            <div class="controls">
                <input name="endt" type="text" placeholder="必填项，如(2016-03-31)" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                活动内容</label>
            <div class="controls">
                <textarea  name="content" type="text" placeholder="必填项" rows=5 class="form-control"></textarea>
            </div>
        </div>
        <div class="form-group">
            <button id="ok" class="btn btn-primary" type="submit" style="width: 100%;">
                确定</button>
        </div>
    </fieldset>
    </form>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
    添加活动
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>后台管理</li>
        <li class="active">添加活动</li>
    </ol>
</asp:Content>

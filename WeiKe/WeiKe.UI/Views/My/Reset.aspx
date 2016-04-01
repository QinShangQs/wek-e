<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <form id="f1" role="form" style="width: 300px; margin: auto" action="" method="post">
    <fieldset>
        <div class="form-group">
            <label class="control-label">
                原始密码</label>
            <div class="controls">
                <input name="oldPwd" type="password" placeholder="必填项" class="form-control" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                新密码</label>
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
            <button id="ok" class="btn btn-primary" type="submit" style="width: 100%; ">  确定</button>
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
    重置密码
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>安全</li>
        <li class="active">重置密码</li>
    </ol>
</asp:Content>

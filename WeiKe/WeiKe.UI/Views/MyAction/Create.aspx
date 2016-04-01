<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">

    <h2>Create</h2>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
        <ol class="breadcrumb">
            <li><a href="/my.html">个人中心</a></li>
            <li>后台管理</li>
            <li class="active">添加活动</li>
        </ol>
</asp:Content>

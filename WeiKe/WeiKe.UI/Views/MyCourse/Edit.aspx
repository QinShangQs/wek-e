﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">

    <h2>Edit</h2>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>课程管理</li>
        <li class="active">编辑课程</li>
    </ol>
</asp:Content>
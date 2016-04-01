<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="SubTitle" ContentPlaceHolderID="SubTitle" runat="server">
    个人中心
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SubNav" runat="server">
        <ol class="breadcrumb" style="width:100%">
				  <li><a href="/my.html">个人中心</a></li>
				  <li class="active">首页</li>
	    </ol>	
</asp:Content>

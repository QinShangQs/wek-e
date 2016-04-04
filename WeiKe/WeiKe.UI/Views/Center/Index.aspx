<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    活动中心
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin: auto; width: 800px">
        <% foreach (WeiKe.Model.Actions item in Model)
           { 
        %>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <a href="/center-<%:item.id %>.html"><%:item.name %></a>
                </h3>
            </div>
            <div class="panel-body">
                <%: Html.CustStr(item.content, 100) %>
            </div>
            <div class="panel-footer">
                <%:item.begint %>
                &nbsp;&nbsp;至&nbsp;&nbsp;<%:item.endt %>
                <span style="float:right"><a href="/center-<%:item.id %>.html">详情>></span>
            </div>
        </div>
        <%
       } %>
    </div>
</asp:Content>

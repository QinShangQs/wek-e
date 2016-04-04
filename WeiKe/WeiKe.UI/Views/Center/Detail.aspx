<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%:Model.name %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin: auto; width: 800px">
        <div class="page-header">
            <h3><%:Model.name %></h3>
        </div>
        <p>
            <%:Model.content %></p>
        <div class="page-footer">
        <hr />
            <%:Model.begint%>
            &nbsp;&nbsp;至&nbsp;&nbsp;<%:Model.endt%>
        </div>
    </div>
</asp:Content>

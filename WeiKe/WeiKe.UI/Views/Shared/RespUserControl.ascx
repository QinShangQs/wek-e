<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<% if (ViewData["resp"] != null)
   {
       if (((dynamic)ViewData["resp"]).Success)
       {
%>
<div class="alert alert-success">
    <%:((dynamic)ViewData["resp"]).Message%>
</div>
<%
                   }
                   else
                   {
%>
<div class="alert alert-danger">
    <%:((dynamic)ViewData["resp"]).Message%></div>
<%
                   }
   } %>

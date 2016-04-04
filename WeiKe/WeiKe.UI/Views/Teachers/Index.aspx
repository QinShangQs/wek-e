<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    名师
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="text-align: -webkit-center;">
        <% foreach (var inst in Model) { 
           %>
            <div class="col-sm-6 col-md-3" style="width:20%">
            <div class="thumbnail">
                <% if (string.IsNullOrEmpty(inst.headerImg))
                   { 
                %>
                <img src="/Content/images/noheader.jpg" width="120" height="120" />
                <%
                   }
                   else
                   { 
                %>
                <img id="header" src="<%:inst.headerImg%>" width="120" height="120" />
                <%}%>
                <div class="caption">
                    <h3>
                        <%:inst.name %></h3>
                    <p>
                        <%:inst.degree %></p>
                        <p>
                        <%:inst.experience %></p>
                    <p>
                        <a href="/teacher-<%:inst.id %>.html">查看课程>></a>
                    </p>
                </div>
            </div>
        </div>
           <%
           }%>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NvContent" runat="server">
</asp:Content>

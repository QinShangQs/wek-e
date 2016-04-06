<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <table class="table table-bordered" style="margin-bottom: 2px;">
        <thead>
            <tr>
                <th style="width: 50px">
                    头像
                </th>
                <th>
                    姓名
                </th>
                <th>
                    年级
                </th>
                <th>
                    手机
                </th>
                <th>
                    学校
                </th>
                <th>
                    监护人
                </th>
                <th>
                    监护人手机
                </th>
                <th style="width: 150px">
                    注册时间
                </th>
                <th>
                    操作
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (WeiKe.Model.Users m in Model)
               { %>
            <tr id="d<%:m.id %>">
                <td>
                    <% if (!string.IsNullOrEmpty(m.headerImg))
                       { 
                    %>
                    <img src="<%= m.headerImg %>" width="20px" />
                    <%
                       }
                       else
                       { 
                    %>
                    <img src="/Content/images/noheader.jpg" width="20px" />
                    <%
                       }%>
                </td>
                <td>
                    <%= m.name %>
                </td>
                <td>
                    <%= m.grad%>
                </td>
                <td>
                    <%= m.phone %>
                </td>
                <td>
                    <%= m.school %>
                </td>
                <td>
                    <%= m.parentName %>
                </td>
                <td>
                    <%= m.parentPhone %>
                </td>
                <td>
                    <%= m.addtime %>
                </td>
                <td>
                    <a href="javascript:removeX(<%:m.id %>,this)" style="float: right" class="btn btn-danger btn-xs">
                删除</a>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>
    <%
        PagerInfo pager = (PagerInfo)ViewData["pager"];
            
    %>
    <%:
        Html.ShowPageNavigate(
                pager.CurrentPageIndex,
                   pager.PageSize, pager.RecordCount,
                                    pager.SearchParameter) 
    %>

    <script type="text/javascript">
        function removeX(id) {
            if (window.confirm("删除后不可恢复，确定删除吗？")) {
                Utils.ajax("/MyPerson/Remove", { id: id }, function () {
                    alert('删除成功！');
                    $("#d" + id).remove();
                }, function (obj) {
                    alert(obj.Message);
                });
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
    学生列表
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>后台管理</li>
        <li class="active">学生列表</li>
    </ol>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <% foreach (WeiKe.Model.Actions item in Model)
       { 
    %>
    <div id="d<%:item.id %>" class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <%:item.name %>
            </h3>
        </div>
        <div class="panel-body">
            <%: Html.CustStr(item.content, 100) %>
        </div>
        <div class="panel-footer">
            <%:item.begint %>
            &nbsp;&nbsp;至&nbsp;&nbsp;<%:item.endt %>
            <a href="javascript:removeX(<%:item.id %>,this)" style="float: right" class="btn btn-danger btn-xs">
                删除</a>
        </div>
    </div>
    <%
       } %>
    <script type="text/javascript">
        function removeX(id) {
            if (window.confirm("删除后不可恢复，确定删除吗？")) {
                Utils.ajax("/MyAction/Remove", { id: id }, function () {
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
    活动列表
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>后台管理</li>
        <li class="active">活动列表</li>
    </ol>
</asp:Content>

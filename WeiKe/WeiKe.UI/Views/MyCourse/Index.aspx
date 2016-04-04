<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <% foreach (var item in Model)
       { 
    %>
    <div id="d<%:item.id %>" class="container-fluid" style="margin-bottom: 10px; border: 1px solid #e7e7e7">
        <table width='100%'>
            <tr>
                <td style="width: 150px">
                    <div class="row-fluid">
                        <div class="span12">
                            <%if (string.IsNullOrEmpty(item.picture))
                              {
                            %>
                            <img style="width: 100px; height: 50px" src="/content/images/nopic.jpg" class="img-rounded" />
                            <%
                              }
                              else
                              { 
                            %>
                            <img style="width: 100px; height: 50px" src="<%: item.picture %>" class="img-rounded" />
                            <%
                              } %>
                        </div>
                    </div>
                </td>
                <td>
                    <div style="">
                        <h4>
                            <a target="_blank" href="/course-<%:item.id %>.html">
                                <%:item.title %></a></h4>
                        <p>
                            <%:item.remark %></p>
                    </div>
                </td>
                <td style="width: 200px">
                    <div style="">
                        <p>
                            <%:item.grad %>
                            -
                            <%:item.categoryName%><br />
                            课时：<%:item.unionNumber %><br />
                            添加时间：<%:item.addtime %></p>
                    </div>
                </td>
                <td style="width: 50px">
                    <a href="javascript:removeX(<%:item.id %>,this)" class="btn btn-danger btn-xs">删除课程</a>
                    <div style="height: 3px">
                    </div>
                    <a href="/mycourse/detailitem?id=<%:item.id %>" class="btn btn-primary btn-xs">上传视频</a>
                </td>
            </tr>
        </table>
    </div>
    <%   
       } %>
    <script type="text/javascript">
        function removeX(id) {
            if (window.confirm("删除后不可恢复，确定删除吗？")) {
                Utils.ajax("/MyCourse/Remove", { id: id }, function () {
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
    课程列表
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>课程管理</li>
        <li class="active">课程列表</li>
    </ol>
</asp:Content>

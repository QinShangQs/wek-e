﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">

    <div>
        <div class="page-header" style="margin-top: 0px">
            <h4>
                <%:Model.title %>
                <small>上传视频</small>
            </h4>
        </div>
        <table width='100%'>
            <tr>
                <td>
                    <div style="height: 3px">
                    </div>
                    <%: Html.Partial("RespUserControl") %>
                    <form id="f1" role="form" style="width: 300px;" action="" method="post">
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label">
                                视频名称</label>
                            <div class="controls">
                                <input name="title" type="text" placeholder="必填项" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">
                                视频描述</label>
                            <div class="controls">
                                <textarea name="remark" type="password" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">
                                上传.avi、.mp4视频格式，推荐视频大小小于1G</label>
                            <div class="controls">
                                <%: Html.Partial("UploadifyUserControl")%>
                            </div>
                            <div id="alert_wx" class="alert" style="display: none">
                            </div>
                        </div>
                        <input type="hidden" name="courseId" value="<%:Model.id %>" />
                        <input type="hidden" name="filePath" id="filePath" value="" />
                        <div class="form-group">
                            <button id="ok" class="btn btn-primary" type="submit" style="width: 100%;">
                                上传</button>
                        </div>
                    </fieldset>
                    </form>
                </td>
                <td valign="top">
                    <div style="margin-left: 20px; float: right; width: 500px">
                        <a href="#"  class="list-group-item active">视频列表
                        </a>
                        <% foreach (var item in Model.items)
                           {
                        %>
                        <li href="#" target="_blank" class="list-group-item">
                            <a href="/courseitem-<%:item.id %>.html"><%:item.title %></a>
                            <label onclick="removeX(<%:item.id %>,this)" style="float:right;width:20px; cursor:pointer">X</label>    
                        </li>
                        <%
                           } %>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        $("#f1").submit(function () {
            return checkval();
        });

        function checkval() {
            if (Utils.isEmpty($("#filePath").val())) {
                $("#alert_wx").addClass("alert-danger").text("请上传视频！").show();
                return false;
            }
            return true;
        }

        function removeX(id, label) {
            if (window.confirm("删除后不可恢复，确定删除吗？")) {
                Utils.ajax("/MyCourse/RemoveItem", { id: id }, function () {
                    alert('删除成功！');
                    $(label).parent().remove();
                }, function (obj) {
                    alert(obj.Message);
                });
            }
        }

 
    </script>
    <%: Html.Partial("ValidateUserControl")%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
    <%:Model.title %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>课程管理</li>
        <li class="active">
            <%:Model.title %></li>
    </ol>
</asp:Content>

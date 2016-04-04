<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <link href="/Scripts/uploadify-v3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/uploadify-v3.1/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
    <div style="height: 3px">
    </div>
    <%: Html.Partial("RespUserControl") %>
    <form id="form1" role="form" style="width: 300px; margin: auto" action="" method="post">
    <fieldset>
        <div class="form-group">
            <label class="control-label">
                课程名称</label>
            <div class="controls">
                <input name="title" type="text" placeholder="必填项" class="form-control" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                课程数(节)</label>
            <div class="controls">
                <input name="unionNumber" type="text" placeholder="必填项,如5" class="form-control" required
                    style="width: 120px" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label">
                课程描述</label>
            <div class="controls">
                <textarea name="remark" type="password" placeholder="必填项" class="form-control" required></textarea>
            </div>
        </div>
        <div class="form-group">        
            <table>
                <tr>
                    <td><h4><span class="label label-default"> <%:Model.grad%></span></h4></td>
                    <td><h4><span class="label label-default"> <%:Model.category.title%></span></h4></td>
                </tr>
            </table>        
        </div>
        
        <div class="form-group">
            <label class="control-label">
                课程图片</label>
            <div class="controls">
                <input type="file" id="file_upload" name="file_upload" /> 
            </div>
            <div id="alert_wx" class="alert" style="display: none"></div>
        </div>
        <input type="hidden" name="pathName" id="pathName" />
        <div class="form-group">
            <button id="ok" class="btn btn-primary" type="submit" style="width: 100%;">
                确定</button>
        </div>
    </fieldset>
    </form>
    <script type="text/javascript">
        $("#form1").submit(function () {
            if (Utils.isEmpty($("#pathName").val())) {
                $("#alert_wx").addClass("alert-danger").text("请上传图片！").show();
                return false;
            }
        });

        $(function () {
            $('#file_upload').uploadify({
                'buttonText': '请选择图片',
                'swf': '/Scripts/uploadify-v3.1/uploadify.swf',
                'uploader': '/Base/Upload',
                'sizeLimit': '99999999999',
                'fileTypeDesc': '图片文件',
                'fileTypeExts': '*.jpg; *.png',
                'onUploadSuccess': function (file, data, response) {
                    eval("data=" + data);
                    $("#pathName").val(data.PathName);
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
    添加课程
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>课程管理</li>
        <li class="active">添加课程</li>
    </ol>
</asp:Content>

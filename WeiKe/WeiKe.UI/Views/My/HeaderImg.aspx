<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="System.IO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <link href="/Scripts/uploadify-v3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/uploadify-v3.1/jquery.uploadify-3.1.min.js" type="text/javascript"></script>
       <div style="height: 3px">
    </div>
    <%: Html.Partial("RespUserControl") %>
    <div class="alert alert-warning alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
            &times;
        </button>
        上传你的真实头像，让同学们都能更方便找到你。
    </div>
    <form action="" method="post" id="form1">
    <div>
        <% if (string.IsNullOrEmpty(Model.headerImg))
           { 
        %>
        <img id="header" src="/Content/images/noheader.jpg" width="120" height="120" />
        <%
           }
           else
           { 
        %>
        <img id="header" src="<%:Model.headerImg%>" width="120" height="120" />
        <%}%>
    </div>
    <div style="height: 10px">
        &nbsp;</div>
    <div>
        <p class="alert-link">
            注意：只支持JPG、PNG格式，图片格式为120×120，最大支持1M。
        </p>
        <input type="file" id="file_upload" name="file_upload" />   
        </div>
    </div>

    <div id="subDiv" style="display:none">
        <input type="hidden" name="pathName" id="pathName" />
        <input type="submit" class="btn btn-primary" value="保存"/>
    </div>
    </form>
    <script type="text/javascript">
        $(function () {
            $('#file_upload').uploadify({
                'buttonText': '请选择头像图片',
                'swf': '/Scripts/uploadify-v3.1/uploadify.swf',
                'uploader': '/Base/Upload',
                'sizeLimit': '99999999999',
                'fileTypeDesc': '图片文件',
                'fileTypeExts': '*.jpg; *.png',
                'onUploadSuccess': function (file, data, response) {
                    eval("data=" + data);
                    $("#header").attr('src', data.PathName);
                    $("#pathName").val(data.PathName);
                    $("#subDiv").show();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
    头像设置
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>个人信息</li>
        <li class="active">头像设置</li>
    </ol>
</asp:Content>

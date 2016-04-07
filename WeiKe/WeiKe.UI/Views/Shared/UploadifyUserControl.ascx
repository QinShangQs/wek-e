<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script src="/Scripts/uploadify-v3.1/jquery.uploadify3.1.fixed.js" type="text/javascript"></script>
<link href="/Scripts/uploadify-v3.1/uploadify.css" rel="stylesheet" type="text/css"/>
<input type="file" id="file_upload" name="file_upload" />
<script type="text/javascript">
    $(function () {
        $('#file_upload').uploadify({
            'buttonText': '请选择视频文件',
            'swf': '/Scripts/uploadify-v3.1/uploadify.swf',
            'uploader': '/Base/Upload',
            'sizeLimit': '99999999999',
            'fileTypeDesc': '视频文件',
            'fileTypeExts': '*.avi; *.mp4;',
            'onUploadSuccess': function (file, data, response) {
                eval("data=" + data);
                $("#filePath").val(data.PathName);
            }
        });
    });
</script>
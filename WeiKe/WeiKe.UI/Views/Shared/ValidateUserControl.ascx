<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script src="/Content/jquery.validate.min.js" type="text/javascript"></script>
<script src="/Content/messages_zh.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $.validator.setDefaults({
        submitHandler: function (form) {
            if (typeof(checkval) != 'function' || checkval())
                form.submit();                
        }
    });
    $().ready(function () {
        $("#f1").validate({ debug: true });
    });
</script>
<style type="text/css">
    .error
    {
        color: red;
    }
</style>

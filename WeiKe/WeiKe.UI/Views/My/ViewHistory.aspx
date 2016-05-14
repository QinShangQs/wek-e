<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/My.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <div style="height: 3px">
    </div>
    <div id="views">
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var template = '<div class="panel panel-default">'
                + '<div class="panel-heading">'
                + '<h3 class="panel-title">'
                    + '<a href="#url">#title</a>'
                + '</h3>'
                + '</div>'
                + '<div class="panel-body">'
                    + '#remark'
                + '</div>'
                + '</div>';

            if (location.href.match(/viewhistory/i) && _userInfo.isLogin && _userInfo.roleName == '学生') {
                var key = _userInfo.id;
                var views = $.cookie(key);
                views = views == null ? [] : $.parseJSON(views);
                views = views == null ? [] : views;
                for (var i = 0; i < views.length; i++) {
                    var view = views[i];
                    var win = template.replace('#url', view.url)
                            .replace('#title', view.title + "<span style='float:right'>["+view.matcher+"]</span>")
                            .replace('#remark', view.remark);
                    $("#views").append($(win));
                }
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SubTitle" runat="server">
    游览历史
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SubNav" runat="server">
    <ol class="breadcrumb">
        <li><a href="/my.html">个人中心</a></li>
        <li>个人信息</li>
        <li class="active">游览历史</li>
    </ol>
</asp:Content>

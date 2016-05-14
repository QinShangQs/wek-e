<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 800px; margin: auto; padding-top: 20px" id="myv">
        <div id="jwplayer" style="background: transparent !important; margin:0 auto; width:100%; overflow:hidden;">
	        <div id="player"></div>
        </div>

        <div  class="page-header">
            <h3 id="myTitle">
                <%:Model.title %>
            </h3>
        </div>
        <p id="myRemark">
            <%:Model.remark %></p>
        <% foreach (var item in (IList<WeiKe.Model.Comments>)ViewData["cmts"])
           { 
        %>
        <div class="panel panel-default">
            <div class="panel-body">
                <%:item.content %>
            </div>
            <div class="panel-footer" style="text-align:right">
                <%:item.addtime %>
                ——
                <%:item.userName%></div>
        </div>
        <%
           }%>
       <div class="well" style="height:135px">
        <div class="form-group" style="margin-bottom:2px;">
            <textarea class="form-control" rows="3" id="content" placeholder="填写您的评论"></textarea>           
        </div>
         <div class="col-sm-offset-2 col-sm-10" style="width:800px; ">
                <div id="alertx" style="width:200px;float:left; color:Red;display:none">请填写评论</div>
                <button id="send" type="button" class="btn btn-primary" style="float:right;margin-right:150px">
                    发表评论</button>
            </div>
        </div>
        <p>&nbsp;&nbsp;&nbsp;</p>
    </div>
    <script type="text/javascript">
        $("#send").click(function () {
            $("#alertx").hide();
            var content = $.trim($("#content").val());
            if (Utils.isEmpty(content)) {
                $("#alertx").show();
                return;
            }

            var courseItemId = '<%:Model.id %>';
            Utils.ajax("/course/send", { content: content, courseItemId: courseItemId }, function (obj) {
                alert(obj.Message);
                $("#content").val('')
            }, function (obj) {
                alert(obj.Message);
            });
        });

        $(document).ready(function () {
            var isLogin = '<%: Page.User.Identity.IsAuthenticated.ToString().ToLower() %>';
            if (isLogin != "true") {
                $("#myv").remove();
                $("#loginA").click();
            }

        });
    </script>
    <script type="text/javascript" src="/Scripts/video/jwplayer.js"></script>
    <script type="text/javascript">
        jwplayer("player").setup({
            skin: "/Scripts/video/glow.zip",
            stretching: "fill",
            flashplayer: "/Scripts/video/player.swf",
            image: "",
            width: 800,
            height: 350,
            levels: [{ file: "<%:Model.filePath %>"}]
        });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    <%:Model.title %>
</asp:Content>

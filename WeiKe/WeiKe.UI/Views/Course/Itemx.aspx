<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 800px; margin: auto; padding-top: 20px" id="myv">
        <video id="vo" src="<%:Model.filePath %>" style="width:100%" controls="controls" autoplay="autoplay">
        您的浏览器不支持 video 标签。        
        </video>
        <br />
        <br />
        <div class="page-header">
            <h3>
                <%:Model.title %>
            </h3>
        </div>
        <p>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    <%:Model.title %>
</asp:Content>

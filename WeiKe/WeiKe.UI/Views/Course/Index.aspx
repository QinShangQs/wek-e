<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    选课
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin: auto; width: 800px">
        <div class="panel panel-default">
            <table>
                <tr>
                    <td>
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                年级
                            </h3>
                        </div>
                    </td>
                    <td>
                        <div class="panel-body" id="controls">
                            <button gradid="0" gradtitle='' type="button" class="btn btn-default active">
                                全部</button>
                            <% foreach (WeiKe.Model.Category grad in (IList<WeiKe.Model.Category>)ViewData["grads"])
                               { %>
                            <button gradid="<%:grad.id %>" gradtitle='<%:grad.title %>' type="button" class="btn btn-default">
                                <%:grad.title %></button>
                            <%} %>
                        </div>
                    </td>
                    <td>
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                科目
                            </h3>
                        </div>
                    </td>
                    <td>
                        <div class="panel-body"  id="cats">
                            <button catid="0" cattitle='' type="button" class="btn btn-default active">
                                全部</button>
                            <% foreach (WeiKe.Model.Category cat in (IList<WeiKe.Model.Category>)ViewData["cates"])
                               { %>
                            <button catid="<%:cat.id %>" cattitle='<%:cat.title %>' type="button" class="btn btn-default">
                                <%:cat.title%></button>
                            <%} %>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div style="margin: auto; width: 800px; padding-top: 0px">
            <% if (Model.Count == 0) { 
                   %>
                <center>悲剧了，没有找到课程～ </center>
                <%
             } %>
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
                            <a href="/course-<%:item.id %>.html" class="btn btn-primary btn-xs">了解课程>></a>
                        </td>
                    </tr>
                </table>
            </div>
            <%   
           } %>
           </div>

    <script type="text/javascript">
        $(document).ready(function () {
            var g = '<%:ViewData["g"] %>';
            var c = '<%:ViewData["c"] %>';

            $("#controls button").removeClass('active');
            $("#cats button").removeClass('active');

            $("#controls button").each(function (i, e) {
                if ($(this).attr("gradtitle") == g) {
                    $(this).addClass("active");
                }
            });

            $("#cats button").each(function (i, e) {
                if ($(this).attr("cattitle") == c) {
                    $(this).addClass("active");
                }
            });
        });

        $("#controls").find("button").click(function () {
            $("#controls").find("button").removeClass('active');
            $(this).addClass('active');
            changeUrl();
        });

        $("#cats").find("button").click(function () {
            $("#cats").find("button").removeClass('active');
            $(this).addClass('active');
            changeUrl();
        });

        function changeUrl() {
            var g = 0;
            $("#controls button").each(function (i, e) {
                if ($(this).hasClass("active")) {
                    g = $(this).attr("gradtitle");
                }

            });

            var c = 0;
            $("#cats button").each(function (i, e) {
                if ($(this).hasClass("active")) {
                    c = $(this).attr("cattitle");
                }
            });

            location.href = "/course.html?g=" + g + "&c=" + c;
        }
    </script>
</asp:Content>

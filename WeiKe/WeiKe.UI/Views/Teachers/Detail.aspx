<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%:Model.name %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        dt
        {
            line-height: 2;
        }
    </style>
    <div class="page-header" style="margin: auto; width: 800px">
        <table>
            <tr>
                <td>
                    <div class="row-fluid">
                        <div class="span12" style="margin-right: 50px">
                            <%if (string.IsNullOrEmpty(Model.headerImg))
                              {
                            %>
                            <img style="width: 200px; height: 100px" src="/content/images/noheader.jpg" class="img-rounded" />
                            <%
                              }
                              else
                              { 
                            %>
                            <img style="width: 200px; height: 100px" src="<%: Model.headerImg %>" class="img-rounded" />
                            <%
                              } %>
                        </div>
                </td>
                <td>
                    <h4>
                        <%:Model.name%>
                    </h4>
                    <div class="span12">
                        <dl>
                            <dd>
                                学历:
                                <%:Model.degree %>
                            </dd>
                            <dd>
                                经验:<%:Model.experience%>
                            </dd>
                            <dd>
                                毕业学校:<%:Model.school%>
                            </dd>
                            <dd>
                                <table>
                                    <tr>
                                        <td>
                                            <h4>
                                                <span class="label label-default">
                                                    <%:Model.grad%></span></h4>
                                        </td>
                                        <td>
                                            <h4>
                                                <span class="label label-default">
                                                    <%:Model.category.title%></span></h4>
                                        </td>
                                    </tr>
                                </table>
                            </dd>
                        </dl>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin: auto; width: 800px; padding-top: 10px">
        <% if (((IList<WeiKe.Model.Course>)ViewData["Courses"]).Count == 0) {
        %>
            <center>老师还没来得及上传课程～</center>
        <%   
        }else{ %>
        <% foreach (var item in (IList<WeiKe.Model.Course>)ViewData["Courses"])
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
           <%   
           } %>
    </div>
</asp:Content>

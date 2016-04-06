<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
                            <%if (string.IsNullOrEmpty(Model.picture))
                              {
                            %>
                            <img style="width: 200px; height: 100px" src="/content/images/nopic.jpg" class="img-rounded" />
                            <%
                              }
                              else
                              { 
                            %>
                            <img style="width: 200px; height: 100px" src="<%: Model.picture %>" class="img-rounded" />
                            <%
                              } %>
                        </div>
                </td>
                <td>
                    <h4>
                        <%:Model.title %>
                    </h4>
                    <div class="span12">
                        <dl>
                            <dd>
                                课程数:
                                <%:Model.unionNumber %>
                            </dd>
                            <dd>
                                讲师:<%:Model.teacher.name %>
                            </dd>
                        </dl>
                    </div>
                </td>
            </tr>
        </table>
        <div class="container-fluid" id="LG">
            <div class="row-fluid" style="margin: auto; width: 800px">
                <dl>
                    <dt>描述</dt>
                    <dd>
                        <%:Model.remark %>
                    </dd>
                </dl>
            </div>
        </div>
       
    </div>
     <div style="margin: auto; width: 800px" >
            <a href="#" class="list-group-item active">视频列表 </a>
            <% foreach (var item in Model.items)
               {
            %>
            <li href="#" target="_blank" class="list-group-item"><a href="/courseitem-<%:item.id %>.html">
                <%:item.title %></a>
                <label style="float: right; width: 50px; cursor: pointer">
                    <a href="/courseitem-<%:item.id %>.html">播放</a></label>
            </li>
            <%
           } %>
        </div>
</asp:Content>

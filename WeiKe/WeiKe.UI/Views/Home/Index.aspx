<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    我的微课
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="/Scripts/a5index.js" type="text/javascript"></script>
<!-- InstanceBeginEditable name="zhong" -->
<div >
    <div class="mainbanner">
        <div class="mainbanner_window">
            <ul id="slideContainer">
                    <li><a href="course.html" title="选课"  target="_blank">
                        <img src="http://static.vko.cn/v8/index/images/join1200x300.jpg" width="1600" height="385"  alt="选课"/>
                    </a></li>   
                    <li><a href="course.html" title="选课"  target="_blank">
                        <img src="http://static.vko.cn/v8/index/images/join1200x300.jpg" width="1600" height="385"  alt="选课"/>
                    </a></li>  
                   
            </ul>
        </div>
        <ul class="mainbanner_list" style="">
                <li><a href="javascript:void(0);">1</a></li>
                <li><a href="javascript:void(0);">2</a></li>
        </ul>
    </div>
</div>
<div class="center" style="padding-top: 10px; padding-bottom: 10px;">
    <div class="post1">
         <div class="zhanshi">
            <div class="guan">
                <div class="img">
                    <a href="news.html">
                        <img src="http://static.vko.cn/v8/index/images/adc.jpg" width="318" height="214" /></a>
                </div>
            </div>
        </div>
         <div class="zhanshi">
            <div class="guan">
                <div class="img">
                    <a href="news.html">
                        <img src="http://cdn.vkoimg.cn/v8/activity/invLetter/images/weikedasai.jpg" width="318" height="214" /></a>
                </div>
            </div>
        </div>

        <div class="zhanshi">
            <div class="guan">
                <div class="img">
                    <a href="news.html">
                        <img src="http://www.bjzhiheng.cn/images/sucai1_26.jpg" width="318" height="214" /></a>
                </div>
            </div>
        </div>
        <div class="cls">
        </div>
    </div>
</asp:Content>

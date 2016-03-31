<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    关于我们
</asp:Content>
<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h3>
            我的微课 <small>关于我们</small>
        </h3>
    </div>
    <p>
        该网站为非盈利性网站，用户只有注册后才能分享、观看微课程视频，同时和各科教师沟通交流。</p>
<p>登陆注册模块：用户身份认证分为：学生//某科教师；昵称唯一不可更改。</p>
<p>首页：根据各个年级进行分类；用户可根据关键字进行查询搜索，得到相关的微课程视频；观看后，用户可根据自己疑问留言或询问相关教师，其他用户看到留言后也可回复。</p>
<p>身份认证为“教师”的用户可上传微课程视频（系统根据关键字分类存入数据库）</p>
<p>学习中心模块：该模块系统会定时举办活动，用户可根据自己意愿参加。类似交流群。</p>
</asp:Content>

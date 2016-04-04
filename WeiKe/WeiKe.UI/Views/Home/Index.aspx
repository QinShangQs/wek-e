<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    我的微课
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   		<div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner" style="height:380px; cursor:pointer">
				<div class="item active" onclick="location.href='teachers.html'">
					<img width="100%"
						src="/content/images/s1.jpg"
						alt="名师">
				</div>
				<div class="item">
					<img width="100%" onclick="location.href='course.html'"
						src="/content/images/s2.jpg"
						alt="课程">
				</div>
				<div class="item">
					<img width="100%" onclick="location.href='about.html'"
						src="/content/images/s3.jpg"
						alt="关于我们">
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
        <p></p>
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img
						src="/content/images/shouye.jpg" style="width:253px;height:178px"
						alt="我的微课">
					<div class="caption">
						<h3>我的微课</h3>
						<p>&nbsp;</p>
						<p>
							<a	href="/index.html" style=" visibility:hidden" class="btn btn-default" role="button"> 查看明细>> </a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img
						src="/content/images/course.jpg" style="width:253px;height:178px"
						alt="选课">
					<div class="caption">
						<h3>选课</h3>
						<p>丰富的课程内容、高质量的教学...</p>
						<p>
							<a	href="/course.html" class="btn btn-default" role="button"> 查看明细>> </a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img
						src="/content/images/teacher.jpg" style="width:253px;height:178px"
						alt="名师">
					<div class="caption">
						<h3>名师</h3>
						<p>优秀的教师资源、活跃的...</p>
						<p>
							<a	href="/teachers.html" class="btn btn-default" role="button"> 查看明细>> </a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img
						src="/content/images/about.jpg" style="width:253px;height:178px"
						alt="关于我们">
					<div class="caption">
						<h3>关于我们</h3>
						<p>我的微课是一个在线提供师生...</p>
						<p>
							<a	href="/about.html" class="btn btn-default" role="button"> 查看明细>> </a>
						</p>
					</div>
				</div>
			</div>
		</div>
</asp:Content>

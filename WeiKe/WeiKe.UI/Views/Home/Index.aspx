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
			<div class="carousel-inner" style="height:380px">
				<div class="item active">
					<img width="100%"
						src="http://www.runoob.com/wp-content/uploads/2014/07/slide1.png"
						alt="First slide">
				</div>
				<div class="item">
					<img width="100%"
						src="http://www.runoob.com/wp-content/uploads/2014/07/slide2.png"
						alt="Second slide">
				</div>
				<div class="item">
					<img width="100%"
						src="http://www.runoob.com/wp-content/uploads/2014/07/slide3.png"
						alt="Third slide">
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img
						src="http://www.runoob.com/wp-content/uploads/2014/06/kittens.jpg"
						alt="通用的占位符缩略图">
					<div class="caption">
						<h3>缩略图标签</h3>
						<p>一些示例文本。一些示例文本。</p>
						<p>
							<a href="#" class="btn btn-primary" role="button"> 按钮 </a> <a
								href="#" class="btn btn-default" role="button"> 按钮 </a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img
						src="http://www.runoob.com/wp-content/uploads/2014/06/kittens.jpg"
						alt="通用的占位符缩略图">
					<div class="caption">
						<h3>缩略图标签</h3>
						<p>一些示例文本。一些示例文本。</p>
						<p>
							<a href="#" class="btn btn-primary" role="button"> 按钮 </a> <a
								href="#" class="btn btn-default" role="button"> 按钮 </a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img
						src="http://www.runoob.com/wp-content/uploads/2014/06/kittens.jpg"
						alt="通用的占位符缩略图">
					<div class="caption">
						<h3>缩略图标签</h3>
						<p>一些示例文本。一些示例文本。</p>
						<p>
							<a href="#" class="btn btn-primary" role="button"> 按钮 </a> <a
								href="#" class="btn btn-default" role="button"> 按钮 </a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img
						src="http://www.runoob.com/wp-content/uploads/2014/06/kittens.jpg"
						alt="通用的占位符缩略图">
					<div class="caption">
						<h3>缩略图标签</h3>
						<p>一些示例文本。一些示例文本。</p>
						<p>
							<a href="#" class="btn btn-primary" role="button"> 按钮 </a> <a
								href="#" class="btn btn-default" role="button"> 按钮 </a>
						</p>
					</div>
				</div>
			</div>
		</div>
</asp:Content>

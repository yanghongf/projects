<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>频道预览 | <f:message key="common.title"/></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
<script src="${BASE}/static/assets/jwplayer/jwplayer.js"></script>
<script src="${BASE}/static/assets/jwplayer/jwplayer.html5.js"></script>
<script type="text/javascript">
	jwplayer.key = "MGAzpXRYxGnaVXhH8jSdKXzDe7ucAAvZGWggIA==";
</script>
</head>

<body class="skin-blue  fixed   sidebar-mini">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>频道预览<small>${tChannel.name_zh}</small></h1>
			<ol class="breadcrumb">
				<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="../list/1">频道管理</a></li>
				<li class="active">新增预览</li>
			</ol>
			</section>
			<section class="content"> 
			<div class="row">
				<div class="col-md-6">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">${isLive==true ? '直播活动信号':'滚播信号'}</h3>
						</div>
						<div class="box-body">
							<input type="hidden" name="play_url_1" id="play_url_1"
								value="${tWowzaSignalBean.tWowzaStream.publish_url}" /> <span
								class="mailbox-attachment-icon has-img" id="player_span_1">
								Loading the player... </span>
						</div>
						<div class="mailbox-attachment-info">
							<a class="mailbox-attachment-name">stream_name:${tWowzaSignalBean.tWowzaStream.stream_name}<br>application_name:${tWowzaSignalBean.tWowzaStream.application_name } <br>lan_ip:${tWowzaSignalBean.tWowza.lan_ip } </a>

						</div>
						<div class="box-footer clearfix">
						<!-- <ul class="pagination pagination-sm no-margin pull-right">
								<li>
									<button class="btn btn-info btn-sm" id="play_button_1"
										onclick="play_1();">载入/断开</button>
								</li>
							</ul> -->	
						</div>
					</div>
				</div>
				
				<div class="col-md-6">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">ips 播放地址</h3>
						</div>
						<div class="box-body">
							<input type="hidden" name="play_url_2" id="play_url_2"
								value="${tChannel.play_url}" /> <span
								class="mailbox-attachment-icon has-img" id="player_span_2">
								Loading the player... </span>
						</div>
						<div class="mailbox-attachment-info">
							<a class="mailbox-attachment-name">  </a>
						</div>
						<div class="box-footer clearfix">
						<!-- <ul class="pagination pagination-sm no-margin pull-right">
								<li>
									<button class="btn btn-info btn-sm" id="play_button_2"
										onclick="play_2();">载入/断开</button>
								</li>
							</ul> -->	
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
	</div>
	<%@ include file="/pages/common/bottom.jsp"%>
	<%@ include file="/pages/common/js.jsp"%>
	<script src="${BASE}/static/assets/cnlive/js/player_2.js"></script>
</body>
</html>

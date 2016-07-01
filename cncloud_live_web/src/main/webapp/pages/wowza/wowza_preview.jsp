<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>wowza预览 | <f:message key="common.title"/></title>
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
			<h1>wowza预览</h1>
			<ol class="breadcrumb">
				<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="../wowza/1">wowza管理</a></li>
				<li class="active">wowza预览</li>
			</ol>
			</section>
			<!-- Main content -->
			<section class="content"> <!-- /.box-header -->
			<div class="row">
				<div class="col-md-9">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">${tWowza.name}</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<input type="hidden" name="play_url" id="play_url"
								value="${tWowzaStream.publish_url}" /> <span
								class="mailbox-attachment-icon has-img" id="player_span">
								Loading the player... </span>
						</div>
						<div class="mailbox-attachment-info">
							<a class="mailbox-attachment-name">${tWowzaStream.stream_name}<br>${tWowzaSignalBean.tWowza.name } <br>${tWowzaSignalBean.tWowza.lan_ip } </a>

						</div>
						<!-- /.box-body -->
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-margin pull-right">
								<li>
									<button class="btn btn-info btn-sm" id="play_button"
										onclick="play();">载入/断开</button>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
	</div>
	<%@ include file="/pages/common/bottom.jsp"%>
	<%@ include file="/pages/common/js.jsp"%>
	<script src="${BASE}/static/assets/cnlive/js/player_bar.js"></script>
</body>
</html>

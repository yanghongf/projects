<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>直播监控|<f:message key="common.title"/></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
<script src="${BASE}/static/assets/jwplayer/jwplayer.js"></script>
<script src="${BASE}/static/assets/jwplayer/jwplayer.html5.js"></script>
<script type="text/javascript">jwplayer.key="MGAzpXRYxGnaVXhH8jSdKXzDe7ucAAvZGWggIA==";</script>

</head>
<body  class="skin-blue  fixed ">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					直播监控 <small>monitor panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">直播监控</li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-2">
						<div class="box box-solid">
							<div class="box-header with-border">
								<h3 class="box-title">监控平台</h3>
							</div>
							<div class="box-body no-padding">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="${BASE}/channel/monitor/1"><i
											class="fa fa-file-text-o"></i> 自主平台 </a></li>
									<li><a href="${BASE}/channel/monitor/2"><i
											class="fa fa-filter"></i>运营商平台 </a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-10">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">监控频道</h3>
							</div>
							<div class="box-body no-padding">
								<div class="row">
									<c:forEach var="item" items="${vChannels}" varStatus="stat">
										<div class="col-md-3">
											<div
												class="box ${item.state==2  ? 'box-success':'box-warning'} box-solid">
												<div class="box-header with-border">
													<h3 class="box-title">${item.name_zh}</h3>
													<div class="box-tools pull-right">
														<!-- <button class="btn btn-sm" id="play_button_${item.id}"
															onclick="play(${item.id});">重新载入</button> -->
													</div>
												</div>
												<div class="box-body">
													<input type="hidden" name="play_url_${item.id}"
														id="play_url_${item.id}"
														value="${item.play_url}" />
													<span class="mailbox-attachment-icon has-img"
														id="player_span_${item.id}"> <img
														src="../../static/assets/dist/img/photo2.png"
														alt="Attachment">
													</span>
												</div>
												<div class="box-footer">
													<div class="input-group">
														<input type="text" name="message" disabled="disabled"
															class="form-control" value="${item.activity_name}">
														<span class="input-group-btn"> </span>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="/pages/common/js.jsp"%>
				<script src="${BASE}/static/assets/cnlive/js/player_4.js"></script>
			</section>
		</div>
	</div>
</body>
</html>
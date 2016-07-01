<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.text-overflow {
	display: block; /*内联对象需加*/
	width: 31em;
	word-break: keep-all; /* 不换行 */
	white-space: nowrap; /* 不换行 */
	overflow: hidden; /* 内容超出宽度时隐藏超出部分的内容 */
	text-overflow: ellipsis;
	/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
}
</style>
<meta charset="UTF-8">
<title>监审管理 |<f:message key="common.title" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
<script src="${BASE}/static/assets/cnlive/js/check.js"></script>
<script src="${BASE}/static/assets/jwplayer/jwplayer.js"></script>
<script src="${BASE}/static/assets/jwplayer/jwplayer.html5.js"></script>
<script type="text/javascript">jwplayer.key="MGAzpXRYxGnaVXhH8jSdKXzDe7ucAAvZGWggIA==";</script>

</head>
<body class="skin-blue  sidebar-collapse sidebar-mini">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					监审管理 <small>monitor panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">监审管理</li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-4">
						<div class="box box-solid">
							<div class="box-header with-border">
								<h3 class="box-title">监控平台</h3>
							</div>
							<div class="box-body no-padding">
								<div class="col-md-12" id="divShow_${item.id}">
									<div class="box box-success box-solid">
										<div class="box-header with-border">
											<div class="text-overflow">
												<h3 class="box-title" id="hidId">${item.title}</h3>
											</div>
											<div class="box-tools pull-right">
												<button class="btn btn-sm" id="play_button_${item.id}"
													onclick="play(${item.id});">重新载入</button>
											</div>
										</div>
										<div id="playId" class="box-body">
											<%-- <input type="hidden" name="play_url_${item.id}"
												id="play_url_${item.id}" value="${item.live_url}" /> <span
												class="mailbox-attachment-icon has-img"
												id="player_span_${item.id}"> <img
												src="../../static/assets/dist/img/photo2.png"
												alt="Attachment">
											</span> --%>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="box-header with-border">
							<h3 class="box-title">直播信息：</h3>
						</div>
						<div class="box-body no-padding">
							<ul class="nav nav-pills nav-stacked">
								<li id="userId"><a><i class="fa fa-file-text-o"></i>用户ID:</a></li>
								<li id="title"><a><i class="fa fa-file-text-o"></i>TITLE:
								</a></li>
								<li id="startTime"><a><i class="fa fa-file-text-o"></i>开播时间:
								</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-8">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">监控</h3>
								<tag:pager id="product_pager" pager="${tLive}" />
							</div>
							<div class="box-body no-padding">
								<div class="row">
									<c:forEach var="item" items="${tLive.recordList}"
										varStatus="stat">
										<div class="col-md-3" id="divShow_${item.id}">
											<div
												class="box ${item.check_sort eq null  ? 'box-warning':'box-success'} box-solid">
												<div class="box-header with-border">
													<div class="text-overflow">
														<h3 class="box-title">${item.title}</h3>
													</div>
													<div class="box-tools pull-right">
														<button class="btn btn-sm btn-danger"
															onclick="changePlay('${item.id}','${item.live_url}','${item.t_user_id}','${item.title}','${item.start_time}');">左</button>
														<button class="btn btn-sm btn-danger"
															onclick="to_pass(${item.id});">过</button>
														<button class="btn btn-sm btn-danger"
															onclick="to_top(${item.id});">顶</button>
														<button class="btn btn-sm btn-danger"
															onclick="play_close('${item.id}','${item.live_url}','${item.uuid}');">断</button>
													</div>
												</div>
												<div class="box-body">
													<input type="hidden" name="play_url_${item.id}"
														id="play_url_${item.id}" value="${item.live_url}" /> <span
														class="mailbox-attachment-icon has-img"
														id="player_span_${item.id}"> <img
														src="../../static/assets/dist/img/photo2.png"
														alt="Attachment">
													</span>
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
				<script src="${BASE}/static/assets/cnlive/js/player_m3u8.js"></script>
			</section>
		</div>
	</div>
</body>
<script type="text/javascript">
jwplayer("playId").setup({ 
	file: "", 
	height: 260, 
	image: "/assets/myVideo.jpg", 
	autostart:true,
	rtmp: { 
		bufferlength: 0.1 
	}, 
	width: 370 
});
</script>
</html>
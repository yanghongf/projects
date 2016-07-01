<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活动详情 | <f:message key="common.title" /></title>
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
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					直播活动详情 <small>${tActivity.name}</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="#">直播详情</a></li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<!-- The time line -->
						<ul class="timeline">
							<li class="time-label"><span class="bg-blue">活动信息详情</span></li>
							<li><i class="fa fa-gears bg-maroon"></i>
								<div class="timeline-item">
									<div class="timeline-body">
										<div class="row">
											<div class="col-md-12">
												<div class="box box-danger">
													<div class="box-body">
														<table class="table table-bordered">
															<tr>
																<td colspan="3" align='center'><h2>${tActivity.name}</h2></td>
															</tr>
															<tr>
																<td style="width: 200pt">状态:</td>
																<td colspan="3"><span class="class label-danger">
																		<c:if test="${tActivity.state==0}">未开始</c:if> <c:if
																			test="${tActivity.state==1}">直播中</c:if> <c:if
																			test="${tActivity.state==2}">已结束</c:if>
																</span></td>
															</tr>
															<tr>
																<td>EPG条目:</td>
																<td colspan="3">${tActivity.epg_name}</td>
															</tr>
															<tr>
																<td>地点:</td>
																<td colspan="3">${tActivity.place}</td>
															</tr>
															<tr>
																<td>简介:</td>
																<td colspan="3">${tActivity.description}</td>
															</tr>
															<tr>
																<td>直播时间</td>
																<td colspan="3">${tActivity.start_time}</td>
															</tr>
															<tr>
																<td>直播地点</td>
																<td colspan="3">${tActivity.end_time}</td>
															</tr>
															<tr>
																<td>现场联系人</td>
																<td colspan="3">${tActivity.contact_user}</td>
															</tr>
<tr>
																<td>邮件抄送</td>
																<td colspan="3">${tActivity.notify_user}</td>
															</tr>
															<tr>
																<td>并发用户数</td>
																<td colspan="3">${tActivity.v_count}</td>
															</tr>
															<tr>
																<td>画面LOGO</td>
																<td colspan="3">${tActivity.logo}</td>
															</tr>
															<tr>
																<td>UUID</td>
																<td colspan="3"><span class="class label-success">${tActivity.uuid}</span></td>
															</tr>
															<tr>
																<td>是否收费</td>
																<td colspan="3"><c:if
																		test="${tActivity.is_free==0}">收费</c:if> <c:if
																		test="${tActivity.is_free==1}">免费</c:if></td>
															</tr>
															<tr>
																<td>回放地址</td>
																<td colspan="3">${tActivity.playbak_url}</td>
															</tr>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div></li>
							<li class="time-label"><span class="bg-red">播出频道</span></li>
							<li><i class="fa fa-video-camera bg-maroon"></i>
								<div class="timeline-item">
									<h3 class="timeline-header">
										<a>频道名称（实际播放地址）</a>
									</h3>
									<div class="timeline-body">
										<div class="row">
											<c:forEach var="item" items="${vChannels}" varStatus="stat">
												<div class="col-md-6">
													<div class="box  box-success box-solid">
														<div class="box-header with-border">
															<h3 class="box-title">${item.name_zh}</h3>
															<div class="box-tools pull-right">
																<button class="btn btn-sm" id="play_button_${item.id}"
																	onclick="play(${item.id});">重新载入</button>
															</div>
														</div>
														<div class="box-body">
															<input type="hidden" name="play_url_${item.id}"
																id="play_url_${item.id}" value="${item.play_url}" /> <span
																class="mailbox-attachment-icon has-img"
																id="player_span_${item.id}"> <img
																src="${BASE}/static/assets/dist/img/photo2.png"
																alt="Attachment">
															</span>
														</div>
														<div class="box-footer"></div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class='timeline-footer'></div>
								</div></li>
								<li class="time-label"><span class="bg-yellow">流媒体服务器</span></li>
							<li><i class="fa fa-gears bg-aqua"></i>
								<div class="timeline-item">
									<h3 class="timeline-header">
										<a href="#">wowza 编解码地址</a>
									</h3>
									<div class="timeline-body">
										<div class="row">
										  <c:forEach var="item" items="${vChannels}" varStatus="stat">
											<div class="col-md-6">
												<div class="box  box-warning box-solid">
													<div class="box-header with-border">
														<h3 class="box-title">${item.application_name}/${item.stream_name}</h3>
														<div class="box-tools pull-right">
															<button class="btn btn-sm"
																id="play_button_w_${item.uuid}"
																onclick="play_w('${item.uuid}');">重新载入</button>
														</div>
													</div>
													<div class="box-body">
														<input type="hidden"
															name="play_url_w_${item.uuid}"
															id="play_url_w_${item.uuid}"
															value="${item.publish_url}" /> <span
															class="mailbox-attachment-icon has-img w"
															id="player_span_${item.uuid}"> <img
															src="${BASE}/static/assets/dist/img/photo2.png"
															alt="Attachment">
														</span>
													</div>
													<div class="box-footer"></div>
												</div>
											</div>
											</c:forEach>
										</div>
									</div>
								</div></li>
						</ul>
					</div>
				</div>
			</section>
		</div>
		<%@ include file="/pages/common/bottom.jsp"%>
	</div>
	<%@ include file="/pages/common/js.jsp"%>
	<script src="${BASE}/static/assets/cnlive/js/player_6.js"></script>
</body>
</html>

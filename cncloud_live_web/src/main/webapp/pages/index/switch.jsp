<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>信号切换 | <f:message key="common.title" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
<style type="text/css">
.loading {
	width: 160px;
	height: 56px;
	top: 50%;
	left: 50%;
	line-height: 56px;
	color: #fff;
	padding-left: 60px;
	font-size: 15px;
	background: #000 url(static/assets/cnlive/images/loader.gif) no-repeat
		10px 50%;
	opacity: 0.9;
	z-index: 9999;
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	border-radius: 10px;
	filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70);
}
</style>
</head>
<body class="skin-blue  fixed ">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					实时信号切换台 <small>switch</small> <small class="label label-warning"
						style="display: none" id="info_tab_span"><i
						class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="#">信号切换</a></li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="box box-info">
						<div class="box-body" style="background-color: #d2d6de;">
							<div class="col-md-4">
								<div class="box box-default ">
									<div class="box-header with-border">
										<i class="fa fa-bullhorn text-red"></i>
										<h3 class="box-title">wowza信号</h3>
									</div>
									<div class="box-body" id="selected_wowza">
										<!-- 所选信号源模板 -->
									</div>
								</div>
							</div>
							<div class="col-md-2">
							<br/>
							<br/>
							<br/>
							<button class="btn btn-warning" id="btn_switch" disabled="disabled" onclick="confirm_switch();">
								<i class="fa fa-random"></i> 切换信号
							</button>
							<br/>
							<input type="hidden" name="selected_wowza_id" value=""
								id="selected_wowza_id" /> <input type="hidden"
								name="selected_channel_id" value="" id="selected_channel_id" />
							<br/>
							<button class="btn btn-danger" onclick="un_lock_ref(this);">
								<i class="fa fa-lock"></i> 只读模式
							</button>
							</div>
							<div class="col-md-6">
								<div class="box box-default ">
									<div class="box-header with-border">
										<i class="fa fa-bullhorn text-green"></i>
										<h3 class="box-title">目标频道</h3>
									</div>
									<div class="box-body" id="selected_channel">
										<!-- 所选频道模板 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="box box-info">
						<div class="box-body" style="background-color: #d2d6de;">
							<div class="col-md-6">
								<div class="box box-info">
									<div class="box-header">
										<ul class="nav nav-tabs pull-left ui-sortable-handle">
											<li class="active"><a href="#revenue-chart"
												data-toggle="tab" aria-expanded="false">直播信号</a></li>
											<li class=""><a href="#sales-chart" data-toggle="tab"
												aria-expanded="true">滚播信号</a></li>
										</ul>
									</div>
									<div class="box-body" id="wowza_div">
										<div class="tab-content no-padding">
										<!-- 直播信号 -->
											<div class="chart tab-pane active" id="revenue-chart">
												<c:forEach var="item" items="${wowzas_1}" varStatus="stat">
													<div class="col-md-8">
														<div class="box box-success box-solid">
															<div class="box-header with-border">
																<h3 class="box-title" id="wowza_ip_${item.id}">${item.wowza_lan_ip}</h3>
															</div>
															<div class="box-body">
																<!-- 流媒体信号选择 -->
																<ul class="nav nav-pills nav-stacked">
																	<c:forEach items="${fn:split(item.name,',')}" var="name">
																		<li style="cursor: pointer"
																			id='div_wowza_box_${fn:substringAfter(name, "#")}'
																			onclick="select_wowza('${name}','${item.wowza_lan_ip}');">
																			<a><i class="fa fa-circle-o text-yellow"></i>
																				<c:choose>
																					<c:when test="${fn:contains(name,\"[]\")}">
																					 	${fn:substringBefore(fn:replace(name,'[]', ''), "#")}
																					</c:when>
																					<c:otherwise>
																						${fn:substringBefore(name, "#")}
																					</c:otherwise>
																				</c:choose>
																			</a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
													</div>
												</c:forEach>	
											</div>
											<!-- 点播信号 -->
											 <div class="chart tab-pane " id="sales-chart">
											 	<c:forEach var="item" items="${wowzas_2}" varStatus="stat">
													<div class="col-md-8">
														<div class="box box-info box-solid">
															<div class="box-header with-border">
																<h3 class="box-title" id="wowza_ip_${item.id}">${item.wowza_lan_ip}</h3>
															</div>
															<div class="box-body">
																<!-- 流媒体信号选择 -->
																<ul class="nav nav-pills nav-stacked">
																	<c:forEach items="${fn:split(item.name,',')}" var="name">
																		<li style="cursor: pointer"
																			id='div_wowza_box_${fn:substringAfter(name, "#")}'
																			onclick="select_wowza('${name}','${item.wowza_lan_ip}');">
																			<a><i class="fa fa-circle-o text-yellow"></i>
																				<c:choose>
																					<c:when test="${fn:contains(name,\"[]\")}">
																					 	${fn:substringBefore(fn:replace(name,'[]', ''), "#")}
																					</c:when>
																					<c:otherwise>
																						${fn:substringBefore(name, "#")}
																					</c:otherwise>
																				</c:choose>
																			</a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
													</div>
												</c:forEach>
											 </div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="box box-info">
									<div class="box-header">
										<h3 class="box-title">输出频道</h3>
									</div>
									<div class="box-body"  id="channel_div">
										<c:forEach var="item" items="${vChannels}" varStatus="stat">
											<div class="col-lg-6 col-xs-6">
												<div onclick="select_channel('${item.name_zh}',${item.id},'${item.state}');"  class="small-box  ${item.state==2 ? 'bg-red':'bg-aqua'}" title="${item.state==2 ? 'bg-red':'bg-aqua'}" style="cursor: pointer" id="div_channel_box_${item.id}">
													<div class="inner">
														<h4>${item.name_zh}</h4>
														<p><input
															type="checkbox" name="channel_id" title="${item.name_zh}"
															value="${item.id}" class="flat-red" /> ${empty item.stream_name ? item.default_stream_name:item.stream_name}</p>
													</div>
													<a href="#" class="small-box-footer">${item.activity_name}<i
														class="fa fa-arrow-circle-right"></i></a>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div class="modal" id="switch_confirm_modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">确认？</h4>
					</div>
					<div class="modal-body">
						<div class="box box-solid" id="tip_table"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default pull-left"
								data-dismiss="modal">Close</button>
							<button type="button" onclick="do_switch();"
								class="btn btn-primary">确定切换</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/pages/common/bottom.jsp"%>
	</div>
	<%@ include file="/pages/common/js.jsp"%>
	<script src="${BASE}/static/assets/cnlive/js/switch.js"
		type="text/javascript"></script>
</body>
</html>


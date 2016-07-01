<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>直播前操作 | <f:message key="common.title" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
<link rel="stylesheet"
	href="${BASE}/static/assets/plugins/countdown/countdown/jquery.countdown.css" />
<!-- Ion Slider -->
<link href="${BASE}/static/assets/plugins/ionslider/ion.rangeSlider.css"
	rel="stylesheet" type="text/css" />
<!-- ion slider Nice -->
<link
	href="${BASE}/static/assets/plugins/ionslider/ion.rangeSlider.skinNice.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap slider -->
<link href="${BASE}/static/assets/plugins/bootstrap-slider/slider.css"
	rel="stylesheet" type="text/css" />
<script src="${BASE}/static/assets/jwplayer/jwplayer.js"></script>
<script src="${BASE}/static/assets/jwplayer/jwplayer.html5.js"></script>
<script type="text/javascript">jwplayer.key="MGAzpXRYxGnaVXhH8jSdKXzDe7ucAAvZGWggIA==";</script>
<link
	href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
	rel="stylesheet">
</head>
<body  class="skin-blue  fixed ">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					直播活动详情 <small>${tActivity.name}</small> <input type="hidden"
						name="activity_id" id="activity_id" value="${tActivity.id}" /> <small
						class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="${BASE}/activity/list/1">活动管理</a></li>
					<li class="active">活动步骤</li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="box box-danger">
						<div class="box-header">
							<h3 class="box-title">直播倒计时：</h3>
						</div>
						<div class="box-body">
							<div class="row">
								<div class="col-xs-6">
									<div class="form-group has-warning">
										<label class="control-label" for="inputWarning"> <i
											class="fa fa-bell-o"></i> 提示：请根据直播操作流程严格执行以下任务流程！
										</label>
									</div>
								</div>
								<div class="col-xs-6" id="countdown"></div>
								<p id="note" style="display: none"></p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="timeline-item">
							<div class="col-md-12">
								<ul class="timeline">
									<li class="time-label"><span class="bg-green"> step
											1 </span></li>
									<li>
										<div class="timeline-item">
											<span class="time">
												<button onclick="show_time_div();"
													class="btn  btn-info  btn-sm">修改播出时间</button>
											</span>
											<h3 class="timeline-header">
												<span class="handle ui-sortable-handle"> <i
													class="fa fa-ellipsis-v"></i>
												</span><a href="#">提前发布EPG</a> 将会修改以下频道的客户端播出epg信息
											</h3>
											<div class="timeline-body">
												<div class="row">
													<c:forEach var="item" items="${vChannels}" varStatus="stat">
														<div class="col-md-3">
															<div class="info-box bg-red" style="padding: 10px;">
																<span class="info-box-number">${item.name_zh }</span>
																<div class="progress">
																	<div class="progress-bar" style="width: 100%"></div>
																</div>
																<span class="progress-description">${item.name_en}</span>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
											<div class="timeline-footer">
												<button type="button" id="btn_replace_epg"
													onclick="replace_epg(${tActivity.id});"
													class="btn  btn-success">执行替换</button>
											</div>
										</div>
									</li>
									<li id="eidt_time_li" style="display: none">
										<ul class="timeline">
											<li>
												<div class="timeline-item">
													<h3 class="timeline-header">
														<span class="handle ui-sortable-handle"> <i
															class="fa fa-ellipsis-v"></i>
														</span><a href="#">活动延迟</a> 推迟活动开始或者结束
													</h3>
													<div class="timeline-body">
														<div class="form-group">
															<div class="row">
																<div class="col-lg-6">
																	<div class="input-group">
																		<span class="input-group-addon"> 开始时间 </span> <input
																			type="text" class="form-control form_datetime"
																			value="<fmt:formatDate value="${tActivity.start_time}" pattern="yyyy-MM-dd HH:mm"/>"
																			name="start_time" id="start_time"
																			data-inputmask="'alias': 'yyyy-MM-dd HH:mm'"
																			data-mask="" />
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="input-group">
																		<span class="input-group-addon"> 结束时间</span> <input
																			type="text" class="form-control form_datetime"
																			value="<fmt:formatDate value="${tActivity.end_time}" pattern="yyyy-MM-dd HH:mm"/>"
																			name="end_time" id="end_time"
																			data-inputmask="'alias': 'yyyy-MM-dd HH:mm'"
																			data-mask="">
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="timeline-footer">
														<button type="button" id="update_time_btn"
															name="update_time_btn" onclick="update_activity_time();"
															class="btn  btn-warning">执行修改</button>
													</div>
												</div>
											</li>
										</ul>
									</li>
									 

									<li class="time-label"><span class="bg-blue"> step
											2 </span></li>
									<li id="view_video">
										<div class="timeline-item">
											<h3 class="timeline-header">
												<span class="handle ui-sortable-handle"> <i
													class="fa fa-ellipsis-v"></i>
												</span><a href="#">wowza信号测试</a>
											</h3>
											<div class="timeline-body">
												<div class="row">
												<c:forEach var="item" items="${vChannels}" varStatus="stat">
													<c:if test="${stat.count == 1}">
														<div class="col-md-4">
															<div class="box  box-warning box-solid">
																<div class="box-header with-border">
																	<h3 class="box-title">${item.application_name}/${item.stream_name}</h3>
																</div>
																<div class="box-body">
																	<input type="hidden" name="play_url_${item.id}"
																		id="play_url_${item.id}" value="${item.publish_url}" />
																	<span class="mailbox-attachment-icon has-img"
																		id="player_span_${item.id}"> <img
																		src="${BASE}/static/assets/dist/img/photo2.png"
																		alt="Attachment">
																	</span>
																</div>
																<div class="box-footer"></div>
															</div>
														</div>
													</c:if>
												</c:forEach>
											</div>
											<div class="timeline-footer">.</div>
										</div>
									</li>

									<li class="time-label"><span class="bg-green"> step
											3 </span></li>
									<li>
										<div class="timeline-item">
											<h3 class="timeline-header">
												<span class="handle ui-sortable-handle"> <i
													class="fa fa-ellipsis-v"></i>
												</span><a href="#">切入现场信号</a>
											</h3>
											<div class="timeline-body">
												<div class="row">
													<div class="col-md-4">
														<button type="button" id="switch_btn"
															onclick="do_switch(${tActivity.id});"
															style="width: 250px; height: 100px"
															class="btn btn-block btn-lg  btn-danger">切换信号</button>
													</div>
													<div class="col-md-4">
														<button type="button" name="ad_btn"
															onclick="do_ad(${tActivity.id});"
															style="width: 250px; height: 100px"
															class="btn btn-block btn-lg  btn-warning">
															紧急垫片<br>
														</button>
													</div>
												</div>
											</div>
										</div>
									</li>
									<li><i class="fa fa-clock-o bg-gray"></i></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@ include file="/pages/common/bottom.jsp"%>
	</div>
	<%@ include file="/pages/common/js.jsp"%>
	<script
		src="${BASE}/static/assets/plugins/countdown/countdown/jquery.countdown.js"></script>
	<script src="${BASE}/static/assets/cnlive/js/player_4.js"></script>

	<!-- Ion Slider -->
	<script
		src="${BASE}/static/assets/plugins/ionslider/ion.rangeSlider.min.js"
		type="text/javascript"></script>

	<!-- Bootstrap slider -->
	<script
		src="${BASE}/static/assets/plugins/bootstrap-slider/bootstrap-slider.js"
		type="text/javascript"></script>
			<script
		src="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
		
	<script type="text/javascript">
	$(function(){
		
		var hid_s=$("#start_time").val();
	    var time = new Date(hid_s.replace("-", "/"));
		var note = $('#note'),
			ts = new Date(2012, 0, 1),
			newYear = true;
		if((new Date()) > ts){
			ts = time.getTime();
			newYear = false;
		}
			 
		$('#countdown').countdown({
			timestamp	: ts,
			callback	: function(days, hours, minutes, seconds){
				var message = "";
				message += days + " day" + ( days==1 ? '':'s' ) + ", ";
				message += hours + " hour" + ( hours==1 ? '':'s' ) + ", ";
				message += minutes + " minute" + ( minutes==1 ? '':'s' ) + " and ";
				message += seconds + " second" + ( seconds==1 ? '':'s' ) + " <br />";
				if(newYear){
					message += "left until the new year!";
				}
				else {
					message += "left to 10 days from now!";
				}
				note.html(message);
			}
		});
	});
	  $(".form_datetime").datetimepicker({
	        //format: "dd MM yyyy - hh:ii",
	        format: "yyyy-mm-dd hh:ii",
	        autoclose: true,
	        todayBtn: true,
	        pickerPosition: "bottom-right"
	    });     
    </script>
</body>
</html>

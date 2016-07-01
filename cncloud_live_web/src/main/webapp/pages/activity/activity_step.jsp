<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活动管理 | <f:message key="common.title" /></title>
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
						<ul class="timeline">
							<li class="time-label" id="li_qian"><span class="bg-red">直播前操作流程
									<i class="fa fa-clock-o"></i> <fmt:formatDate
										value="${tActivity.start_time}" pattern="yyyy-mm-dd HH:mm" />
									之前
							</span></li>
							<li>
								<div class="timeline-item">
									<div class="col-md-12">
										<ul class="timeline">
											<li class="time-label"><span class="bg-yellow">
													step 1 </span></li>
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
																<div class="col-lg-4">
																	<div class="input-group">
																		<input type="hidden" name="start_time_hid"
																			id="start_time_hid"
																			value="<fmt:formatDate value="${tActivity.start_time}" pattern="yyyy-MM-dd HH:mm"/>" />
																		<span class="input-group-addon"> 开始时间 </span> <input
																			type="text" class="form-control form_datetime"
																			disabled="disabled" name="start_time" id="start_time"
																			value="<fmt:formatDate value="${tActivity.start_time}" pattern="yyyy-MM-dd HH:mm"/>" />
																	</div>
																</div>
																<div class="col-lg-8">
																	<input id="start_range" type="text" name="start_range"
																		value="" />
																</div>
															</div>
														</div>
														<div class="form-group">
															<div class="row">
																<div class="col-lg-4">
																	<div class="input-group">
																		<input type="hidden" name="end_time_hid"
																			id="end_time_hid"
																			value="<fmt:formatDate value="${tActivity.end_time}" pattern="yyyy-MM-dd HH:mm"/>" />
																		<span class="input-group-addon"> 结束时间 </span> <input
																			type="text" class="form-control form_datetime"
																			name="end_time" id="end_time" disabled="disabled"
																			value="<fmt:formatDate value="${tActivity.end_time}" pattern="yyyy-MM-dd HH:mm"/>" />
																	</div>
																</div>
																<div class="col-lg-8">
																	<input id="end_range" type="text" name="end_range"
																		value="" />
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
											<li class="time-label"><span class="bg-green">
													step 2 </span></li>
											<li>
												<div class="timeline-item">
													<h3 class="timeline-header">
														<span class="handle ui-sortable-handle"> <i
															class="fa fa-ellipsis-v"></i>
														</span><a href="#">提前发布EPG</a> 将会修改以下频道的客户端播出epg信息
													</h3>
													<div class="timeline-body">
														<div class="row">
															<c:forEach var="item" items="${vChannels}"
																varStatus="stat">
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
											<li class="time-label"><span class="bg-blue">
													step 3 </span></li>
											<li>
												<div class="timeline-item">
													<c:forEach var="item" items="${vChannels}" varStatus="stat">
														<c:if test="${status.count == 1}">
															<h3 class="timeline-header">
																<span class="handle ui-sortable-handle"> <i
																	class="fa fa-ellipsis-v"></i>
																</span><a href="#">启动直播编码器</a>
															</h3>
															<div class="timeline-body">
																请登陆服务器
																<code>${item.t_signal_ip}</code>
																后，在导航栏找到编码器
																<code>${item.t_signal_name}</code>
																,点击启动。
															</div>
															<div class="timeline-footer">
																<button type="button"
																	onclick="javascript:window.open('${item.t_signal_admin_url}')"
																	class="btn  btn-primary">登录</button>
															</div>
														</c:if>
													</c:forEach>
												</div>
											</li>
											<li id="view_video">
												<div class="timeline-item">
													<h3 class="timeline-header">
														<span class="handle ui-sortable-handle"> <i
															class="fa fa-ellipsis-v"></i>
														</span><a href="#">wowza信号测试</a>
													</h3>
													<div class="timeline-body">
														<c:forEach var="item" items="${vChannels}"
															varStatus="stat">
															<div class="col-md-4">
																<div class="box  box-warning box-solid">
																	<div class="box-header with-border">
																		<h3 class="box-title">${item.name_zh}${item.application_name}/${item.stream_name}</h3>
																		<div class="box-tools pull-right">
																			<button class="btn btn-sm"
																				id="play_button_${item.id}"
																				onclick="play_(${item.id});">重新载入</button>
																		</div>
																	</div>
																	<div class="box-body">
																		<input type="hidden" name="play_url_${item.id}"
																			id="play_url_${item.id}"
																			value="${item.publish_url}" /> <span
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
													<div class="timeline-footer">
														.
													</div>
												</div>
											</li>
											<li class="time-label"><span class="bg-aqua">
													step 4 </span></li>
											<li>
												<div class="timeline-item">
													<h3 class="timeline-header">
														<span class="handle ui-sortable-handle"> <i
															class="fa fa-ellipsis-v"></i>
														</span><a href="#">发送push消息</a>
													</h3>
													<div class="timeline-body">登录消息后台发送push消息</div>
													<div class="timeline-footer">
														<button type="button"
															onclick="javascript:window.open('http://cnlive.com/CnAdmin/gotoPushCNLiveV5IphoneMsg.action')"
															class="btn  btn-primary">登录</button>
													</div>
												</div>
											</li>
											<li class="time-label"><span class="bg-green">
													step 5 </span></li>
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
																	紧急垫片<br> <small>(${tDefaultVideo.name})</small>
																</button>
															</div>
															<div class="col-md-4">
																<button type="button" name="reset_btn"
																	onclick="do_stop(${tActivity.id});"
																	style="width: 250px; height: 100px"
																	class="btn btn-block btn-lg  btn-info">结束（信号复位）</button>
															</div>
														</div>
													</div>
												</div>
											</li>
											<li><i class="fa fa-clock-o bg-gray"></i></li>
										</ul>
									</div>
								</div>
							</li>
							<li class="time-label" id="li_zhong"><span class="bg-green">直播中操作流程
									<i class="fa fa-clock-o"></i> <fmt:formatDate
										value="${tActivity.start_time}" pattern="HH:mm" />--<fmt:formatDate
										value="${tActivity.end_time}" pattern="HH:mm" />
							</span></li>
							<li>
								<div class="timeline-item">
									<div class="col-md-12">
										<ul class="timeline">
											<li class="time-label"><span class="bg-blue">
													step 1 </span></li>
											<li>
												<div class="timeline-item">
													<h3 class="timeline-header">
														<span class="handle ui-sortable-handle"> <i
															class="fa fa-ellipsis-v"></i>
														</span><a href="#">录制回放检查</a>
													</h3>
													<div class="timeline-body">验证录制文件（MP4）信息</div>
													<div class="timeline-footer">
														<p>
															<a class="btn btn-primary btn-xs">媒体信息：</a>
														</p>
														<p>
															<a class="btn btn-danger btn-xs">文件大小：3000kB</a>
														</p>
													</div>
													<div class="timeline-footer">
														<button type="button" id="checkfile_btn"
															onclick="do_checkfile(${tActivity.id});"
															class="btn  btn-primary">验证文件</button>
													</div>
												</div>
											</li>
											<li class="time-label"><span class="bg-aqua">
													step 2 </span></li>
											<li>
												<div class="timeline-item">
													<h3 class="timeline-header">
														<span class="handle ui-sortable-handle"> <i
															class="fa fa-ellipsis-v"></i>
														</span><a href="#">监控直播画面</a>
													</h3>
													<div class="timeline-body"></div>
													<div class="timeline-footer">
														<button type="button"
															onclick="to_view();"
															class="btn  btn-primary">GO</button>
													</div>

												</div>
											</li>
											<li class="time-label"><span class="bg-yellow">
													step 3 </span></li>
											<li>
												<div class="timeline-item">
													<h3 class="timeline-header">
														<span class="handle ui-sortable-handle"> <i
															class="fa fa-ellipsis-v"></i>
														</span><a href="#">紧急处理</a>
													</h3>
													<div class="timeline-body">
														<div class="row">
															<div class="col-md-4">
																<button type="button" name="ad_btn"
																	onclick="do_ad(${tActivity.id});"
																	style="width: 250px; height: 100px"
																	class="btn btn-block btn-lg  btn-warning">
																	紧急垫片<br> <small>(${tDefaultVideo.name})</small>
																</button>
															</div>
															<div class="col-md-4">
																<button type="button" name="reset_btn"
																	onclick="do_stop(${tActivity.id});"
																	style="width: 250px; height: 100px"
																	class="btn btn-block btn-lg  btn-info">结束（信号复位）</button>
															</div>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</li>
							<li class="time-label" id="li_hou"><span class="bg-yellow">直播后操作流程<i
									class="fa fa-clock-o"></i> 21:30 之后
							</span></li>
							<li>
								<div class="timeline-item">
									<div class="col-md-12">
										<ul class="timeline">
											<li class="time-label"><span class="bg-blue">
													step 1 </span></li>
											<li>
												<div class="timeline-item">
													<span class="time"> <small
														class="label label-warning" style="display: none"
														id="info_tab_span"><i class="fa fa-bell-o"></i>复位成功</small></span>
													<h3 class="timeline-header">
														<span class="handle ui-sortable-handle"> <i
															class="fa fa-ellipsis-v"></i>
														</span><a href="#">直播信号复位</a>
													</h3>
													<div class="timeline-body">
														将以下频道信号恢复至默认信号：
														<c:forEach var="item" items="${vChannels}"
															varStatus="stat">
																<code>${item.name_zh}</code>、
														</c:forEach>
													</div>
													<div class="timeline-footer">
														<button type="button" name="reset_btn"
															onclick="do_stop(${tActivity.id});"
															class="btn  btn-danger">结束（信号复位）</button>
													</div>
												</div>
											</li>
											<li class="time-label"><span class="bg-aqua">
													step 2 </span></li>
											<li>
												<div class="timeline-item">
													<h3 class="timeline-header">
														<span class="handle ui-sortable-handle"> <i
															class="fa fa-ellipsis-v"></i>
														</span><a href="#">录制回放检查</a>
													</h3>
													<div class="timeline-body">
														<p>
															<a class="btn btn-primary btn-xs">媒体信息：</a>
														</p>
														<p>
															<a class="btn btn-danger btn-xs">文件大小：3000kB</a>
														</p>
													</div>
													<div class="timeline-footer">
														<button type="button" id="checkfile_btn"
															onclick="do_checkfile(${tActivity.id});"
															class="btn  btn-primary">验证文件</button>
													</div>
												</div>
											</li>
											<li class="time-label"><span class="bg-yellow">
													step 3 </span></li>
											<li>
												<div class="timeline-item">
													<h3 class="timeline-header">
														<a href="#">推荐位下线</a>
													</h3>
													<div class="timeline-body">由此登录cms系统下线当前活动推荐位</div>
													<div class="timeline-footer">
														<button type="button" onclick="javascript:window.open()"
															class="btn  btn-warning">登录</button>
													</div>
												</div>
											</li>
											<li class="time-label"><span class="bg-green">
													step 4 </span></li>
											<li>
												<div class="timeline-item">
													<h3 class="timeline-header">
														<span class="handle ui-sortable-handle"> <i
															class="fa fa-ellipsis-v"></i>
														</span><a href="#">发布直播回放</a>
													</h3>
													<div class="timeline-body">
														<p>
															登录媒资系统发布：
															<code>
																<a target="_blank" href="http://mz.cnlive.com/base/live">http://mz.cnlive.com/base/live</a>
															</code>
														</p>
														<table class="table table-bordered">
															<tr>
																<td>当前同步状态:</td>
																<td><span class="class label-danger">同步中</span></td>
															</tr>
															<tr>
																<td width="15%">回放视频地址:</td>
																<td
																	style="word-break: break-all; word-wrap: break-word;"
																	width="85%">${tActivity.playbak_url}</td>
															</tr>
														</table>
													</div>
													<div class="timeline-footer">
														<button type="button"
															onclick="javascript:window.open('http://mz.cnlive.com/base/live')"
															class="btn  btn-success">登录</button>
													</div>
												</div>
											</li>
											<li><i class="fa fa-clock-o bg-gray"></i></li>
										</ul>
									</div>
								</div>
							</li>
							<li><i class="fa fa-clock-o bg-gray"></i></li>
						</ul>
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

	<script type="text/javascript">
//锚点定位
var date = new Date();
var year = date.getFullYear();
var month = date.getMonth()+1;
var day = date.getDate();
var hour = date.getHours();
var minute = date.getMinutes();
var second = date.getSeconds();
var currentTime=year+'/'+month+'/'+day+' '+hour+':'+minute;
var nhour=hour+2;
var nextTime=year+'/'+month+'/'+day+' '+nhour+':'+minute;
var startTime=$("#startTime").val();  
var endTime=$("#endTime").val();  
var next=new Date(nextTime); 
var current=new Date(currentTime); 
var start=new Date(startTime);  
var end=new Date(endTime);  
if(current<start){
	$("html,body").animate({scrollTop:$("#li_qian").offset().top},800)
}
if(current>start&&current<end){
	$("html,body").animate({scrollTop:$("#li_zhong").offset().top},800)
}
if(current<next&&current>end){
	$("html,body").animate({scrollTop:$("#li_hou").offset().top},800)
}
if(current>next){
	$("html,body").animate({scrollTop:$("#li_qian").offset().top},800)
}

function to_view(){
	$("html,body").animate({scrollTop:$("#view_video").offset().top},800)
}

	$(function(){
		
		var hid_s=$("#start_time_hid").val();
	    var time = new Date(hid_s.replace("-", "/"));
		var note = $('#note'),
			ts = new Date(2012, 0, 1),
			newYear = true;
		if((new Date()) > ts){
			ts = time.getTime();
			newYear = false;
		}
			console.log(time.getTime());
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

	
	
    function fail_start_time(t) {
    	var hid_s=$("#start_time_hid").val();
        var time = new Date(hid_s.replace("-", "/"));
        time.setMinutes(time.getMinutes() + t, time.getSeconds(), 0);
        $("#start_time").val(time.format("yyyy-MM-dd hh:mm"));
    }
    
    function fail_end_time(t) {
    	var hid_e=$("#end_time_hid").val();
        var time = new Date(hid_e.replace("-", "/"));
        time.setMinutes(time.getMinutes() + t, time.getSeconds(), 0);
        $("#end_time").val(time.format("yyyy-MM-dd hh:mm"));
    }
    
      $(function () {
        /* BOOTSTRAP SLIDER */
        $('.slider').slider();
        $("#process_bar").ionRangeSlider({
            min: 0,
            max: 100,
            from: 0,
            type: 'single',
            step: 1,
            postfix: "",
            prettify: false,
            hasGrid: true,
            onChange: function (obj) {
                var t =obj.fromNumber;
                fail_start_time(t);
              } 
          });
          
        
        $("#start_range").ionRangeSlider({
          min: -50,
          max: 50,
          from: 0,
          type: 'single',
          step: 1,
          postfix: "<i class=\"fa fa-clock-o\"></i>",
          prettify: false,
          hasGrid: true,
          onChange: function (obj) {
              var t =obj.fromNumber;
              fail_start_time(t);
            } 
        });
        
        $("#end_range").ionRangeSlider({
            min: -50,
            max: 50,
            from: 0,
            type: 'single',
            step: 1,
            postfix: "<i class=\"fa fa-clock-o\"></i>",
            prettify: false,
            hasGrid: true,
            onChange: function (obj) {
          	  console.log(obj.fromNumber);
                var t =obj.fromNumber;
                fail_end_time(t);
              },
          });
 
      });
    </script>
</body>
</html>

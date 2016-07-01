<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>直播中管理 | <f:message key="common.title" /></title>
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
											class="fa fa-bell-o"></i> 提示：请根据直播操作流程严格执行以下任务流程！ <input
											type="hidden" name="start_time_hid" id="start_time_hid"
											value="<fmt:formatDate value="${tActivity.start_time}" pattern="yyyy-MM-dd HH:mm"/>" />
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
													<div class="timeline-footer" id="mp4_info">
														 
														
													</div>
													<div class="timeline-footer">
														<button type="button" id="checkfile_btn"
															onclick="do_checkfile(${tActivity.id});"
															class="btn  btn-primary">验证文件</button>
													</div>
												</div>
											</li>
											<!-- 
											
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
														<button type="button" onclick="to_view();"
															class="btn  btn-primary">GO</button>
													</div>

												</div>
											</li>
											 -->
											<li class="time-label"><span class="bg-yellow">
													step  2 </span></li>
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
																	紧急垫片<br>
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

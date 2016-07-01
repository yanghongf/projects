<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新建活动 | <f:message key="common.title" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>

<style type="text/css">
            span.error{
                padding-left: 15px;
                color: red;
            }
        </style>
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
				<h1>${empty tActivity.id ? '新建活动':'编辑活动'}
					<small>${tActivity.name}</small> <small class="label label-warning"
						style="display: none" id="info_tab_span"><i
						class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">新增活动</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<form role="form" name="activityForm" method="post"
					id="activityForm">
					<div class="row">
						<!-- right column -->
						<div class="col-md-12">
							<!-- general form elements disabled -->
							<div class="box box-warning">
								<div class="box-body">
									<div class="form-group">
										<label> 活动名称 </label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa  fa-font"></i>
											</span> <input type="text" value="${tActivity.name }" name="name"
												id="name" class="form-control" placeholder="如：《我的音乐故事》于湉专场">
												<input type="text" id="activity_id" name="activity_id" value="${tActivity.id}" hidden="">
										</div>
									</div>
									<div class="form-group">
										<label> EPG条目名 </label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-navicon "></i> </span> <input type="text"
												class="form-control" value="${tActivity.epg_name}"
												name="epg_name" id="epg_name" placeholder="如: 于湉做客北京壹空间">
											<span class="input-group-btn">
												<button class="btn btn-info btn-flat" onclick="copy_name();"
													type="button">同上</button>
											</span>
										</div>
									</div>
									<div class="form-group">
										<label> 活动简述 </label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-file-word-o"></i> </span> <input type="text"
												class="form-control" value="${tActivity.description}"
												name="description" id="description" placeholder="简述">
										</div>
									</div>
									<div class="form-group">
										<label> 活动地点 </label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-street-view"></i> </span> <input type="text"
												class="form-control" value="${tActivity.place}" name="place"
												id="place" placeholder="如: 北京市朝阳区工人体育场">
										</div>
									</div>
									<div class="form-group">
										<label> 直播时间 </label>
										<div class="row">
											<div class="col-lg-6">
												<div class="input-group">
													<span class="input-group-addon"> 开始时间 </span> <input
														type="text" class="form-control form_datetime"
														value="<fmt:formatDate value="${tActivity.start_time}" pattern="yyyy-MM-dd HH:mm"/>"
														name="start_time" id="start_time"
														data-inputmask="'alias': 'yyyy-MM-dd HH:mm'" data-mask="" />
												</div>
											</div>
											<div class="col-lg-6">
												<div class="input-group">
													<span class="input-group-addon"> 结束时间</span> <input
														type="text" class="form-control form_datetime"
														value="<fmt:formatDate value="${tActivity.end_time}" pattern="yyyy-MM-dd HH:mm"/>"
														name="end_time" id="end_time"
														data-inputmask="'alias': 'yyyy-MM-dd HH:mm'" data-mask="">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label> 业务负责人 </label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa  fa-user"></i>
											</span> <input type="text" class="form-control"
												value="${tActivity.contact_user}" name="contact_user"
												id="contact_user" placeholder="如：曹峰-186110110" />
										</div>
									</div>
									<div class="form-group">
										<label> 预计并发人数 </label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-user-plus"></i> </span> <input type="text"
												class="form-control" value="${tActivity.v_count}"
												name="v_count" id="v_count" placeholder="如：200">
										</div>
									</div>
									<div class="form-group">
										<label> 抄送相关人员 </label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-user-md"></i> </span> <input type="text"
												class="form-control" value="${tActivity.notify_user }"
												name="notify_user" id="notify_user"
												placeholder="如：zhengxiangxiang@cnlive.com;liujicheng@cnlive.com">
										</div>
									</div>
									<div class="form-group">
										<label> 是否免费 </label>
										<div class="box box-warning">
											<div class="box-body">
												<div class="form-group">
													<label> <input type="radio"
														${tActivity.is_free==1 ? 'checked':''} name="is_free"
														value="1" class="flat-red" /> 是
													</label>
												</div>
												<div class="form-group">
													<label> <input type="radio"
														${tActivity.is_free==0 ? 'checked':''} name="is_free"
														value="0" class="flat-red" /> 否
													</label>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label> 启用回放 </label>
										<div class="box box-warning">
											<div class="box-body">
												<div class="form-group">
													<label> <input type="radio" name="is_playback"
														${tActivity.is_playback==1 ? 'checked':''} value="1"
														class="flat-red" /> 是
													</label>
												</div>
												<div class="form-group">
													<label> <input type="radio" name="is_playback"
														${tActivity.is_playback==0 ? 'checked':''} value="0"
														class="flat-red" /> 否
													</label>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label> 画面logo </label>
										<div class="box box-warning">
											<div class="box-body">
												<div class="form-group">
													<label> <input type="radio" name="logo" value="tv"
														${tActivity.logo=='tv' ? 'checked':''} class="flat-red"
														checked /> @TV
													</label>
												</div>
												<div class="form-group">
													<label> <input type="radio" name="logo"
														${tActivity.logo=='liveshow' ? 'checked':''}
														value="liveshow" class="flat-red" /> LiveShow
													</label>
												</div>
												<div class="form-group">
													<label> <input type="radio" name="logo"
														value="null" ${tActivity.logo=='null' ? 'checked':''}
														class="flat-red" /> 无
													</label>
												</div>
											</div>
										</div>
									</div>
									  
									<div class="form-group">
										<label> 垫片 </label>
										<div class="box box-warning">
											<div class="box-body">
												<div class="form-group">
													<select class="form-control" name="t_default_video_id"
														id="t_default_video_id">
														<c:forEach var="item" items="${tDefaultVideos}"
															varStatus="stat">
															<option  id="default_video_${item.id}" ${item.id==tActivity.t_default_video_id ? 'selected="selected"':''}   value="${item.id}">${item.name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
 									<!-- 特殊情况下需要手动输入uuid 
									<c:choose>
										<c:when test="${empty tActivity.id}">
											<div class="form-group">
												<label>UUID </label>
												<div class="input-group">
													<span class="input-group-addon"><i
														class="fa  fa-user"></i> </span> <input type="text"
														class="form-control" value="${tActivity.uuid}" name="uuid"
														id="uuid" placeholder="输入在ICMS新建的直播活动uuid" />
												</div>
											</div>
										</c:when>
									</c:choose>-->
									<div class="form-group">
										<label>聊天室ID </label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa  fa-user"></i> </span> <input type="text"
												class="form-control" value="${empty tActivity.chatroom_id ? '10001':tActivity.chatroom_id}" name="chatroom_id"
												id="chatroom_id"  />
										</div>
									</div>
									<div class="form-group">
										<label> 输出频道 </label>
										<div class="row">
											<div class="col-md-12">
												<div class="box box-solid box-warning">
													<div class="box-header">
														<h3 class="box-title">请选择以下频道</h3>
													</div>
													<div class="box-body">
														<c:forEach var="item" items="${tChannels}"
															varStatus="stat">
															<div class="col-sm-3">
																<div class="small-box bg-aqua"
																	id="div_channel_box_${item.id}"
																	onclick="select_channel(${item.id});">
																	<div class="inner">
																		<h2>${item.name_zh}</h2>
																		<input type="checkbox" disabled="disabled"
																		name="channel_id" title="${item.name_zh}"
																		value="${item.id}" class="flat-red" />${item.id}
																	</div>
																	<a class="small-box-footer">主通道：
																		<input type="radio" 
																		name="is_main"   id="is_main" 
																		value="${item.id}" class="flat-red" /></a>
																</div>
															</div>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="box-footer">
										<button type="button" id="t_activity_save_btn"
											name="t_activity_save_btn" onclick="toSubmit();"
											class="btn  btn-success">
											<i class="fa  fa-save "></i> 保存
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
		</div>
		</section>
	</div>
 </div>
	<%@ include file="/pages/common/bottom.jsp"%>
</div>
	 <!-- 信号选择结束 -->
	<%@ include file="/pages/common/js.jsp"%>

	<script src="${BASE}/static/assets/cnlive/js/activity.js"></script>
	<script
		src="${BASE}/static/assets/cnlive/js/validate/validate_activity.js"
		type="text/javascript"></script>
	<c:forEach var="item" items="${tChannels}" varStatus="stat">
		<c:if test="${item.t_activity_id==tActivity.id}">
		<script type="text/javascript">
				var selected_id=${item.id};
				select_channel(selected_id);
			</script>
		</c:if>
	</c:forEach>
	<script type="text/javascript">
	 
      $(function () {
        //Money Euro
        $("[data-mask]").inputmask();
      });
		
       $(function () {
        $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
        //Money Euro
        $("[data-mask]").inputmask();

        //Date range picker
        $('#reservation').daterangepicker();
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
        //Date range as a button
        $('#daterange-btn').daterangepicker(
                {
                  ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    'Last 7 Days': [moment().subtract('days', 6), moment()],
                    'Last 30 Days': [moment().subtract('days', 29), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                  },
                  startDate: moment().subtract('days', 29),
                  endDate: moment()
                },
        function (start, end) {
          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
        );
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
          checkboxClass: 'icheckbox_flat-green',
          radioClass: 'iradio_flat-green'
        });
      });
    </script>


	<!-- Le javascript
  ================================================== -->
	<script
		src="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

	<script type="text/javascript">
    $(".form_datetime").datetimepicker({
        //format: "dd MM yyyy - hh:ii",
        format: "yyyy-mm-dd hh:ii",
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-right"
    });
</script>
	<script type="text/javascript">
 $(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-green',
    radioClass: 'iradio_square-green',
    increaseArea: '20%' // optional
  });
});
    </script>
</body>
</html>

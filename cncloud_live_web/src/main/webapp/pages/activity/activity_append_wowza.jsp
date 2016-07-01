<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>设定输入信号 | <f:message key="common.title" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
</head>
<body class="skin-blue  fixed ">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					设置输入信号 <small>${tActivity.name}</small> <small
						class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">新增活动</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- right column -->
					<div class="col-md-12">
						<!-- general form elements disabled -->
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-6">
									<div class="box box-primary">
										<div class="box-header">
											<h3 class="box-title text-blue">#选择Wowza服务器</h3>
										</div>
										<div class="box-body">
											<c:forEach var="item" items="${tWowzas}" varStatus="stat">
												<div class="form-group">
													<label> <input type="radio" name="tWowza"
														value="${item.id}" class="flat-green" />${item.name}_${item.lan_ip}
													</label>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="box box-warning">
										<div class="box-header">
											<h3 class="box-title text-yellow">#选择Wowza Stream</h3>
										</div>
										<div class="box-body" id="wowza_stream_body"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="box-footer" style="text-align:center; margin:0 auto;">
							<button type="button" id="append_wowza_btn"
								class="btn  btn-danger"
								onclick="append_wowza(${tActivity.id});">确认保存</button>
						</div>

						<div class="box box-warning">
							<div class="box-body">
								<div class="col-md-12">
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
												<td colspan="3"><c:if test="${tActivity.is_free==0}">收费</c:if>
													<c:if test="${tActivity.is_free==1}">免费</c:if></td>
											</tr>
											<tr>
												<td>回放地址</td>
												<td colspan="3">${tActivity.playbak_url}</td>
											</tr>
											<tr>
												<td>播出频道：</td>
												<td colspan="3"><c:forEach var="item"
														items="${tChannels}" varStatus="stat">
														${item.name_zh}、
												 </c:forEach></td>
											</tr>
											<tr>
												<td>输入信号：</td>
												<td colspan="3">
													stream_name：${vWowzaSignal.stream_name}、wowza_name：${vWowzaSignal.wowza_name}、wowza_lan_ip：${vWowzaSignal.wowza_lan_ip}、
												</td>
											</tr>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
		</div>
		</section>
	</div>
	<%@ include file="/pages/common/bottom.jsp"%>
	<%@ include file="/pages/common/js.jsp"%>
	<script type="text/javascript">
 $(document).ready(function(){
	 $("input[name='tWowza']").on('ifChecked', function(event){
		 var id=this.value;
		 load_streams(id);
	 }); 
	  $("input[name='tWowza']").iCheck({
	    radioClass: 'iradio_square-green',
	    increaseArea: '20%'
	  });
});
    </script>
</body>
</html>

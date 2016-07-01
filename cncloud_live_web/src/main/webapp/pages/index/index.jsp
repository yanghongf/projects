<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><f:message key="common.title"/></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="/pages/common/left.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>直播</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i>首页</a></li>
					<li><a href="#">直播统计</a></li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-6">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">正在直播</h3>
							</div>
							<div class="box-body">
								<c:forEach var="item" items="${livingActivity}" varStatus="stat">
									<div class="info-box ${stat.index==0  ? 'bg-yellow':'bg-green'}">
										<span class="info-box-icon"> ${fn:substring(item.name, 0,2)}</span>
										<div class="info-box-content">
											<h3>
												<b>${item.name }</b>
											</h3>
											<div class="progress">
												<div class="progress-bar" style="width: 100%"></div>
											</div>
											<span class="progress-description"> ${fn:substring(item.start_time, 0,16)} --${fn:substring(item.end_time, 11,16)}</span>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="box box-primary">
							<div class="box-header ui-sortable-handle">
								<i class="ion ion-clipboard"></i>
								<h3 class="box-title">近期直播计划</h3>
								<div class="box-tools pull-right"></div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<ul class="todo-list ui-sortable">
									<c:forEach var="item" items="${recentActivity}"
										varStatus="stat">
										<li><i class="fa fa-ellipsis-v"></i> <i
											class="fa fa-ellipsis-v"></i> <span class="text">${item.name }</span>
											<small
											class="label ${stat.index==0 ||stat.index==1  ? 'label-info':'label-warning'}">
												<i class="fa fa-clock-o"></i>
												${fn:substring(item.start_time, 0,16)} <i
												class="fa fa-minus"></i> <i class="fa fa-minus"></i>${fn:substring(item.end_time, 11,16)}</small>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="box box-success">
							<div class="box-header with-border">
								<h3 class="box-title">直播统计</h3>
							</div>
							<div class="box-body">
								<div class="chart" id="container"></div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@ include file="/pages/common/bottom.jsp"%>
	</div>
	<%@ include file="/pages/common/js.jsp"%>
	<script type="text/javascript"
		src="${BASE}/static/assets/plugins/highcharts/js/jquery-1.5.2.min.js"></script>
	<script type="text/javascript"
		src="${BASE}/static/assets/plugins/highcharts/js/highcharts.js"></script>
	<script type="text/javascript"
		src="${BASE}/static/assets/plugins/highcharts/js/theme/grid.js"></script>
	<script type="text/javascript">
		var chart;
		$(document).ready(
				function() {
					chart = new Highcharts.Chart({
						chart : {
							renderTo : 'container', //放置图表的容器
							plotBackgroundColor : null,
							plotBorderWidth : null,
							defaultSeriesType : 'column' //图表类型line, spline, area, areaspline, column, bar, pie , scatter 
						},
						title : {
							text : '频道直播活动统计'
						},
						xAxis : {//X轴数据
							categories : [ ${recentMonths} ],
							labels : {
								rotation : -45, //字体倾斜
								align : 'right',
								style : {
									font : 'normal 13px 宋体'
								}
							}
						},
						yAxis : {//Y轴显示文字
							title : {
								text : '场次/次'
							}
						},
						tooltip : {
							enabled : true,
							formatter : function() {
								return '<b>' + this.x + '</b><br/>'
										+ this.series.name + ': '
										+ Highcharts.numberFormat(this.y, 1)
										+ "场";
							}
						},
						plotOptions : {
							column : {
								dataLabels : {
									enabled : true
								},
								enableMouseTracking : true
							//是否显示title
							}
						},
						series :  ${channelCountJson}
					});
				});
	</script>
</body>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理 | <f:message key="common.title" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>

</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>播放列表</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a>播放列表</a></li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box  box-success">
							<div class="box-header with-border">
								<!-- <h3 class="box-title"></h3> -->
								<div class="box-tools">
									<div class="input-group"></div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-bordered table-hover">
									<tr>
										<th>标题</th>
										<th>状态</th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>回放地址</th>
									</tr>
									<c:forEach var="item" items="${userPage.recordList}"
										varStatus="stat">
										<tr>
											<td>${item.title}</td>
											<td>${item.t_status_id}</td>
											<td>${item.start_time}</td>
											<td>${item.end_time}</td>
											<td><abbr title="initialism">${item.live_url}</abbr></td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div class="box-footer clearfix  ">
								<center>
									<tag:pager id="product_pager" pager="${userPage}" />
								</center>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@ include file="/pages/common/bottom.jsp"%>
		<%@ include file="/pages/common/js.jsp"%>
	</div>
</body>
</html>

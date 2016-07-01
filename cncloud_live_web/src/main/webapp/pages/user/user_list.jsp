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
				<h1>
					用户管理 <small class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i></small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a>用户管理</a></li>
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
								<table class="table table-bordered">
									<tr>
										<th>用户名</th>
										<th>用户权限</th>
										<th>创建日期</th>
										<th>举报次数</th>
										<th>播放列表</th>
									</tr>
									<c:forEach var="item" items="${userPage.recordList}"
										varStatus="stat">
										<tr>
											<td>${item.name}</td>
											<td>${item.is_admin}</td>
											<td>${item.create_time}</td>
											<td>
												 <c:if test="${item.reported_count<=5}"><span class="badge">${item.reported_count}</span></c:if>
												 <c:if test="${item.reported_count>5}"><span class="badge  bg-red">${item.reported_count}</span></c:if>
											</td>
											<td><a href="${BASE}/user/live/${item.id}/1">查看</a></td>
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

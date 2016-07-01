<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>点播录制管理 | <f:message key="common.title" /></title>
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
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					直播录制管理 <small class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i></small>
				</h1>

				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">活动管理</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box  box-warning">
							<div class="box-header with-border"></div>
							<div class="box-body">
								<table class="table table-bordered">
									<tr>
										<th width ="30%">名称</th>
										<th width ="10%">状态</th>
										<th width ="40%">描述</th>
										<th width ="10%">操作</th>
									</tr>
									<c:forEach var="item" items="${videos.recordList}"
										varStatus="stat">
										<tr>
											<td>${item.title}</td>
											<td><c:if test="${item.state==205}">
													<span class="badge bg-green">未开始</span>
												</c:if> <c:if test="${item.state==207}">
													<span class="badge bg-red">直播中</span>
												</c:if> <c:if test="${item.state==302}">
													<span class="badge">直播结束</span>
												</c:if> <c:if test="${item.state==600}">
													<span class="badge">回放同步中</span>
												</c:if></td>
												<td>${item.description}
											</td>
											<td>
												<button class="btn btn-minier btn-sm"
													onclick="t_live_xq(${item.id});">详细
												</button>
												<button class="btn  btn-danger btn-sm"
													onclick="t_live_underLine(${item.id});">下线
												</button>
											</td>
											
										</tr>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<center>
									<tag:pager id="product_pager" pager="${videos}" />
								</center>
							</div>
						</div>
					</div>
				</div>
		</div>
		<%@ include file="/pages/common/bottom.jsp"%>
	</div>
	<%@ include file="/pages/common/js.jsp"%>
</body>
</html>

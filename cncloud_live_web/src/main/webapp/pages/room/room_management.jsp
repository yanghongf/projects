<%@ page language="java"   pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>直播间管理 | <f:message key="common.title"/></title>
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
					直播间管理 <small><a href="../../room/pload"><i
							class="fa fa-plus"></i>新增直播间</a> </small>
								<small class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i></small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a>直播间管理</a></li>
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
									<div class="input-group">
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-bordered">
									<tr>
										<th>名称</th>
										<th>状态</th>
										<th>stream name</th>
										<th>修改</th>
										<th>删除</th>
									</tr>
									<c:forEach var="item" items="${tRooms.recordList}"
										varStatus="stat">
										<tr>
											<td> ${item.name}</td>
											<td> ${item.t_status_id}</td>
											<td>${item.stream_name}</td>
											<td>
										     	<button class="btn  btn-default btn-sm"
													onclick="t_room_edit(${item.id});">
													<i class="fa fa-edit"></i>
												</button>
											</td>
											<td>
												<button class="btn  btn-danger btn-sm"
													onclick="t_room_delete(${item.id});">
													<i class="fa fa-close"></i>
												</button>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix  ">
								<center>
									<tag:pager id="product_pager" pager="${tRooms}" />
								</center>
							</div>
						</div>
						<!-- /.box -->
					</div>
				</div>
		</div>
		<%@ include file="/pages/common/bottom.jsp"%>
	</div>
	<%@ include file="/pages/common/js.jsp"%>
</body>
</html>

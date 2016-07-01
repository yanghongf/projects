<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>直播管理 | <f:message key="common.title" /></title>
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
					直播管理<small class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i></small>
				</h1>

				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">直播管理</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box  box-warning">
							<div class="box-header with-border"> 
								<h3 class="box-title"></h3>
								<div class="box-tools">
									<div class="input-group">
										<form role="form" action="../../live/search/1" method="get">
											<div class="input-group">
												<input type="text" name="search_user_id" id="search_user_id"
													class="form-control input-sm" style="width: 150px;"
													placeholder="用户id" /> <input type="text"
													name="search_title" id="search_title"
													class="form-control input-sm" style="width: 150px;"
													placeholder="活动名称" />
												<button type="submit" class="btn btn-sm btn-default">
													<i class="fa fa-search"></i>搜索
												</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-bordered">
									<tr>
										<th>活动ID</th>
										<th>stream_name</th>
										<th>活动名称</th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>状态</th>
										<th>下线</th>
									</tr>
									<c:forEach var="item" items="${tLive.recordList}"
										varStatus="stat">
										<tr>
											<td>${item.id}</td>
											<td>${item.t_user_id}_${item.uuid}</td>
											<td>${item.title}</td>
											<td><fmt:formatDate value="${item.start_time}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td>${item.end_time}</td>
											<td><c:if test="${item.t_status_id==0}">
													<span class="badge bg-green">未开始</span>
												</c:if> <c:if test="${item.t_status_id==2}">
													<span class="badge bg-green">正常结束</span>
												</c:if> <c:if test="${item.t_status_id==1}">
													<span class="badge bg-yellow">直播中</span>
												</c:if> <c:if test="${item.t_status_id==-2}">
													<span class="badge bg-red">异常结束</span>
												</c:if></td>

											<td>
												<%-- <button type="button" class="btn btn-xs btn-success" id="down" onclick="t_live_close('${item.id}','${item.uuid}');">
												<i class="icon-upload"></i>下线
											</button> --%>

												<button class="btn  btn-danger btn-sm"
													onclick="t_live_close('${item.id}','${item.uuid}');">
													<i class="fa fa-close"></i>
												</button>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<center>
									<tag:pager id="product_pager" pager="${tLive}" />
								</center>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<%@ include file="/pages/common/bottom.jsp"%>
	</div>
	<%@ include file="/pages/common/js.jsp"%>
</body>
</html>

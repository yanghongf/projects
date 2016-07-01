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
</head>
<body class="skin-blue  fixed ">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					活动管理<small class="label label-warning" style="display: none"
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
							<div class="box-header with-border">
								<h3 class="box-title"></h3>
								<div class="box-tools">
									<div class="input-group">
										<form action="../search/1" method="post">
											<div class="input-group">
												<input type="text" name="search_text" id="search_text"
													class="form-control input-sm" style="width: 150px;"
													placeholder="Search" />
												<button id="t_activity_search_btn" type="submit"
													class="btn btn-sm btn-default">
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
										<th>活动名称</th>
										<th>发起人</th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>状态</th>
										<c:if test="${sessionScope.roleId=='1'}"><th>追加信号</th></c:if>
										<th>直播前</th>
										<!-- <th>直播中</th> -->
										<th>直播后</th>
										<th>修改</th>
										<th>删除</th>
									</tr>
									<c:forEach var="item" items="${tActivitys.recordList}"
										varStatus="stat">
										<tr>
											<td><a href="${BASE}/activity/preview/${item.id}">${item.name}</a>
											</td>
											<td>${item.user_name}</td>
											<td><fmt:formatDate value="${item.start_time}"
													pattern="yyyy-MM-dd HH:mm" /></td>
											<td>${fn:substringAfter(item.end_time, " ")}</td>
											<td>
												<c:if test="${item.state==0}">
													<span class="badge bg-green">未开始</span>
												</c:if> <c:if test="${item.state==1}">
													<span class="badge bg-red">直播中</span>
												</c:if> <c:if test="${item.state==2}">
													<span class="badge">直播结束</span>
												</c:if> <c:if test="${item.state==3}">
													<span class="badge">回放同步中</span>
												</c:if> <c:if test="${item.state==4}">
													<span class="badge">同步完成</span>
												</c:if>
											</td>
											<c:if test="${sessionScope.roleId=='1'}">
												<td>
													<button class="btn  btn-danger btn-sm"
														onclick="preload_wowza(${item.id});">
														<i class="fa fa-plus"></i>
													</button>
												</td>
											</c:if>
											<td>
												<!-- 直播前 -->
												<c:choose>
													<c:when test="${item.state==2}">
														<button class="btn  btn-success btn-sm"
															disabled="disabled">
															<i class="fa fa-cogs"></i>
														</button>
													</c:when>
													<c:otherwise>
														<button class="btn  btn-success btn-sm"
															onclick="to_step_before(${item.id});">
															<i class="fa fa-cogs"></i>
														</button>
													</c:otherwise>
												</c:choose></td>
											<!-- 	<td><c:choose>
													<c:when test="${item.state==2}">
														<button class="btn  btn-success btn-sm"
															disabled="disabled">
															<i class="fa fa-cogs"></i>
														</button>
													</c:when>
													<c:otherwise>
														<button class="btn  btn-success btn-sm"
															onclick="to_step_in(${item.id});">
															<i class="fa fa-cogs"></i>
														</button>
													</c:otherwise>
												</c:choose></td> -->
											<td>
												<!-- 直播后 -->
												<c:choose>
													<c:when test="${item.state==0}">
														<button class="btn  btn-success btn-sm" disabled="disabled">
														<i class="fa fa-cogs"></i>
														</button>
													</c:when>
													<c:otherwise>
														<button class="btn  btn-success btn-sm"
													onclick="to_step_after(${item.id});">
													<i class="fa fa-cogs"></i>
													</button>
													</c:otherwise>
												</c:choose>
											</td>
											<td>
												<button class="btn  btn-default btn-sm"
													onclick="t_activity_edit(${item.id});">
													<i class="fa fa-edit"></i>
												</button>
											</td>
											<td>
												<button class="btn  btn-danger btn-sm"
													onclick="t_activity_delete(${item.id});">
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
									<tag:pager id="product_pager" pager="${tActivitys}" />
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

<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>流媒体服务器 | <f:message key="common.title"/></title>
		<meta
			content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
			name='viewport'>
	<%@ include  file="/pages/common/css.jsp"%>
	</head>
	<body  class="skin-blue  fixed ">
		<div class="wrapper">
			<%@ include  file="/pages/common/top.jsp"%>
			<%@ include  file="/pages/common/left.jsp"%>
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
				<h1>
					wowza管理
					<small><a href="../../wowza/preload"><i
							class="fa fa-plus"></i>新增</a> </small>
				</h1>
				<ol class="breadcrumb">
					<li>
						<a><i class="fa fa-dashboard"></i> 首页</a>
					</li>
					<li>
						<a href="${BASE}/wowza/list/1">wowza管理</a>
					</li>
				</ol>
				</section>
				<!-- Main content -->
				<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-info">
							<div class="box-body">
								<table class="table table-bordered">
									<tr>
										<th>
											名称
										</th>
										<th>
											设备IP
										</th>
										<th>
											系统管理地址
										</th>
										<th>
											同步stream
										</th>
										<th>
											修改
										</th>
										<th>
											删除
										</th>
									</tr>
									<c:forEach var="item" items="${tWowzas.recordList}">
									<tr>
										<td>${item.name}</td>
										<td>${item.lan_ip}</td>
										<td><a href="${item.admin_url}"  target="_blank">${item.admin_url}</a></td>
										<td>
											<button class="btn  btn-success btn-sm" onclick="to_sys(${item.id});">
												<i class="fa fa-exchange"></i>
											</button>
										</td>
										<td>
											<button class="btn   btn-success btn-sm" onclick="t_wowza_edit(${item.id});">
												<i class="fa fa-edit"></i>
											</button>
										</td>
										<td>
											<button class="btn  btn-danger btn-sm" onclick="t_wowza_delete(${item.id});">
												<i class="fa fa-trash"></i>
											</button>
										</td>
									</tr>
									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<center>
                                    <tag:pager id="product_pager" pager="${tWowzas}" />
                                </center>
							</div>
						</div>
						<!-- /.box -->
					</div>
				</div>
			</div>
			<!-- /.content-wrapper -->
			<%@ include  file="/pages/common/bottom.jsp"%>
		</div>
		<!-- ./wrapper -->
		<%@ include  file="/pages/common/js.jsp"%>
	</body>
</html>

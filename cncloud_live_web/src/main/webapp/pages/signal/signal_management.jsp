<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>信源管理 |<f:message key="common.title"/> </title>
		<meta
			content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
			name='viewport'>
		<%@ include  file="/pages/common/css.jsp"%>
	</head>
	<body  class="skin-blue  fixed ">
		<div class="wrapper">
			<%@ include  file="/pages/common/top.jsp"%>
			<%@ include  file="/pages/common/left.jsp"%>
			<div class="content-wrapper">
				<section class="content-header">
				<h1>
					信源管理
					<small><a href="../../signal/preload"><i
							class="fa fa-plus"></i>新增信源</a> </small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a>信源管理</a></li>
				</ol>
				</section>
				<!-- Main content -->
				<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box box-danger">
							<div class="box-body">
								<table class="table table-bordered">
									<tr>
										<th>
											信源名称
										</th>
										<th>
											别名
										</th>
										<th>
											设备IP
										</th>
										<th>
											steam name
										</th>
										<th>
											当前状态
										</th>
										<th>
											cncodec后台
										</th>
										<th>
											修改
										</th>
										<th>
											删除
										</th>
									</tr>
									<c:forEach var="item" items="${tSignals.recordList}" varStatus="stat">
									<tr>
										<td>
											${item.name}
										</td>
										<td>
											${item.alias}
										</td>
										<td>
											${item.ip}
										</td>
										<td>
											${item.stream_name}
										</td>
										<td>
											 <c:if test="${item.state==0}"><span class="badge" style="cursor:pointer; " onclick="open_signal(${item.id},1);">关闭</span></c:if>
											 <c:if test="${item.state==1}"><span class="badge bg-red" style="cursor:pointer; "  onclick="open_signal(${item.id},0);">开启</span></c:if>
										</td>
										<td>
											 <a href="${item.admin_url}" target="_blank">${item.admin_url}</a>
										</td>
										<td>
											<button class="btn   btn-success btn-sm" onclick="t_signal_edit(${item.id});">
												<i class="fa fa-edit"></i>
											</button>
										</td>
										<td>
											<button class="btn  btn-danger btn-sm" onclick="t_signal_delete(${item.id});">
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
                                    <tag:pager id="product_pager" pager="${tSignals}" />
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

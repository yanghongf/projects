<%@ page language="java"   pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>频道管理 | <f:message key="common.title"/></title>
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
					频道管理 <small><a href="../../channel/preload"><i
							class="fa fa-plus"></i>新增频道</a> </small>
								<small class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i></small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a>频道管理</a></li>
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
										<!-- 
										<input type="text" name="table_search"
											class="form-control input-sm pull-right"
											style="width: 150px;" placeholder="Search" />
										<div class="input-group-btn">
											<button class="btn btn-sm btn-default">
												<i class="fa fa-search"></i>搜索
											</button>
										</div>
										 -->
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-bordered">
									<tr>
										<th>频道名称</th>
										<th>频道代码</th>
										<th>默认输入信号</th>
										<th>当前输入信号</th>
										<th>当前状态</th>
										<th>排序</th>
										<th>预览</th>
										<th>初始化</th>
										<th>修改</th>
										<th>删除</th>
									</tr>
									<c:forEach var="item" items="${tChannels.recordList}"
										varStatus="stat">
										<tr>
											<td> ${item.name_zh}</td>
											<td> ${item.name_en}</td>
											<td>${item.default_stream_name}</td>
											<td>${item.stream_name}</td>
											<td>
												 <c:if test="${item.state==0}"><span class="badge" style="cursor:pointer; " onclick="open_channel(${item.id},1);">禁用</span></c:if>
												 <c:if test="${item.state==1}"><span class="badge  bg-red" style="cursor:pointer; " onclick="open_channel(${item.id},0);">启用</span></c:if>
											</td>
											<td>
										     	<button class="btn  btn-default btn-sm"
													onclick="to_sort(${item.id},1);">
													<i class="fa fa-sort-asc"></i>
												</button>-${item.sort}-
												<button class="btn  btn-default btn-sm"
													onclick="to_sort(${item.id},-1);">
													<i class="fa fa-sort-desc"></i>
												</button>
												
											</td>
												<td>
										     	<button class="btn  btn-default btn-sm"
													onclick="t_channel_preview(${item.id});">
													<i class="fa fa-eye"></i>
												</button>
											</td>
											<td>
												<c:if test="${item.is_init==0}">
												<button class="btn  btn-success btn-sm" onclick="to_init(${item.id});">
													<i class="fa fa-recycle"></i>
												</button>
												</c:if>
												<c:if test="${item.is_init==1}">
												<button class="btn  btn-success btn-sm" disabled="disabled">
													<i class="fa fa-recycle"  title="已经完成初始化" ></i>
												</button>
												</c:if>
											</td>
											<td>
										     	<button class="btn  btn-default btn-sm"
													onclick="t_channel_edit(${item.id});">
													<i class="fa fa-edit"></i>
												</button>
											</td>
											<td>
												<button class="btn  btn-danger btn-sm"
													onclick="t_channel_delete(${item.id});">
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
									<tag:pager id="product_pager" pager="${tChannels}" />
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
	<script>
		function add_wowza() {
			$("#wowza_modal").modal({
				backdrop : 'static',
				keyboard : false
			});
		}

		(function($) {
			function init() {
				$('.easy-tree').EasyTree({
					addable : false,
					editable : false,
					deletable : false
				});
			}
			window.onload = init();
		})(jQuery)
	</script>
</body>
</html>

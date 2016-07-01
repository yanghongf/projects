<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有关键词 | <f:message key="common.title" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
<link href="${BASE}/static/assets/plugins/uploadfile/css/fileinput.css"
	media="all" rel="stylesheet" type="text/css" />
<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					所有关键词 <small><a href="../pages/word/word_add.jsp"><i
							class="fa fa-plus"></i>新增</a> </small><small class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">所有关键词</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-success">
							<div class="box-body">
								<div class="form-group">
									<table class="table table-bordered">
									<tr>
										<!-- <th>过滤</th>-->
									</tr>
									<c:forEach var="str" items="${str}"
										varStatus="stat">
										<tr>
											<td>${str}</td>
										</tr>
									</c:forEach>
								</table>
								</div>
							</div>
						</div>
					</div>
			</section>
		</div>
		<%@ include file="/pages/common/bottom.jsp"%>
	</div>
</body>
</html>

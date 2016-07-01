<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改直播间 | <f:message key="common.title" /></title>
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
					${empty tRoom.id ? '新建直播间':'编辑直播间'} <small>${tRoom.name}</small> <small
						class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">修改直播间</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<form id="create_form" enctype="multipart/form-data" method="post">
							<div class="box box-success">
								<div class="box-body">
									<div class="form-group">
										<label>直播间名称 </label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa  fa-font"></i>
											</span> <input type="text" class="form-control"
												value="${tRoom.name}" id="name" name="name">
										</div>
									</div>
									<div class="form-group">
										<label>海报 </label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-file-image-o"></i>
											</div>
											<input id="input-22" type="file" name="input-22"
														accept="image/*" class="file-loading">
										</div>
									</div>
								</div>
								<input id="id" type="hidden" name="id" value="${tRoom.id}">
								<button type="submit" id="t_channel_save_btn"
									class="btn  btn-primary">
									<i class="fa  fa-save "></i> 保存
								</button>
						</form>
					</div>
				</div>
			</section>
		</div>
		<%@ include file="/pages/common/bottom.jsp"%>
	</div>
	<%@ include file="/pages/common/js.jsp"%>
	<script src="${BASE}/static/assets/cnlive/js/Math.uuid.js"></script>
	<script src="${BASE}/static/assets/cnlive/js/ajax_rest.js"></script>
	<script
		src="${BASE}/static/assets/cnlive/js/validate/validate_channel.js"
		type="text/javascript"></script>
	<script src="${BASE}/static/assets/plugins/uploadfile/js/fileinput.js"
		type="text/javascript"></script>
	<script
		src="${BASE}/static/assets/plugins/uploadfile/js/fileinput_locale_zh.js"
		type="text/javascript"></script>

	<script type="text/javascript">
	$(document).on('ready', function() {
	    $("#input-22").fileinput({
	        previewFileType: "image",
	        browseClass: "btn btn-success",
	        browseLabel: "Pick Image",
	        browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i> ",
	        removeClass: "btn btn-danger",
	        removeLabel: "Delete",
	        removeIcon: "<i class=\"glyphicon glyphicon-trash\"></i> ",
	        uploadClass: "btn btn-info",
	        uploadLabel: "Upload",
	        uploadIcon: "<i class=\"glyphicon glyphicon-upload\"></i> "
	    });
	});
	
	$(function() {
		$('#create_form').ajaxForm({
			type : 'post',
			url : '../../room/editSave',
			enctype : 'multipart/form-data',
			beforeSubmit : function() {
					return true;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("错误");
			},
			success : function(result) {
				location.href = '../../room/list/1';
			}
		});
	});
	
	</script>
</body>
</html>

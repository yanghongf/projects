<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加敏感词 | <f:message key="common.title" /></title>
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
					  <small>添加敏感词</small> <small
						class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">添加敏感词</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<form id="create_form"  method="post">
							<div class="box box-success">
								<div class="box-body">
									<div class="form-group">
										<label>请输入关键词 </label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa  fa-font"></i>
											</span> <textarea id="words" name="words" class="form-control" rows="3" placeholder="北京,上海,天津"></textarea>
										</div>
									</div>
								</div>
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
	<script type="text/javascript">
	$(function() {
		$('#create_form').ajaxForm({
			type : 'post',
			url : '../../word/add',
			beforeSubmit : function() {
					return true;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("错误");
			},
			success : function(result) {
				alert("添加成功");
				 location.href = '../../word/list';
			}
		});
	});
	
	</script>
</body>
</html>

<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>流媒体服务器 | <f:message key="common.title"/></title>
		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'	name='viewport'>
		<style type="text/css">
            span.error{
                padding-left: 15px;
                color: red;
            }
        </style>
		<%@ include  file="/pages/common/css.jsp"%>
	</head>
	<body class="skin-blue  fixed  sidebar-mini">
		<div class="wrapper">
			<%@ include  file="/pages/common/top.jsp"%>
			<%@ include  file="/pages/common/left.jsp"%>
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
				<h1>
				    ${empty tWowza.id ? '新建':'修改'}流媒体服务器wowza<small class="label label-warning" style="display: none"
                        id="info_tab_span"><i class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li>
						<a href="#"><i class="fa fa-dashboard"></i> 首页</a>
					</li>
					<li>
						<a href="${BASE}/wowza/list/1">流媒体服务器管理</a>
					</li>
					<li class="active">
						${empty tWowza.id ? '新建':'修改'}流媒体服务器wowza
					</li>
				</ol>
				</section>
				<!-- Main content -->
				<section class="content">
				<form role="form" name="wowzaForm" method="post" id="twowzaForm">
				<div class="row">
					<!-- right column -->
					<div class="col-md-12">
						<!-- general form elements disabled -->
						<div class="box box-info">
							<div class="box-body">
								<div class="form-group">
									<label>
										名称
									</label>
									<div class="input-group">
										<span class="input-group-addon"><i class="fa  fa-font"></i>
										</span>
										<input type="text" id="name" name="name" value="${tWowza.name}" class="form-control" placeholder="名称">
										<input type="text" id="tWowzaId" value="${tWowza.id}" hidden="">
									</div>
								</div>
								
								<div class="form-group">
									<label>
										web账号
									</label>
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa  fa-credit-card"></i> </span>
										<input type="text" class="form-control" id="web_account" name="web_account" value="${tWowza.web_account}"
											placeholder="root/cnlive">
									</div>
								</div>
								<div class="form-group">
									<label>
										内网IP
									</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-laptop"></i>
										</div>
										<input type="text" class="form-control" id="lan_ip" name="lan_ip" value="${tWowza.lan_ip}"
											data-inputmask="'alias': 'ip'" data-mask="">
									</div>
								</div>
								<div class="form-group">
									<label>
										外网IP
									</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa  fa-database"></i>
										</div>
										<input type="text" class="form-control" id="wan_ip" name="wan_ip" value="${tWowza.wan_ip}"
											data-inputmask="'alias': 'ip'" data-mask="">
									</div>
								</div>
								<div class="form-group">
									<label>
										备份服务器ip
									</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa  fa-database"></i>
										</div>
										<input type="text" class="form-control" id="backup_server" name="backup_server" value="${tWowza.backup_server}"
											data-inputmask="'alias': 'ip'" data-mask="">
									</div>
								</div>
								<div class="form-group">
									<label>
										服务器管理地址
									</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa  fa-wifi"></i>
										</div>
										<input type="text" id="admin_url" name="admin_url" value="${tWowza.admin_url}" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label>
										录制文件存放目录
									</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa   fa-folder-open-o"></i>
										</div>
										<input type="text" id="video_path" name="video_path" value="${tWowza.video_path}" class="form-control">
									</div>
								</div>
                            
							</div>
						</div>
					</div>
				</div>
				</form>
					<div class="row">
						<div class="col-md-12">
							<div class="box-body">
								<div class="box-footer">
									<button type="button" class="btn btn-primary" id="t_wowza_save_btn" onclick="toWowzaSubmit();">
										<i class="fa  fa-save "></i> 提交
									</button>
								</div>
							</div>
						</div>
					</div>
					</section>
				</div>
				<jsp:include page="/pages/common/bottom.jsp"></jsp:include>
			</div>
			<%@ include  file="/pages/common/js.jsp"%>
			<script src="${BASE}/static/assets/cnlive/js/validate/validate_wowza.js" type="text/javascript"></script>
            <script src="${BASE}/static/assets/plugins/validate/messages_zh.js"></script>
	</body>
	<script type="text/javascript">
	function toWowzaSubmit(){
		$("#twowzaForm").submit();
	}
      $(function () {
        //Money Euro
        $("[data-mask]").inputmask();
      });
    </script>
</html>

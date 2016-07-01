<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新建信源 | <f:message key="common.title"/></title>
		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'	name='viewport'>
		<style type="text/css">
            span.error{
                padding-left: 15px;
                color: red;
            }
		</style>
		<%@ include  file="/pages/common/css.jsp"%>
	</head>
	<body class="skin-blue  fixed">
		<div class="wrapper">
			<%@ include  file="/pages/common/top.jsp"%>
			<%@ include  file="/pages/common/left.jsp"%>
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
				<h1>
					${empty tSignal.id ? '新建':'修改'}信源cncodec<small class="label label-warning" style="display: none"
                        id="info_tab_span"><i class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href=""><i class="fa fa-dashboard"></i>首页</a></li>
					<li><a href="../signal/list/1">信源管理</a></li>
					<li class="active">${empty tSignal.id ? '新建':'修改'}信源</li>
				</ol>
				</section>
				<!-- Main content -->
				<section class="content">
				<div class="row">
					<!-- right column -->
					<div class="col-md-12">
						<!-- general form elements disabled -->
						<div class="box box-danger">
							<div class="box-body">
								<form role="form" name="signalForm" method="post">
									<div class="form-group">
										<label>
											信源名称
										</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa  fa-font"></i>
											</span>
											<input type="text"  data-original-title="Tooltip on top" class="form-control" id="name" name="name" value="${tSignal.name}" placeholder="名称">
                                            <input type="text" id="tSignalId" value="${tSignal.id}" hidden="">
										</div>
									</div>
									<div class="form-group">
										<label>
											別名
										</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa  fa-font"></i>
											</span>
											<input type="text"  data-original-title="Tooltip on top" class="form-control" id="alias" name="alias" value="${tSignal.alias}" placeholder="別名">
										</div>
									</div>
									<div class="form-group">
										<label>
											设备IP
										</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-laptop"></i>
											</div>
											<input type="text" class="form-control" id="ip" name="ip" value="${tSignal.ip}"
												data-inputmask="'alias': 'ip'" data-mask="">
										</div>
									</div>
									<div class="form-group">
										<label>
											类型
										</label>
										<div class="box box-success">
											<div class="box-body">
												<div class="form-group">
													<label>
														<input type="radio" name="type" value="1" <c:if test="${tSignal.type eq '1'}">checked="checked"</c:if> class="flat-red" />
														HTTP
													</label>
												</div>
												<div class="form-group">
													<label>
														<input type="radio" name="type" value="2" <c:if test="${tSignal.type eq '2'}">checked="checked"</c:if> class="flat-red" />
														RTMP
													</label>
												</div>
											</div>
										</div>
									</div>
										<div class="form-group">
										<label>
											stream_name
										</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-th-large"></i>
											</div>
											<input type="text" name="stream_name" id="stream_name" value="${tSignal.stream_name}" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<label>
											cncodec管理地址
										</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-th-large"></i>
											</div>
											<input type="text" name="admin_url" id="admin_url" value="${tSignal.admin_url}" class="form-control">
										</div>
									</div>
									<div class="box-footer">
										<button type="submit" class="btn  btn-primary" id="t_signal_save_btn" 
										  onclick="" >
											<i class="fa  fa-save "></i> 提交
										</button>
										<!-- 
										<button type="button" class="btn  btn-primary"
											onclick="signal_preview();" disabled="disabled">
											<i class="fa  fa-eye"></i>预览
										</button>
										 -->
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				</section>
			</div>
			<%@ include  file="/pages/common/bottom.jsp"%>
		</div>
		<div class="modal" id="preview_modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">
							请选择
						</h4>
					</div>
					<div class="modal-body">
						<div class="box box-solid">
							<div class="box-body no-padding">
								<div class="box box-primary ">
									<div class="box-header with-border ">
										<h3 class="box-title">
											LiveShow
										</h3>
										<div class="box-tools pull-right">
											<button class="btn  btn-success btn-sm">
												<i class="fa  fa-refresh"></i>
											</button>
										</div>
									</div>
									<div class="box-body text-center">
										<img width="320" src="../../static/assets/dist/img/photo2.png"
											class='margin'>

										<div class="mailbox-attachment-info">
											<a class="mailbox-attachment-name"> Video: h264 (High),
												yuv420p, 1280x720 </a>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left"
							data-dismiss="modal">
							Close
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<%@ include  file="/pages/common/js.jsp"%>
		<script src="${BASE}/static/assets/cnlive/js/validate/validate_signal.js" type="text/javascript"></script>
		
	</body>
	<script type="text/javascript">
      $(function () {
        //Money Euro
        $("[data-mask]").inputmask();
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
          checkboxClass: 'icheckbox_flat-green',
          radioClass: 'iradio_flat-green'
        });
      });
    </script>

	<script type="text/javascript">
	function signal_preview(){
 	$("#preview_modal").modal({backdrop: 'static', keyboard: false});
}
      $(function () {
        //Money Euro
        $("[data-mask]").inputmask();
      });
    </script>
</html>

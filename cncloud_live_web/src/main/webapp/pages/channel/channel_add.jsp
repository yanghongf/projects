<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新建频道 | <f:message key="common.title" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
<link href="${BASE}/static/assets/plugins/uploadfile/css/fileinput.css"
	media="all" rel="stylesheet" type="text/css" />
<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
<style type="text/css">
input.error {
	border: 1px solid red;
}

span.error {
	padding-left: 15px;
	color: red;
}
</style>
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					${empty tChannel.id ? '新建频道':'编辑频道'} <small>${tChannel.name_zh}</small>
					<small class="label label-warning" style="display: none"
						id="info_tab_span"><i class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="../channel/list/1">频道管理</a></li>
					<li class="active">新增频道</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<form role="form" name="channelForm" method="post"
							id="channelForm">
							<div class="box box-success">
								<div class="box-body">
									<div class="form-group">
										<label>频道名称 </label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa  fa-font"></i>
											</span> <input type="text" class="form-control"
												value="${tChannel.name_zh}" id="name_zh" name="name_zh"
												placeholder="如：快新闻">
										</div>
									</div>
									<div class="form-group">
										<label> 频道代码 </label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa  fa-code"></i>
											</span> <input type="text" class="form-control" id="name_en"
												value="${tChannel.name_en}" name="name_en"
												placeholder="如：news">
										</div>
									</div>
									<div class="form-group">
										<label> 滚播IP </label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-laptop"></i>
											</div>
											<input type="text" class="form-control" id="transcoder_ip"
												value="${tChannel.transcoder_ip}" name="transcoder_ip"
												data-inputmask="'alias': 'ip'" data-mask="">
										</div>
									</div>
									<div class="form-group">
										<label> Transcoder ID </label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-list-ol"></i>
											</div>
											<input type="text" class="form-control" id="transcoder_id"
												value="${tChannel.transcoder_id}" name="transcoder_id"
												placeholder="如：15">
										</div>
									</div>
									<div class="form-group">
										<label>播出地址 </label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-link"></i>
											</div>
											<input type="text" class="form-control" id="play_url"
												value="${tChannel.play_url}" name="play_url"
												placeholder="如：http://ips.cnlive.com/IPS/getPcEpg.action?cid=chaotiyu">
										</div>
									</div>
									<div class="form-group">
										<label> 类型 </label>
										<div class="box box-success">
											<div class="box-body">
												<div class="form-group">
													<label> <input type="radio" name="type" value="1"
														<c:if test="${tChannel.type eq '1'}">checked="checked"</c:if>
														class="flat-red" /> 自主频道
													</label>
												</div>
												<div class="form-group">
													<label> <input type="radio" name="type" value="2"
														<c:if test="${tChannel.type eq '2'}">checked="checked"</c:if>
														class="flat-red" /> 运营商频道
													</label>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label> 聊天室 ID </label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-wechat "></i>
											</div>
											<input type="text" class="form-control" id="chatroom_id"
												value="${tChannel.chatroom_id}" name="chatroom_id"
												placeholder="如：35521">
										</div>
									</div>
									<div class="form-group">
										<label>海报 </label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa  fa-file-image-o"></i>
											</div>
											<form method="post" enctype="multipart/form-data">
												<input id="poster" name="poster" class="file" type="file"
													multiple data-min-file-count="1">
											</form>
										</div>
									</div>

									<div class="form-group">
										<label>默认输入信号 </label>
										<div class="input-group">
											<div class="col-md-12"></div>
										</div>
										<div class="box-footer">
											<input type="hidden" name="image_name" id="image_name"
												value="" /> <input type="hidden" name="channel_id"
												id="channel_id" value="${tChannel.id }" />
											<!-- <button type="button" id="t_channel_save_btn"
										onclick="t_channel_add_or_update(${empty tChannel.id ? '-1':tChannel.id});"
										class="btn  btn-primary">
										<i class="fa  fa-save "></i> 保存
									</button> -->
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="box box-primary">
											<div class="box-header">
												<h3 class="box-title">选择Wowza服务器</h3>
											</div>
											<div class="box-body">
												<c:forEach var="item" items="${tWowzas}" varStatus="stat">
													<div class="form-group">
														<label> <input type="radio" name="tWowza"
															value="${item.id}" class="flat-green" />${item.name}_${item.lan_ip}
														</label>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="box box-warning">
											<div class="box-header">
												<h3 class="box-title">选择Wowza Stream</h3>
											</div>
											<div class="box-body" id="wowza_stream_body"></div>
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
 $(document).ready(function(){
	 $("input[name='tWowza']").on('ifChecked', function(event){
		 var id=this.value;
		 load_streams(id);
	 }); 
	  $("input").iCheck({
	    radioClass: 'iradio_square-green',
	    increaseArea: '20%'
	  });
});
		$("#poster").fileinput({
			uploadUrl : BASE + '/channel/poster',
			allowedFileExtensions : [ 'jpg' ],
			overwriteInitial : false,
			uploadAsync : true,
			showUpload : true,
			maxFileSize : 1000,
			showCaption : false,
			uploadExtraData : {
				image_name : Math.uuid() + ".jpg"
			},
			showUploadedThumbs : false,
			maxFilesNum : 10,
			//allowedFileTypes: ['image', 'video', 'flash'],
			slugCallback : function(filename) {
				return filename.replace('(', '_').replace(']', '_');
			}

		});

		$('#poster').on('filebatchuploadcomplete',
				function(event, files, extra) {
					// console.log(event);
					console.log(extra.image_name);
					$('#image_name').val(extra.image_name);
					//console.log(Math.uuid());
				});

		$(document).ready(function() {
			$("#test-upload").fileinput({
				'showPreview' : false,
				'allowedFileExtensions' : [ 'jpg', 'png', 'gif' ],
				'elErrorContainer' : '#errorBlock'
			});
		});
	</script>
</body>
</html>

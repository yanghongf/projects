<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>同步wowza Stream | <f:message key="common.title"/></title>
		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'	name='viewport'>
		<style type="text/css">
            span.error{
                padding-left: 15px;
                color: red;
            }
        </style>
		<%@ include  file="/pages/common/css.jsp"%>
	</head>
	<!--   sidebar-mini -->
	<body  class="skin-blue  fixed">
		<div class="wrapper">
			<%@ include  file="/pages/common/top.jsp"%>
			<%@ include  file="/pages/common/left.jsp"%>
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
				<h1>
				    同步wowza Stream and application<small class="label label-warning" style="display: none"
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
						同步
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
										<input type="text" disabled="disabled" id="name" name="name" value="${tWowza.name}" class="form-control" placeholder="名称">
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
										<input type="text"  disabled="disabled" class="form-control" id="lan_ip" name="lan_ip" value="${tWowza.lan_ip}"
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
										<input type="text" disabled="disabled" id="admin_url" name="admin_url" value="${tWowza.admin_url}" class="form-control">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</form>
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">
									同步Stream
								</h3>
								<div class="box-tools pull-right">
									<div class="has-feedback">
										<!--  <button title="手动新增" class="btn  btn-info  btn-sm" id="t_signal_maping_btn">
											<i class="fa fa-plus"></i>
										</button>   -->
										<button title="同步wowza服务器发布点" onclick="sys_wowzaserver(this);" class="btn  btn-info  btn-sm" id="sys_wowzasercer_btn">
											<i class="fa fa-exchange"></i>
										</button>
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">

								<table class="table table-bordered" id="sys_wowza_table">
									<tbody>
										<tr>
											<th style="width: 5%">
												# 
											</th>
											<th style="width: 30%">
												输入信源
											</th>
											<th style="width: 10%">
											   StreamName
											</th>
											<th style="width: 10%">
												Application
											</th>
											<th style="width: 10%">
												类型
											</th>
											<th style="width: 30%">
												访问URL 
											</th>
											<th style="width: 5%">
												删除
											</th>
										</tr>
										<c:if test="${!empty tWowza.id}">
										<c:forEach var="item" items="${vWSRList}" varStatus="stat">
										<tr id="tr_${item.id}">
											<td>
												${stat.index+1}.
											</td>
											<td>
												<div class="input-group">
													<input type="text" class="form-control" disabled="disabled" value="${item.signal_ip}-->${item.signal_name}" id="ipname_id_${item.id}">
													<input type="text" name="t_signal_id" hidden="" value="${item.t_signal_id}" id="t_signal_id_${item.id}" >
													<span class="input-group-btn">
														<button class="btn btn-info btn-flat" onclick="add_singal('${item.id}');" type="button">
															选择
														</button>
                                                    </span>
												</div>
											</td>
											<td>
												<input type="text" class="form-control" name="stream_name" value="${item.stream_name}" id="stream_name_1">
											</td>
											<td>
												<input type="text" class="form-control" name="application_name" value="${item.application_name}" id="application_name_1">
											</td>
											<td>
												<select class="form-control"   name="type" id="type">
														<option    ${item.type==1 ? 'selected="selected"':''}   value="1">直播</option>
														<option    ${item.type==2 ? 'selected="selected"':''}   value="2">滚播</option>
												</select>
											 </td>
											<td>
												<input type="text" class="form-control" name="publish_url" value="${item.publish_url}" id="publish_url_1">
											</td>
											<td>
												<button class="btn btn-danger btn-flat" onclick="del_tr_width('${item.id}');" type="button">
													<i class="fa fa-trash"></i>
												</button>
												<input type="hidden" name="hidden_id" id= "hidden_id" value="${item.id}"/>
											</td>
										</tr> 
										</c:forEach>
                                        </c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="box-body">
								<div class="box-footer">
									<button type="button" class="btn btn-primary" id="t_wowza_save_btn" onclick="add_application(${tWowza.id});">
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
			<!-- 输入信源选择 -->
<div class="modal" id="singal_modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">
					请选择可用信号源
				</h4>
			</div>
			<div class="modal-body">
				<div class="box box-solid">
					<div class="easy-tree">
						<ul>
							<li>可用信源
								<ul>
								<c:forEach var="item" items="${tSignals}">
									<li>${item.ip}
										<ul id="tt">
										    <c:forEach items="${fn:split(item.group_name,',')}"   var="group_name">
											<li class="ulext" id='${fn:substringBefore(group_name, "#")}' ip="${item.ip}" name='${fn:substringAfter(group_name, "#")}'>
												${fn:substringAfter(group_name, "#")}
											</li>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left"	data-dismiss="modal">
					Close
				</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="t_signal_selected_btn(${empty tWowza.id ? '-1':tWowza.id});">
					选择
				</button>
			</div>
		</div>
	</div>
 </div>
			<%@ include  file="/pages/common/js.jsp"%>
			<script src="${BASE}/static/assets/cnlive/js/validate/validate_wowza.js" type="text/javascript"></script>
            <script src="${BASE}/static/assets/plugins/validate/messages_zh.js"></script>
	</body>
	<script>
    (function ($) {
        function init() {
            $('.easy-tree').EasyTree({
                addable: false,
                editable: false,
                deletable: false
            });
        }
        window.onload = init();
    })(jQuery)
</script>

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

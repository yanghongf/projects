<%@ page language="java" pageEncoding="UTF-8"
	deferredSyntaxAllowedAsLiteral="true"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>监审管理 | <f:message key="common.title" /></title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
<style type="text/css">
body {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 20px;
	color: #000000;
}

#main_box {
	/*正文区大容器*/
	width: 770px;
	margin-right: auto;
	margin-left: auto;
}

.row {
	/*定义每行*/
	width: 100%;
	clear: both;
}

.left3 {
	/*用在五列布局上*/
	border: 1px solid #00ff00;
	width: 25%;
	height: 150px;
	float: left;
}

.divleft {
	width: 24%;
	height: 600px;
	float: left;
}

.divright {
	width: 74%;
	height: 600px;
	float: right;
}

.leftTop {
	width: 100%;
	height: 340px;
	float: right;
}

.leftBootom {
	width: 100%;
	height: 250px;
	float: right;
}
</style>
</head>
<body class="skin-blue  fixed ">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					监审管理<small><a href="../../live/preload"><i
							class="fa fa-plus"></i>直播监审</a> </small> <small class="label label-warning"
						style="display: none" id="info_tab_span"><i
						class="fa fa-bell-o"></i></small>
				</h1>

				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">监审管理</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box  box-warning">
							<div class="box-header with-border">
								<h3 class="box-title"></h3>
								<div class="box-tools">
									<div class="input-group">
										<div class="box-footer clearfix">
											<center>
												<tag:pager3 id="product_pager" pager="${tLive}" />
											</center>
										</div>
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">

								<div class="divleft">
									<div class="leftTop" id="leftTopPlay"></div>
									<div class="leftBootom">

										<table class="table table-bordered">

											<h4>直播活动详情：</h4>

											<tr>
												<th width="30%">活动名称</th>
												<th id="live_name"></th>

											</tr>
											<tr>
												<th width="30%">开始时间</th>
												<th id="start_time"></th>
											</tr>
											<tr>
												<th width="30%">结束时间</th>
												<th id="end_time"></th>
											</tr>
											<tr>
												<th width="30%">活动简述</th>
												<th id="live_desper"></th>
											</tr>
											<tr>
												<th width="30%">live_url</th>
												<th id="live_url"></th>
											</tr>
											<tr>
												<th width="30%">活动简述</th>
												<th id=""></th>
											</tr>

										</table>
									</div>
								</div>
								<div class="divright">
									<!--五列开始-->
									<div class="row">
										<c:forEach var="item" items="${tLive.recordList}"
											varStatus="stat">
											<!-- <div style="border: 1px solid #00ff00; width: 33%; height: 200px; background: #888; float: left;"> -->
											<div class="warp"
												style="border: 1px solid #00ff00; width: 33%; height: 203px; float: left;"
												id="divShow_${item.id}"
												onclick="getParam('${item.id}','${item.title}','${item.live_url}','${item.start_time}','${item.end_time}')">
												<!-- <div class="warp" style="height: 24px; background: #;"> -->
												<button type="button" class="close" data-dismiss="modal"
													id="colseLive" onclick="coseLive(event,'${item.id}','${item.t_user_id}')">
													<span aria-hidden="true">&times;</span><span
														class="sr-only">Close</span>
												</button>
												<h5 class="modal-title" id="myModalLabel">正在直播：${item.title}</h5>
												<!-- </div> -->
												<div id="a1_${item.id}" class="a1_class"
													style="height: 150px">
													<input type="hidden" value='${item.id}' name="liveid"
														id="liveid"> 
														<input type="hidden"value='${item.title}' name="title" id="title"> 
														<input type="hidden" value='${item.live_url}' name="live_url"
														id="live_url_${item.id}">
													   <input type="hidden"value='${item.start_time}' name="start_time"
														id="start_time"> 
													   <input type="hidden"value='${item.end_time}' name="end_time" id="end_time">
													    <input type="hidden"value='${item.t_user_id}' name="t_user_id" id="t_user_${item.id}">
													<%-- <h4 class="blue smaller">
														<i class="icon-picture orange"></i>视频源 : ${item.title}
													</h4> --%>
												</div>
												<div class="" style="height: 30px;">
													<input type="button" value="置顶" id="makeTop"
														onclick="makeTop(event,'${item.id}',this)"> <input
														type="button" value="关闭活动" id="closeLive"
														onclick="coseLive(event,'${item.id}','${item.t_user_id}')">
												</div>
											</div>
											<!-- </div> -->
										</c:forEach>
									</div>
								</div>
							</div>

						</div>
						<!-- /.box-body -->
					</div>
				</div>
			</section>
		</div>
	</div>
	<%@ include file="/pages/common/bottom.jsp"%>
	<%@ include file="/pages/common/js.jsp"%>
	<script type="text/javascript" src="../../pages/check/js/ckplayer.js" charset="utf-8"></script>
	<script type="text/javascript" src="../../pages/check/js/offlights.js" charset="utf-8"></script>
	<script type="text/javascript">
		var flashvars = {
			p : 1,
			e : 1,
			hl : '',
			ht : '20',
		};
		var video = [ '' ];
		var support = [ 'all' ];
		CKobject.embedHTML5('leftTopPlay', 'ckplayer_leftTopPlay', 250, 290,
				video, flashvars, support);

		$(".a1_class #liveid").each(function() {
							var id = $(this).val();
							 var live_url = $('#live_url_' + id).val();
							 var t_user_id = $('#t_user_'+id).val();
							 
							  var flashvars = {
								p : 1,
								e : 1,
								hl : live_url,
								ht : '20'
							};
							var video = [live_url ];
							var support = [ 'all' ];
							CKobject.embedHTML5('a1_' + id, 'ckplayer_' + id,250, 153, video, flashvars, support);   
							 
							 //m3u8 文件播放
								/*   var flashvars={
									        f:'http://localhost:8080/cnlive_live_web/static/assets/ckplayer/m3u8.swf',
									        a:live_url,
									        s:4,
									        c:0,
									        p:1
									    };
									    var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'};
									    var video=[live_url];
									    CKobject.embed('http://localhost:8080/cnlive_live_web/static/assets/ckplayer/ckplayer.swf', 'a1_' + id, 'ckplayer_' + id, 250, 153,false,flashvars,video,params);   */
							// rtmp 直播流播放。
							/*  var flashvars = {
								// f:'rtmp://localhost/live/livestreame',
								f :'http://cnlive.uplive.ks-cdn.com/live/'+t_user_id+'_'+id,
								c : 0
							};
							var video = [ 'http://cnlive.hlslive.ks-cdn.com/live/'+t_user_id+'_'+id+'/index.m3u8'];
							CKobject.embed('../../static/assets/ckplayer/ckplayer.swf','a1_' + id, 'ckplayer_' + id, 250,
											153, false, flashvars, video);  */

						});

		function getParam(id, name, live_url, start_time, end_time) {

			$("#live_name").html(name);
			$("#start_time").html(start_time);
			$("#end_time").html(end_time);
			$("#live_url").html(live_url);
			var flashvars = {
				p : 1,
				e : 1,
				hl : 'http://movie.ks.js.cn/flv/other/1_0.mp4',
			};
			var video = [ live_url ];
			var support = [ 'all' ];
			CKobject.embedHTML5('leftTopPlay', 'ckplayer_leftTopPlay', 250,
					290, video, flashvars, support);
		}
		function coseLive(e, id,user_id) {
			e.cancelBubble = true;
			$.ajax({
				url : '../../check/close/' + id,
				type : 'post',
				datatype : "json",
				async : true,
				data:{"user_id":user_id},
				error : function() {
					alert('关闭时发生错误!');
				},
				success : function(data) {
					location.href = '../../check/list/1';
					alert("关闭成功");
				}
			});
		}
		/**
		 置顶 。。。
		 */
		
			function makeTop(event, id, obj) {
				event.cancelBubble = true;
				$(obj.parentElement.parentElement).insertBefore($('.warp').first())
				alert(obj.parentElement.parentElement);
			};
	</script>
</body>
</html>

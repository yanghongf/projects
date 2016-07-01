function toSubmit(){
	$("#activityForm").submit();
}
	
//修改直播开始结束时间
function update_activity_time(){
	var start_time= $('#start_time').val();
	var end_time= $('#end_time').val();
	var id=$('#activity_id').val();
	$.ajax({
		url : BASE+'/activity/update/time/',
		type : 'post',
		async : true,
		error : function() {
			alert("请求错误");
		    console.log(XMLHttpRequest.status);    
		    console.log(XMLHttpRequest.readyState);    
		},
		data : {
			id :id,
			start_time :start_time,
			end_time:end_time
		},
		success : function(data) {
			$("#update_time_btn").html("保存成功");
			$("#update_time_btn").attr("disabled", true);
		}
	});
}

function preload_wowza(id){
	window.location.href=BASE+ "/activity/preloadWowza/"+id;
} 
function t_live_edit(id){
	window.location.href=BASE+ "/live/edit/"+id;
}


function to_step_before(id){
	window.location.href=BASE+ "/activity/stepBefore/"+id;
}

function to_step_in(id){
	window.location.href=BASE+ "/activity/stepIn/"+id;
}

function to_step_after(id){
	window.location.href=BASE+ "/activity/stepAfter/"+id;
}
  
function show_time_div(){
	var state  =$("#eidt_time_li").css('display');
	if (state=='none') {
		$("#eidt_time_li").show();
	}else{
		$("#eidt_time_li").hide();
	}
}

function to_stop(id){
	$("#reset_btn").html("后台处理中...");
	$("#reset_btn").attr("disabled", "disabled");
	$.ajax({
		url : BASE+'/activity/stop/'+id,
		type : 'get',
		datatype : "json",
		async : true,
		error : function() {
			alert("请求错误");
		    console.log(XMLHttpRequest.status);  
			$("#reset_btn").html("复位中...");
		},
		success : function(data) {
			if (data.success) {
				$("#reset_btn").html("信号已复位");
				$("#publish_div").html("");
				var btn='<button type="button" id="publishreview_btn" style="width: 250px; height: 100px" class="btn btn-block btn-lg  btn-warning" onclick="do_publishreview(${tActivity.id});" class="btn  btn-warning">发布直播回放</button>';
				$("#publish_div").html("");
			}else{
				$("#reset_btn").html("信号复位失败，或者活动已经结束");
			}
		}
	});
	
}
//获取tree 所选值
//function select_wowza_signal(){
//	var tree_node=$(".easy-tree").find('li.li_selected');
//	var id=tree_node.attr('id');
//	$("#t_wowza_stream_id_tip").val(tree_node.text());
//	$("#t_wowza_stream_id").val(id);
//	$("#wowza_modal").modal('hide');
//}

function copy_name(){
	var name=$('#name').val();
	$('#epg_name').val(name);
}


function save_confirm(){
	var start_time= $('#start_time').val();
	console.log(start_time);
	var t_wowza_stream_id_tip=$("#t_wowza_stream_id_tip").val();
	var channel_names=""; 
	$("input[name='channel_id']:checked").each(function(){ 
		channel_names+=$(this).attr("title")+"  、"; 
	}) 
	var html="<p  class=\"lead\"><h4>预计将在： <code>"+start_time+"</code></h4></p><p  class=\"lead\"><h4>将信号： <code>"+t_wowza_stream_id_tip+"</code></h4></p><p  class=\"lead\"><h4>切换至： <code>"+channel_names+"</code></h4></p>";
	$("#tip_message").html(html);
	$("#save_confirm_modal").modal({backdrop: 'static', keyboard: false});
}




function  t_activity_save_or_update(id){
	$("#t_activity_save_btn").html("后台处理中...");
	//$("#t_activity_save_btn").attr("disabled", "disabled");
	var is_free;
	$("input[name='is_free']:checked").each(function() {
		is_free = this.value;
	});
	var is_playback;
	$("input[name='is_playback']:checked").each(function() {
		is_playback = this.value;
	});
	
	var logo;
	$("input[name='logo']:checked").each(function() {
		logo = this.value;
	});
	
	var channel_ids=""; 
	$("input[name='channel_id']:checked").each(function(){ 
		channel_ids+=$(this).val()+","; 
	}) 
	var is_main= $('#is_main').val();
	var t_activity = new Object();
	t_activity.name = $('#name').val();
	t_activity.epg_name = $('#epg_name').val();
	t_activity.description = $('#description').val();
	t_activity.place = $('#place').val();
	t_activity.start_time = $('#start_time').val();
	t_activity.end_time = $('#end_time').val();
	t_activity.contact_user =$('#contact_user').val();
	t_activity.v_count = $('#v_count').val();
	t_activity.is_free=is_free;
	t_activity.t_default_video_id=$("#t_default_video_id  option:selected").val();
	t_activity.is_playback=is_playback;
	t_activity.logo=logo;
	t_activity.uuid= $('#uuid').val();
	t_activity.notify_user=$('#notify_user').val();
	t_activity.chatroom_id=$('#chatroom_id').val();
	var json = JSON.stringify(t_activity);
	$.ajax({
		url : BASE+'/activity/add',
		type : 'post',
		datatype : "json",
		data : {
			id :id,
			json :json,
			is_main:is_main,
			channel_ids:channel_ids
		},
		async : true,
		error : function() {
			alert("请求错误");
		    console.log(XMLHttpRequest.status);    
		    console.log(XMLHttpRequest.readyState);    
		},
		success : function(data) {
			$("#t_activity_save_btn").html("保存成功");
			$("#t_activity_save_btn").attr("disabled", true);
			showTip(data.success);
			location.href = BASE+'/activity/list/1';
		}
	});
	$("#save_confirm_modal").modal('hide');
}

//为活动添加wowza信号
function append_wowza(id){
	$("#append_wowza_btn").html("保存中...");
	$("#append_wowza_btn").attr("disabled", "disabled");
	var t_wowza_stream_id;
	$("input[name='t_wowza_stream_id']:checked").each(function() {
		t_wowza_stream_id = this.value;
	});
	if(t_wowza_stream_id==''){
		alert("请选择对应是 wowza  stream");
	}else{
			$.ajax({
			url : BASE+'/activity/appendStream',
			type : 'post',
			data : {
				id :id,
				t_wowza_stream_id:t_wowza_stream_id
			},
			async : true,
			error : function() {
				alert("请求错误");
			    console.log(XMLHttpRequest.status);    
			    console.log(XMLHttpRequest.readyState);    
			},
			success : function(data) {
				var fla=data.success;
				if(fla){
					$("#append_wowza_btn").html("保存成功");
					$("#append_wowza_btn").attr("disabled", true);
					showTip(fla);
					location.href = BASE+'/activity/list/1';
				}else{
					showTipWidthMsg(true,"请先为该活动指定输出频道,去修改直播活动！");
				}
			}
		});
	}
}

function  t_activity_search(oid){
	$("#t_activity_search_btn").html("后台处理中...");
	$("#t_activity_search_btn").attr("disabled", "disabled");
	var search_text= $('#search_text').val();
	$.ajax({
		url : BASE+'/activity/search/1',
		type : 'post',
		data : {
			name :search_text
		},
		async : true,
		error : function() {
			alert('搜索发生错误!');
			$("#t_activity_search_btn").attr("disabled", false);
		},
		success : function(data) {
			 
		}
	});
}

//新建活动时选择输出频道
function select_channel(id){
	var div =$("#div_channel_box_"+id);
	var div_inner_checkbox=div.find("input[type='checkbox']")
	var is_checked=div_inner_checkbox.is(':checked');
	if (is_checked) {
		//取消选择
		 div.removeClass().addClass("small-box bg-aqua");
		 div_inner_checkbox.iCheck('uncheck');
	}else{
		div_inner_checkbox.iCheck('check'); 
		div.removeClass().addClass("small-box bg-red");
	}
}
function isMainClick(obj){
	alert(obj);
	
}

function t_activity_delete(id) {
	if (window.confirm('您确定要删除吗！')) {
		$.ajax({
			url :  BASE+'/activity/delete/' + id,
			type : 'get',
			async : true,
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert("请求错误");
			    console.log(XMLHttpRequest.status);    
			    console.log(XMLHttpRequest.readyState);    
			    console.log(textStatus);
			},
			success : function(data) {
				if (data.success) {
					location.href = BASE+'/activity/list/1';
				} else {
					showTipWidthMsg(true,"删除失败！    "+data.data);
				}
			}
		});
	}
}


function val_file(id){
	$.ajax({
		url : BASE+'/wowza/valfile/'+id,
		type : 'get',
		datatype : "json",
		async : true,
		error : function() {
			alert("请求错误");
		    console.log(XMLHttpRequest.status);    
		    console.log(XMLHttpRequest.readyState);    
		    console.log(textStatus);
		},
		success : function(data) {
			//showTip(data.success);
		}
	});
}

function replace_epg(id){
	$("#btn_replace_epg").html("后台处理中...");
	$.ajax({
		url : BASE+'/activity/epg/'+id,
		type : 'get',
		datatype : "json",
		async : true,
		error : function() {
			alert("请求错误");
		    console.log(XMLHttpRequest.status);    
		    console.log(XMLHttpRequest.readyState);    
		},
		success : function(data) {
			 showTip(data.success);
			 $("#btn_replace_epg").attr("disabled", "disabled");
			 $("#btn_replace_epg").html("替换完成");
		}
	});
}
//详情页信号切换
function  do_switch(id){
	$("#switch_btn").html("后台处理中...");
	$("#switch_btn").attr("disabled", "disabled");
	$.ajax({
		url : BASE+'/activity/doswitch/'+id,
		type : 'get',
		async : true,
		error : function() {
			alert('发生错误!');
			$("#switch_btn").html("切换失败!");
			$("#switch_btn").attr("disabled", false);
		},
		success : function(data) {
			$("#switch_btn").html("切换成功");
			$("#switch_btn").attr("disabled", false);
		}
	});
}

//详情页-撤销 $("input[name='keleyicom']")
function  do_stop(id){
	$("#reset_btn").html("后台处理中...");
	$("#reset_btn").attr("disabled", "disabled");
	$.ajax({
		url : BASE+'/activity/stop/'+id,
		type : 'get',
		async : true,
		error : function() {
			alert('发生错误!');
			$("#reset_btn").html("信号复位失败!");
			$("#reset_btn").attr("disabled", false);
		},
		success : function(data) {
			$("#reset_btn").html("信号复位成功");
			$("#reset_btn").attr("disabled", false);
		}
	});
}
//详情页-紧急垫片
function  do_ad(id){
	$("button[name='ad_btn']").html("后台处理中...");
	$("button[name='ad_btn']").attr("disabled", "disabled");
	$.ajax({
		url : BASE+'/activity/advideo/'+id,
		type : 'get',
		async : true,
		error : function() {
			alert('发生错误!');
			$("button[name='ad_btn']").html("垫片失败!");
			$("button[name='ad_btn']").attr("disabled", false);
		},
		success : function(data) {
			if(data.success){
				$("button[name='ad_btn']").html("垫片成功");
				//$("#switch_btn").attr("disabled", false);
			}else{
				$("button[name='ad_btn']").html("垫片失败，请检查是否活动已经结束，或者当前活动是否分配直播频道");
				$("#switch_btn").attr("disabled", false);
			}
		}
	});
}


//获取录制视频文件信息
function  do_checkfile(id){
	$("#checkfile_btn").html("后台处理中...");
	$("#checkfile_btn").attr("disabled", "disabled");
	$.ajax({
		url : BASE+'/activity/checkfile/'+id,
		type : 'get',
		async : true,
		error : function() {
			alert('发生错误!');
			$("#checkfile_btn").html("验证文件失败!");
			$("#checkfile_btn").attr("disabled", false);
		},
		success : function(data) {
				var jsonData=data.data;
				if (jsonData==null) {
					$("#mp4_info").append("没有文件产生");
				}else{
					 $.each(jsonData, function(idx, name){
						  var html='<hr><a class="btn btn-primary btn-xs">文件名：'+name+'</a>';
						  $("#mp4_info").append(html);
					}); 
					 
					$("#checkfile_btn").html("验证完成");
					$("#checkfile_btn").attr("disabled", false);
				}
		}
	});
}


// 发布直播回放
function  do_publishreview(id){
	$("#publishreview_btn").html("后台处理中...");
	$("#publishreview_btn").attr("disabled", "disabled");
	$.ajax({
		url : BASE+'/activity/publishReview/'+id,
		type : 'get',
		async : true,
		error : function() {
			alert('发生错误!');
			$("#publishreview_btn").html("信号复位失败!");
			$("#publishreview_btn").attr("disabled", false);
		},
		success : function(data) {
			$("#publishreview_btn").html("发布成功");
			//$("#publishreview_btn").attr("disabled", false);
		}
	});
}
//断流处理
function play_close(id,live_url,uuid){
	$.ajax({
		url : '../../check/cut/' + id,
		type : 'post',
		datatype : "json",
		async : true,
		data:{"live_url":live_url,
			"uuid":uuid,
		},
		error : function() {
			alert('关闭时发生错误!');
		},
		success : function(data) {
			//$("#play_url_"+id).val("");
			location.href = '../../check/list/1';
			alert("关闭成功");
		}
	});
}
function changePlay(id,live_url,userId,title,time){
	$("input").attr("id","play_url_"+id);
	$("input").attr("name","play_url_"+id);
	$("#hidId").val(live_url);
	$("li[id='userId']").html("<a><i class='fa fa-file-text-o'></i>用户ID: "+userId+"</a>");
	$("li[id='title']").html("<a><i class='fa fa-file-text-o'></i>TITLE: "+title+"</a>");
	$("li[id='startTime']").html("<a><i class='fa fa-file-text-o'></i>开播时间: "+time+"</a>");
	jwplayer("playId").setup({ 
		    file: live_url, 
		    height: 260, 
		    //image: "/assets/myVideo.jpg", 
		    autostart:true,
		    rtmp: { 
		        bufferlength: 0.1 
		    }, 
		    width: 370 
		});

}
function t_live_xq(id){
	window.location.href="../../video/view/"+id;
}
function t_live_underLine(id){
	$.ajax({
		url:'../../video/unline',
		type:'post',
		datatype : 'json',
		data:{"id":id},
		error : function() {
			alert('下线时发生错误!');
		},
		success : function(data) {
			location.href = '../../video/check/1';
			alert("下线成功");
		}
	});
}
function checkUser(){
	 var search_user_id = $("#search_user_id").val();
	 var search_title = $("#search_title").val();
	 $.ajax({
			url:'../../live/search/1',
			type:'post',
			datatype : 'json',
			error : function() {
				alert('下线时发生错误!');
			},
			success : function(data) {
				//location.href = "../../live/search/1?search_user_id="+search_user_id+"&search_title="+search_title;
				//alert(location.href);
			}
		});
}

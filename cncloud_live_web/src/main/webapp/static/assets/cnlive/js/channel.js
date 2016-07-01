//频道
function t_channel_preview(id){
	window.location.href =  BASE+"/channel/preview/"+id;;
}

function to_sort(id,s){
	$.ajax({
		url :  BASE+'/channel/sort',
		type : 'post',
		async : true,
		data : {
			id :id,
			sort:s
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert("请求错误");
		    console.log(XMLHttpRequest.status);    
		    console.log(XMLHttpRequest.readyState);    
		},
		success : function(data) {
				location.href = BASE+'/channel/list/1';
		}
	});
}

function to_init(id){
	if (window.confirm('您确定要初始化当前频道吗！')) {
		$.ajax({
			url :  BASE+'/channel/init/' + id,
			type : 'get',
			async : true,
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert("请求错误");
			    console.log(XMLHttpRequest.status);    
			    console.log(XMLHttpRequest.readyState);    
			    console.log(textStatus);
			},
			success : function(data) {
				alert(data.success);
				if (data.success) {
					location.href = BASE+'/channel/list/1';
				} else {
					showTipWidthMsg(true,"初始化失败,请检查是否已经推  src 的流！");
				}
			}
		});
	}
}
function  t_channel_edit(id){
	window.location.href = BASE+ "/channel/edit/"+id;
}


function t_channel_delete(id) {
	if (window.confirm('您确定要删除吗！')) {
		$.ajax({
			url :  BASE+'/channel/delete/' + id,
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
					location.href = BASE+'/channel/list/1';
				} else {
					showTipWidthMsg(true,"禁止删除！");
				}
			}
		});
	}
}

 
function t_channel_add_or_update(id) {
	//构造t_channel对象
	var type;
	$("input[name='type']:checked").each(function() {
		type = this.value;
	});
	var t_wowza_stream_id;
	$("input[name='t_wowza_stream_id']:checked").each(function() {
		t_wowza_stream_id = this.value;
	});
	if (t_wowza_stream_id==undefined) {
		alert("请选择对应是 stream");
	}else{
		$("#t_channel_save_btn").html("后台处理中...");
		$("#t_channel_save_btn").attr("disabled", "disabled");
		var t_channel = new Object();
		t_channel.name_zh = $('#name_zh').val();
		t_channel.name_en = $('#name_en').val();
		t_channel.transcoder_ip= $('#transcoder_ip').val();
		t_channel.default_t_wowza_stream_id=t_wowza_stream_id;
		t_channel.transcoder_id= $('#transcoder_id').val();
		t_channel.play_url= $('#play_url').val();
		t_channel.chatroom_id= $('#chatroom_id').val();
		if (t_channel.chatroom_id=="") {
			t_channel.chatroom_id="0";
		}
		t_channel.type =type;
		t_channel.poster=$('#image_name').val();
		var json = JSON.stringify(t_channel);
		$.ajax({
			url : BASE+'/channel/add',
			type : 'post',
			datatype : "json",
			data : {
				id :id,
				json :json
			},
			async : true,
			error :function(XMLHttpRequest, textStatus, errorThrown) {
				alert("请求错误");
			    console.log(XMLHttpRequest.status);    
			    console.log(XMLHttpRequest.readyState);    
			    console.log(textStatus);
			},
			success : function(data) {
				$("#t_channel_save_btn").html("保存成功");
				showTip(data.success);
				location.href = BASE+'/channel/list/1';
			}
		});
	}
}


function open_channel(id,state){
	$.ajax({
		url : BASE+'/channel/close',
		type : 'post',
		async : true,
		data : {
			id :id,
			state:state
		},
		error : function() {
			alert('error');
		},
		success : function(data) {
			if (data.success) {
				location.href = BASE+'/channel/list/1';
			} else {
				showTips("操作失败！");
			}
		}
	});
}




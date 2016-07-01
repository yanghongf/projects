//信源
//function activity_preview(){
//	window.location.href='../../pages/activity/activity_preview.jsp';
//}


function t_signal_add_or_update(id) {
	$("#t_signal_save_btn").html("后台处理中...");
	$("#t_signal_save_btn").attr("disabled", "disabled");
	//构造t_signal对象
	var type;
	$("input[name='type']:checked").each(function() {
		type = this.value;
	});
	
	var t_signal = new Object();
	t_signal.name = $('#name').val();
	t_signal.ip = $('#ip').val();
	t_signal.alias= $('#alias').val();
	t_signal.type =type;
	t_signal.admin_url = $('#admin_url').val();
	t_signal.stream_name = $('#stream_name').val();
	var json = JSON.stringify(t_signal);
	$.ajax({
		url : BASE+'/signal/add',
		type : 'post',
		datatype : "json",
		data : {
			id :id,
			json :json
		},
		async : true,
		error : function(data) {
			alert('保存时发生错误!');
			$("#t_signal_save_btn").attr("disabled", false);
		},
		success : function(data) {
			$("#t_signal_save_btn").html("保存完成");
			$("#t_signal_save_btn").attr("disabled", false);
			showTip(data.success);
			location.href = BASE+'/signal/list/1';
		}
	});
}

function  t_signal_edit(id){
	window.location.href = BASE+"/signal/edit/"+id;
}

function t_signal_delete(id) {
	if (window.confirm('您确定要删除吗！')) {
		$.ajax({
			url : BASE+'/signal/delete/' + id,
			type : 'post',
			async : true,
			error : function() {
				alert('error');
			},
			success : function(data) {
				if (data.success) {
					alert('删除成功!');
					location.href = BASE+'/signal/list/1';
				} else {
					showTips("不允许删除！");
				}
			}
		});
	}
}

function open_signal(id,state){
	$.ajax({
		url : BASE+'/signal/close',
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
				location.href = BASE+'/signal/list/1';
			} else {
				showTips("操作失败！");
			}
		}
	});
}



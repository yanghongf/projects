function load_users() {
	var obj_val=$('#user_id_tip').val();
	if (obj_val.replace(/\s/g,"")=="") {
		alert("请输入人名进行获取检索！");
	}else{
		$.ajax({
			url : BASE+'/rest/ajax/users/'+obj_val,
			type : 'get',
			async : true,
			error : function() {
				alert('获取用户错误！');
			},
			success : function(data) {
				var tr_td_html="";
				$.each(data, function(i, obj) {
					var  name=obj.name;
					var  id=obj.id;
					tr_td_html=tr_td_html+"<tr><td><span style=\"cursor:pointer\" class=\"label label-sm label-success\" onclick=\"set_text_value('user_id','"+name+"',"+id+");\">"+name+"</span></td></tr>"
				})
				$("#tip_table").html(tr_td_html);
				$("#tip_modal").modal();
			}
		});
	}
}

function load_streams(id) {
	$.ajax({
		url : BASE+'/rest/ajax/ref/wowzaStreams/'+id,
		type : 'get',
		async : true,
		error : function() {
			alert('获取错误！');
		},
		success : function(data) {
			var tr_td_html="";
			if(data.length==0){
				tr_td_html="没有任何stream信息，请先同步";
			}else{
				$.each(data, function(i, obj) {
					var  name=obj.stream_name;
					var  id=obj.id;
					tr_td_html=tr_td_html+"<div class='form-group'><label> <input type='radio' name='t_wowza_stream_id' value='"+id+"' class='flat-red'/> "+name+"</label></div>"
				})
			}
			$("#wowza_stream_body").html(tr_td_html);
			//设置样式
			 $("input[name='t_wowza_stream_id']").iCheck({
				    radioClass: 'iradio_square-red',
				    increaseArea: '20%'
			 });
		}
	});
}


function set_text_value(input_name,name,id){
	$("#"+input_name).val(id);
	$("#"+input_name+"_tip").val(name);
	$("#tip_table").html("");
	$("#tip_modal").modal("hide");
}

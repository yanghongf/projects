//信源
//function activity_preview(){
//	window.location.href='../../pages/activity/activity_preview.jsp';
//}

function t_wowza_add_or_update(id) {
	$("#t_wowza_save_btn").html("后台处理中...");
	$("#t_wowza_save_btn").attr("disabled", "disabled");
	//构造t_wowza对象
	var t_wowza = new Object();
	t_wowza.name = $('#name').val();
	t_wowza.lan_ip = $('#lan_ip').val();
	t_wowza.wan_ip = $('#wan_ip').val();
	t_wowza.admin_url = $('#admin_url').val();
	t_wowza.video_path = $('#video_path').val();
	t_wowza.web_account = $('#web_account').val();
	t_wowza.backup_server = $('#backup_server').val();
	var json = JSON.stringify(t_wowza);
	$.ajax({
		url : BASE+'/wowza/add',
		type : 'post',
		datatype : "json",
		data : {
			id :id,
			json :json
		},
		async : true,
		error : function(data) {
			alert('保存时发生错误!');
			$("#t_wowza_save_btn").attr("disabled", false);
		},
		success : function(data) {
			$("#t_wowza_save_btn").html("保存完成");
			$("#t_wowza_save_btn").attr("disabled", false);
			showTip(data.success);
			location.href = BASE+'/wowza/list/1';
		}
	});
}

function  t_wowza_edit(id){
	window.location.href = BASE+"/wowza/edit/"+id;
}

function t_wowza_delete(id) {
	if (window.confirm('您确定要删除吗！')) {
		$.ajax({
			url : BASE+'/wowza/delete/' + id,
			type : 'post',
			async : true,
			error : function() {
				alert('error');
			},
			success : function(data) {
				if (data.success) {
					alert('删除成功!');
					location.href = BASE+'/wowza/list/1';
				} else {
					showTips("该 wowza 的  stream 已经被使用，禁止删除。");
				}
			}
		});
	}
}
 
var temp_id;
function add_singal(id){
	temp_id = id;
	$("#singal_modal").modal({backdrop: 'static', keyboard: false});
}

$("#t_signal_maping_btn").click(function(){
	  var len = $('table tr').length;
	  var sele='<td><select class="form-control"   name="type" id="type"><option value="1">直播</option><option value="2"  >滚播</option></select></td>';
      $("table").append('<tr id="tr_'+len+'"><td>'+len+'.</td><td><div class="input-group"><input type="text" name="ipname" class="form-control" disabled="disabled" id="ipname_id_'+len+'">'+
        '<input type="text" name="t_signal_id" hidden="" value="" id="t_signal_id_'+len+'"><span class="input-group-btn">'+
		'<button class="btn btn-info btn-flat" onclick="add_singal(this.value);" type="button" value="'+len+'">选择</button> </span></div></td><td><input type="text" name="stream_name" id="stream_name_'+len+'" class="form-control">'+
		'</td><td><input type="text" class="form-control" name="application_name"  id="application_name_'+len+'"></td> '+sele+' <td><input type="text" name="publish_url" id="publish_url_'+len+'" value="" class="form-control"></td><td><button class="btn btn-danger btn-flat" onclick="del_tr('+len+');" type="button"><i class="fa fa-trash"></i></button></td></tr>');
});

function del_tr(index){
	var tr = document.getElementById('tr_'+index);
	tr.parentNode.removeChild(tr);
}


function del_tr_width(id){
	var tr = document.getElementById('tr_'+id);
	tr.parentNode.removeChild(tr);
	$.ajax({
		url : BASE+'/wowza/delStreams/'+id,
		type : 'get',
		async : true,
		error : function(data) {
			alert('发生错误!');
			$("#t_wowza_save_btn").attr("disabled", false);
		},
		success : function(data) {
			if(data.success){
				showTip(data.success);
			}else{
				showTipWidthMsg(true,"该  stream 已经被使用，禁止删除。如果想解除引用请初始化频道，或者为频道分配其他stream 后在进行删除。");
			}
		}
	});
	
}

function to_sys(id){
	window.location.href =  BASE+"/wowza/tosys/"+id;;
}


//同步wowza服务器
function sys_wowzaserver(obj){
	var  ip=$('#lan_ip').val();
	if (ip=="") {
		alert("请输入内网ip");
	}else{
		$("#sys_wowzasercer_btn").html("正在同步..");
		$("#sys_wowzasercer_btn").attr("disabled", true);
		$.ajax({
			url : BASE+'/wowza/sys/',
			type : 'post',
			async : true,
			data : {
				ip :ip
			},
			error : function() {
				alert('error');
			},
			success : function(data) {
				var jsonData=data.data;
				var flag=data.success;
				if (!flag) {
					$("#sys_wowzasercer_btn").html("同步失败，请检查ip是否正确,或者wowza是否有正确stream");
					$("#sys_wowzasercer_btn").attr("disabled", true);
				}else{
					var type_1='<td><select class="form-control"  disabled="disabled"  name="type" id="type"><option  value="1">直播</option><option value="2">滚播</option></select></td>';
					var type_2='<td><select class="form-control"  disabled="disabled" name="type" id="type"><option value="1">直播</option><option value="2"  >滚播</option></select></td>';
					
					//application_name\stream_name
					$.each(jsonData, function(idx, app){
						  var len = $('table tr').length;
						  var tSignal=app.tSignal;
						  var appName=app.appName;
						  var url=app.url;
						  var streamName=app.streamName;
						  var sele;
						  var button;
						  if(app.tSignal==null){
							  //滚播
							  sele=type_2;
							  button="";
						  }else{
							  //直播
							  button='<button class="btn btn-info btn-flat" onclick="add_singal(this.value);" type="button" value="'+len+'">选择</button> ';
							  sele=type_1;
						  }
						  //判断是否已经存在
						  var haveSt=false;
							$("input[name=stream_name]").each(function(i){ 
							      var st= $(this).val();  
							      if(st==streamName){
							    	  haveSt=true;
							      }
							});
							  //判断是否已经存在
							var havaAp=false;
							$("input[name=application_name]").each(function(i){ 
								var ap= $(this).val(); 
								if(ap==appName){
									havaAp=true;
							      }
							});
						  if(haveSt&&havaAp){
							   
						  }else{
							  alert(tSignal.id+"--"+streamName)
							  var tr_td_html='<tr id="tr_'+len+'"><td>'+len+'.</td><td><div class="input-group"><input type="text" value="'+tSignal.ip+'-->'+tSignal.name+'" name="ipname" class="form-control" disabled="disabled" id="ipname_id_'+len+'">'+
						        '<input type="text" name="t_signal_id" hidden="" value="'+tSignal.id+'" id="t_signal_id_'+len+'"><span class="input-group-btn">'+
								''+button+'</span></div></td><td><input type="text"  value="'+streamName+'" name="stream_name" id="stream_name_'+len+'" class="form-control">'+
								'</td><td><input type="text" class="form-control" name="application_name" value="'+appName+'" id="application_name_'+len+'"></td> '+sele+' <td><input type="text" name="publish_url" id="publish_url_'+len+'" value="'+url+'" class="form-control"></td> <td><button class="btn btn-danger btn-flat" onclick="del_tr('+len+');" type="button"><i class="fa fa-trash"></i></button><input type="hidden" name="hidden_id" id="hidden_id" value="'+tSignal.id+'"/></td> </tr>';
							    $("table").append(tr_td_html);
						  }
					}); 
					 $("#sys_wowzasercer_btn").html("同步完成");
					 $("#sys_wowzasercer_btn").attr("disabled", false);
				}
			}
		});
	}
}
 
//保存同步信息
function add_application(id) {
	$("#t_wowza_save_btn").html("后台处理中...");
	$("#t_wowza_save_btn").attr("disabled", "disabled");
	//信源映射
	var array = new Array();
	$("#sys_wowza_table").find("tr").each(function(){
        var tr = $(this);
        var tr_id=tr.attr("id");
        if (tr_id!= undefined) {
			//头部无需处理
			var t_wowza_signal = new Object();
			t_wowza_signal.t_signal_id = tr.find('input[name="t_signal_id"]').val();
			t_wowza_signal.type =  tr.find('select[name="type"]').val();
			t_wowza_signal.stream_name = tr.find('input[name="stream_name"]').val();
			t_wowza_signal.application_name =  tr.find('input[name="application_name"]').val();
			t_wowza_signal.publish_url =  tr.find('input[name="publish_url"]').val();
			var h_id=tr.find('input[name="hidden_id"]').val();
			if (tr_id!= undefined) {
				 t_wowza_signal.hidden_id =h_id;
			 }
			array.push(t_wowza_signal);
		}
    });
	var json =JSON.stringify(array);
	$.ajax({
		url : BASE+'/wowza/addStreams',
		type : 'post',
		datatype : "json",
		data : {
			id :id,
			json :json
		},
		async : true,
		error : function(data) {
			alert('保存时发生错误!');
			$("#t_wowza_save_btn").attr("disabled", false);
		},
		success : function(data) {
			$("#t_wowza_save_btn").html("保存完成");
			$("#t_wowza_save_btn").attr("disabled", false);
			showTip(data.success);
			location.href = BASE+'/wowza/list/1';
		}
	});
}


//预览发布点
function signal_preview(url){
	$("#play_url").val(url);
	$("#preview_modal").modal({backdrop: 'static', keyboard: false});
}


 function t_signal_selected_btn(obj){
	 var tree_node=$(".easy-tree").find('li.li_selected');
	 var ip = tree_node.attr('ip');
	 var name = tree_node.attr('name');
	 var id = tree_node.attr('id');
	 if(obj == '-1'){
		 var ipname_id = "ipname_id_"+temp_id;
		 var signal_id = "t_signal_id_"+temp_id;
		 $("#"+ipname_id).val(ip+"-->"+name);
		 //$("#"+signal_id).val(id);
		 console.log("t_signal_id_"+temp_id+"-->"+id);
		 document.getElementById("t_signal_id_"+temp_id).value=id;
	 }else{
		 var ipname_id = "ipname_id_"+temp_id;
		 var signal_id = "t_signal_id_"+temp_id;
		 $("#"+ipname_id).val(ip+"-->"+name);
		 //$("#"+signal_id).val(id);
		 document.getElementById("t_signal_id_"+temp_id).value=id;
	 }
	 temp_id = null;
	 
 }



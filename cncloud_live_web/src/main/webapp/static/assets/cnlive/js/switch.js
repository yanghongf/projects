//确认切换的提示model
function confirm_switch(){
	$("#switch_confirm_modal").modal({backdrop: 'static', keyboard: false});
	var html="<p class=\"lead\"><h4>确定将信号 <code>{0}</code>切换至频道 :  <code>{1}</code>吗？</h4></p>";
	var wowza_id=$("#selected_wowza_id").val();
	var wowza_name=$("#div_wowza_box_"+wowza_id).text();
 	var channel_names="";
	var channel_ids=$("#selected_channel_id").val();
	var select_array=channel_ids.split(",");
	for (var i = 0; i < select_array.length; i++) {
		var channel_id=select_array[i];
		var name=$("#selected_channel_"+channel_id).text();
		if(channel_names==""){
			channel_names=name;
		}else{
			channel_names=channel_names+"、"+name;
		}
	}
	$("#tip_table").html($.format(html,wowza_name,channel_names));
	$("#switch_confirm_modal").modal();
}
//执行切换动作
function do_switch(){
	var channel_ids=$("#selected_channel_id").val();
	var wowza_id=$("#selected_wowza_id").val();
	$.ajax({
		url : BASE+'/doswitch',
		type : 'post',
		async : true,
		error : function() {
			alert("请求错误");
		    console.log(XMLHttpRequest.status);    
		    console.log(XMLHttpRequest.readyState);    
		},
		data : {
			channel_ids :channel_ids,
			wowza_id :wowza_id
		},
		success : function(data) {
			$("#switch_confirm_modal").modal('hide');
			showTip(data.success);
		}
	});
}

var loading_div="<div id=\"loading_div\" class=\"loading\">加载中...</div>";
var selected_wowza_templet="<div    class=\"col-md-12\"><div class=\"info-box bg-red\" style=\"padding: 10px;\"><span class=\"info-box-number\">{0}</span><div class=\"progress\"><div class=\"progress-bar\" style=\"width:100%\"></div></div><span class=\"progress-description\">{1}</span></div></div>";
//var selected_channel_templet="<div id=\"selected_channel_{0}\"    class=\"col-md-4\"><div class=\"info-box bg-red\"><span class=\"info-box-icon\"> <span class=\"info-box-number\">{1}</span></span></div></div>";
var selected_channel_templet='<div  id=\"selected_channel_{0}\"  class=\"col-md-4\"><div class="box-tools pull-right"> <button class="btn btn-box-tool"  onclick="remove_selected_channnel({0});" data-widget="remove"><i class="fa fa-times"></i></button></div><div class=\"info-box bg-{2}\" style=\"padding: 10px;\"><span class=\"info-box-number\">{0}</span><div class=\"progress\"><div class=\"progress-bar\" style=\"width:100%\"></div></div><span class=\"progress-description\">{1}</span></div></div>';
var is_lock=true;
function un_lock_ref(obj){
	if(is_lock){
		//解除锁定
		is_lock=false;
		$(obj).removeClass().addClass("btn btn-success");
		$(obj).html("<i class=\"fa fa-unlock\"></i>编辑模式");
		$("#btn_switch").removeAttr("disabled");
	}else{
		//锁定
		is_lock=true;
		$(obj).removeClass().addClass("btn btn-danger");
		$(obj).html("<i class=\"fa fa-lock\"></i>只读模式");
		$("#btn_switch").attr({"disabled":"disabled"});
	}
}

//移除已经选择频道
function remove_selected_channnel(id){
	if(is_lock){
		//移除时是锁定状态时，两边全部清空
		  empty_wowza();
		  empty_channel();
	}else{
		 $("#selected_channel_"+id).empty();
		 var div =$("#div_channel_box_"+id);
		 var default_class_name=div.attr("title");
		 set_channnel_div_style(id,default_class_name,'uncheck');
		 $("#selected_channel_"+id).remove();
		 var def_val=$("#selected_channel_id").val();
		 var select_array=def_val.split(",");
		 var temp="";
		 for (var i = 0; i < select_array.length; i++) {
			var select_id=select_array[i];
			if(select_id!=""){
				if(select_id!=id){
					if(temp==""){
						temp=select_id;
					}else{
						temp=temp+","+select_id;
					}
				}
			}
		}
		//##########隐藏域赋值
		$("#selected_channel_id").val(temp);
	}
}

//选择wowza信号
function select_wowza(point_name,wowza_ip) {
	//移除模板中的残余对象
	empty_wowza();
	//当前行字体加粗 
	var name=point_name.split("#")[0];
	var wowza_id=point_name.split("#")[1];
	var html=$.format(selected_wowza_templet,wowza_ip,name);
	//赋值并且重新加入新对象
	set_selected_wowza_id(wowza_id,html);
	if(is_lock){
		//##锁定状态，根据信号对象去后台读取所关联的频道
		//#########频道模板中加入"加载中" div
		$("#selected_channel").append(loading_div);
		$.ajax({
			url : BASE+'/rest/ajax/ref/channels/'+wowza_id,
			type : 'get',
			async : true,
			error : function() {
				alert("请求错误");
			    console.log(XMLHttpRequest.status);    
			    console.log(XMLHttpRequest.readyState);    
			},
			success : function(data) {
				empty_channel();
				if (data=="") {
					null_channel("<code>当前信号源未设置关联频道!</code>");
				}else{
					var  html="";
					var channel_ids="";
					$.each(data, function(i, obj) {
						var  name=obj.name_zh;
						var  id=obj.id;
						var  state=obj.state;
						var  is_live=3;
						if (state==2) {
							is_live=state;
						}
						//关联选中频道，并赋值
						ref_select_channel(name,id);
					})
				}
			}
		});
	} 
}

//改变所选样式
function set_channnel_div_style(div_id,class_name,checkbox_state){
	var div =$("#div_channel_box_"+div_id);
	var div_inner_checkbox=div.find("input[type='checkbox']")
	div.removeClass().addClass("small-box   "+class_name);
	div_inner_checkbox.iCheck(checkbox_state);
}

function ref_select_channel(name,id){
	var html=$.format(selected_channel_templet,id,name,'red');
	set_selected_channel_id(id,html);
}	

//选择频道
function select_channel(name,id) {
	var div =$("#div_channel_box_"+id);
	var default_class_name=div.attr("title");
	var checkbox=div.find("input[type='checkbox']")
	var is_checked=checkbox.is(':checked');
	if(is_lock){
		empty_channel();
		empty_wowza();
		$("#selected_wowza").append(loading_div);
		$.ajax({
			url : BASE+'/rest/ajax/ref/wowza/'+id,
			type : 'get',
			async : true,
			error : function() {
				alert("请求错误");
			    console.log(XMLHttpRequest.status);    
			    console.log(XMLHttpRequest.readyState);    
			},
			success : function(data) {
				if (data=="") {
					set_selected_wowza_id("","<code>当前频道未设置关联信号!</code>");
				}else{
					empty_wowza();
					var name=data.stream_name;
					var wowza_id=data.id;
					var ip=data.ip;
					var html=$.format(selected_wowza_templet,ip,name);
					//赋值并且重新加入新对象
					set_selected_wowza_id(wowza_id,html);
				}
			}
		});
		
		var html=$.format(selected_channel_templet,id,name,'red');
		set_selected_channel_id(id,html);
	}else{
		//未锁定状态，进行追加
		if (is_checked) {
			 //取消选择
			 set_channnel_div_style(id,default_class_name,'uncheck');
			 $("#selected_channel_"+id).remove();
			 var def_val=$("#selected_channel_id").val();
			 var select_array=def_val.split(",");
			 var temp="";
			 for (var i = 0; i < select_array.length; i++) {
				var select_id=select_array[i];
				if(select_id!=""){
					if(select_id!=id){
						if(temp==""){
							temp=select_id;
						}else{
							temp=temp+","+select_id;
						}
					}
				}
			}
			//##########隐藏域赋值
			$("#selected_channel_id").val(temp);
		}else{
			//选中
			var html=$.format(selected_channel_templet,id,name,'gray');
			set_selected_channel_id(id,html);
		}
	}
}

//频道隐藏域赋值
function set_selected_channel_id(id,html){
	//改变所选样式
	set_channnel_div_style(id,"bg-orange",'check');
	var ids=$("#selected_channel_id").val();
	if(ids==""){
		ids=id;
	}else{
		ids=ids+","+id;
	}
	$("#selected_channel").append(html);
	$("#selected_channel_id").val(ids);
}
//wowza 信号隐藏域赋值
function set_selected_wowza_id(id,html){
   $("#selected_wowza_id").val(id);
   if(html==""){
	   $("#selected_wowza").empty();
   }else{
	   $("#div_wowza_box_"+id).css("font-weight", "bold");
	   $("#selected_wowza").append(html);
   }
}
function empty_wowza(){
	set_selected_wowza_id("","");
	$("#wowza_div").find('li').css('font-weight', 'normal');
}

function empty_channel(){
	$("div[id^='div_channel_box_']").each(function() {
		var this_div_id=this.id.split("_")[3];
		var class_name=this.title;
		set_channnel_div_style(this_div_id,class_name,"uncheck");
	});
	$("#selected_channel").empty();
	$("#selected_channel_id").val("");
}

function null_channel(html){
	$("#selected_channel").empty();
	$("#selected_channel").append(html);
	$("#selected_channel_id").val("");
}

  
$('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
	checkboxClass : 'icheckbox_flat-green',
	radioClass : 'iradio_flat-green'
});

$(document).ready(function() {
	$('input').iCheck({
		checkboxClass : 'icheckbox_square-green',
		radioClass : 'iradio_square-green',
		increaseArea : '20%' // optional
	});
});
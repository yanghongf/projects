// validate exit
$.validator.setDefaults({
	submitHandler: function() {
//		alert("表单信源验证通过!");
		var wId = $("#tWowzaId").val();
		if(wId!=""){
			t_wowza_add_or_update(wId);
		}else{
			t_wowza_add_or_update(-1);
		}
//		debug: true
	}
});


$(function(){
	// 字符验证
	jQuery.validator.addMethod("byteMaxLength", function(value,
			element, param) {
		var length = value.length;
		for ( var i = 0; i < value.length; i++) {
			if (value.charCodeAt(i) > 127) {
				length++;
			}
		}
		return this.optional(element) || (length <= param);
	}, $.validator.format("不能超过{0}个字节(一个中文字算2个字节)"));
	// IP地址验证
	jQuery.validator.addMethod("ip", function(value, element) {
	var ip = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
	return this.optional(element) || (ip.test(value) && (RegExp.$1 < 256 && RegExp.$2 < 256 && RegExp.$3 < 256 && RegExp.$4 < 256));
	}, "Ip地址格式错误"); 
	
	//表单验证
	$('form[name=wowzaForm]').validate({
		errorElement:'span',
		success:function(label){
			label.addClass('succeed');
		},
		errorPlacement: function(error, element) { //指定错误信息位置
			 if (element.is(':radio') || element.is(':checkbox')) {  
	             	var div =element.parent().parent().parent().parent().parent().parent();
	            	var label=div.children("label");
	            	error.appendTo(label);
	            } else {
	               //error.insertAfter(element);
	            	var div =element.parent().parent();
	            	var label=div.children("label");
	            	error.appendTo(label);
	            }
		},
		rules: {
			name:{
				required: true,
			},
			account:{
				required: true,
			},
			lan_ip:{
				required: true,
				ip: true
			},
			admin_url:{
				required: true
			},
			video_path:{
				required: true
			},
			ipname:{
				required: true
			},
			stream_name:{
				required: true
			},
			publish_url:{
				required: true
			}
		},
		
		//设置提示信息
        messages:{
        	name:{
                required: "名称不能为空",
            },
            account:{
                required: "系统账号不能为空",
            },
            lan_ip:{
            	required: "内网IP不能为空"
            },
            wan_ip:{
            	required: "外网IP不能为空"
            },
            video_path:{
            	required: "存放目录不能为空"
            },
            ipname:{
            	required: "输入信源不能为空"
            },
            stream_name:{
            	required: "stream name不能为空"
            },
            publish_url:{
            	required: "访问URL不能为空"
            }
        }
	});
	
	//根据id验证
	var ipnameId = "ipname_id_"+temp_id;
	var stream_name_id = "stream_name_"+temp_id;
	var publish_urlId = "publish_url_"+temp_id;
	$('#'+ipnameId).rules('add', { required: true});
	$('#'+stream_name_id).rules('add', { required: true});
	$('#'+publish_urlId).rules('add', { required: true});
	
	
	
});
$.validator.setDefaults({
	submitHandler: function() {
		var sId = $("#channel_id").val();
		if(sId!=""){
			t_channel_add_or_update(sId);
		}else{
			t_channel_add_or_update(-1);
		}
	}
});


$(function(){
	//表单验证
	$('form[name=channelForm]').validate({
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
			name_zh:{
				required: true,
				rangelength: [2,30]
			},
			name_en:{
				required: true,
				rangelength: [2,30]
			},
			transcoder_ip:{
				required: true,
			},
			transcoder_id:{
				required: true,
			},
			play_url:{
				required: true,
			},
			wowza_id:{
				required: true,
			}
			 
		},
		
		//设置提示信息
        messages:{
        	name_zh:{
                required: "频道名称不能为空",
                rangelength: "用户名必须在{0}和{1}之间"
            },
            name_en:{
                required: "频道代码不能为空",
                rangelength: "用户名必须在{0}和{1}之间"
            },
            transcoder_ip:{
            	required: "滚播IP 不能为空"
            },
            transcoder_id:{
            	required: "transcoder_id不能为空"
            },
            play_url:{
            	required: "播放地址不能为空",
            	url: '地址格式不正确'
            },
            wowza_id:{
            	required: "请选择信号"
            },
            
            type:{
            	required: "类型不能为空",
            },
            
            
            admin_url:{
            	required: "管理地址不能为空",
            	url: '地址格式不正确'
            }
            
            
        }
		
	});
	
	
	
});
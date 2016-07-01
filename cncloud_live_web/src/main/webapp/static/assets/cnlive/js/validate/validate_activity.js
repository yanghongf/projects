$.validator.setDefaults({
	submitHandler: function() {
		var sId = $("#activity_id").val();
		if(sId!=""){
			t_activity_save_or_update(sId);
		}else{
			t_activity_save_or_update(-1);
		}
	}
});


$(function(){
	//表单验证
	$('form[name=activityForm]').validate({
		errorElement:'span',
		success:function(label){
			label.addClass('succeed');
		},
		errorPlacement: function(error, element) { //指定错误信息位置
			 if (element.is(':radio') || element.is(':checkbox')) { 
	             	var div =element.parent().parent().parent().parent().parent().parent();
	            	var label=div.children("label");
	            	error.appendTo(label);
	            	console.log(element);
	            } else {
	               //error.insertAfter(element);
	            	var div =element.parent().parent();
	            	var label=div.children("label");
	            	error.appendTo(label);
	            }
		},
		rules: {
			name:{
				required: true
			},
			epg_name:{
				required: true
			},
			description:{
				required: true
			},
			place:{
				required: true
			},
			start_time:{
				required: true
			},
			end_time:{
				required: true
			},
			contact_user:{
				required: true
			},
			notify_user:{
				required: true
			},
			is_free:{
				required: true
			},
			is_playback:{
				required: true
			},
			logo:{
				required: true
			},
			chatroom_id:{
				required: true,
				digits:true
			},
			t_default_video_id:{
				required: true
			}
		},
		messages:{
        	name:{
                required: "活动名称不能为空"
            },
            epg_name:{
                required: "EPG条目名不能为空"
            },
            description:{
            	required: "描述必填"
            },
            place:{
            	required: "活动地点必填"
            },
            start_time:{
            	required: "开始时间必填"
            },
            end_time:{
            	required: "结束时间必填",
            },
            contact_user:{
            	required: "负责人必填"
            },
            notify_user:{
            	required: "邮件抄送相关人员",
            },
            is_free:{
            	required: "是否免费？",
            } ,
            is_playback:{
            	required: "是否启用回放？",
            },
            logo:{
            	required: "请选择画面logo",
            },
            chatroom_id:{
            	required: "聊天室id必填，且只能填数字",
            },
            t_default_video_id:{
            	required: "请选择垫片",
            }
        }
		
	});
});
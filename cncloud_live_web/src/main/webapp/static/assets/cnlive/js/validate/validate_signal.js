// validate exit
$.validator.setDefaults({
	submitHandler: function() {
//		alert("表单信源验证通过!");
		var sId = $("#tSignalId").val();
		if(sId!=""){
			t_signal_add_or_update(sId);
		}else{
			t_signal_add_or_update(-1);
		}
//		debug: true
	}
});


$(function(){
	$('form[name=signalForm]').validate({
		errorElement:'span',
		success:function(label){
			label.addClass('succeed');
		},
		errorPlacement: function(error, element) { 
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
				rangelength: [3,17]
			},
			ip:{
				required: true
			},
			type:{
				required: true
			},
			stream_name:{
				required: true
			},
			admin_url:{
				required: true,
			}
		},
		
		//设置提示信息
        messages:{
        	name:{
                required: "信源名称不能为空",
                rangelength: "长度必须在{0}和{1}之间"
            },
            ip:{
            	required: "设备ip不能为空"
            },
            type:{
            	required: "类型不能为空",
            },
            stream_name:{
            	required: "stream_name不能为空",
            },
            admin_url:{
            	required: "管理地址不能为空",
            }
        }
		
	});
	
});
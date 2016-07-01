function to_top(id) {
	$.ajax({
		url : BASE+'/check/top/'+id,
		type : 'get',
		async : true,
		error : function() {
			alert('获取错误！');
		},
		success : function(data) {
			window.location.href="../list/1";
		}
	});
}

function to_pass(id) {
	$.ajax({
		url : BASE+'/check/pass/'+id,
		type : 'get',
		async : true,
		error : function() {
			alert('获取错误！');
		},
		success : function(data) {
			window.location.href="../list/1";
		}
	});
}
//断流处理
//function play_close(id,live_url){
//	$.ajax({
//		url : '../../check/cut/' + id,
//		type : 'post',
//		datatype : "json",
//		async : true,
//		data:{"live_url":live_url},
//		error : function() {
//			alert('关闭时发生错误!');
//		},
//		success : function(data) {
//			location.href = '../../check/list/1';
//			alert("关闭成功");
//		}
//	});
//}
//change


 
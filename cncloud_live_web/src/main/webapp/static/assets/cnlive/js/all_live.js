function t_live_close(id, uuid) {
	$.ajax({
		url : BASE + '/check/close/' + id + "/" + uuid,
		type : 'post',
		async : true,
		error : function() {
			alert('获取错误！');
		},
		success : function(data) {
			location.href = "../../live/alllive/1";
		}
	});
}
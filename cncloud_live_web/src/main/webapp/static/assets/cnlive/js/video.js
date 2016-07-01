function t_live_xq(id){
	$.ajax({
		url:'../../video/detail',
		type:'post',
		datatype : 'json',
		data:{"id":id},
	});
}
function t_live_underLine(id){
	alert(id);
	$.ajax({
		url:'../../video/unline',
		type:'post',
		datatype : 'json',
		data:{"id":id},
	});
}
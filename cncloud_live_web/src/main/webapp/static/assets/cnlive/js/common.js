/**
 * 
 * 自主 公共 js 方法
 */
// 下一页
function next_page(pageNum) {
	window.location.href = "" + pageNum;
}

// 提示
function showTip(succ) {
	if (succ) {
		$("#info_tab_span").show();
		$("#info_tab").html("操作成功");
	} else {
		$("#info_tab_span").show();
		$("#info_tab").html("操作失败！");
	}
}

function showTipWidthMsg(succ, msg) {
	if (succ) {
		$("#info_tab_span").show();
		$("#info_tab_span").html(msg);
	} else {
		$("#info_tab_span").hide();
	}
}

$.format = function(source, params) {
	if (arguments.length == 1)
		return function() {
			var args = $.makeArray(arguments);
			args.unshift(source);
			return $.format.apply(this, args);
		};
	if (arguments.length > 2 && params.constructor != Array) {
		params = $.makeArray(arguments).slice(1);
	}
	if (params.constructor != Array) {
		params = [ params ];
	}
	$.each(params, function(i, n) {
		source = source.replace(new RegExp("\\{" + i + "\\}", "g"), n);
	});
	return source;
};


Date.prototype.format = function(format) {
    var o = {
        "M+": this.getMonth() + 1, //month  
        "d+": this.getDate(),    //day  
        "h+": this.getHours(),   //hour  
        "m+": this.getMinutes(), //minute  
        "s+": this.getSeconds(), //second  
        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter  
        "S": this.getMilliseconds() //millisecond  
    }
    if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
(this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o) if (new RegExp("(" + k + ")").test(format))
        format = format.replace(RegExp.$1,
RegExp.$1.length == 1 ? o[k] :
  ("00" + o[k]).substr(("" + o[k]).length));
    return format;
}

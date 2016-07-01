<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>点播详情 | <f:message key="common.title" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>
<script src="${BASE}/static/assets/jwplayer/jwplayer.js"></script>
<script src="${BASE}/static/assets/jwplayer/jwplayer.html5.js"></script>
<script type="text/javascript">
	jwplayer.key = "MGAzpXRYxGnaVXhH8jSdKXzDe7ucAAvZGWggIA==";
</script>
</head>
<body class="skin-blue  fixed ">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					点播详情 <small>${tVideo.title}</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="#">点播详情</a></li>
				</ol>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="timeline-item">
							<div class="timeline-body">
								<div class="row">
									<div class="col-md-12">
										<div class="box box-danger">
											<div class="box-body">
												<table class="table table-bordered">
													<tr>
														<td colspan="3" align='center'><h2>${tVideo.title}</h2></td>
													    
													</tr>
													<tr>
														<td><b>id:</b></td>
														<td>${tVideo.id}</td>
														<td rowspan="6" align='center'><div id="player"></div></td>
													</tr>
													<tr>
														<td><b>Name:</b></td>
														<td colspan="1">${tVideo.name}</td>
													</tr>
													<tr>
														<td><b>relation_id:</b></td>
														<td colspan="1">${tVideo.relation_id}</td>
													</tr>
													
													<tr>
														<td><b>t_user_id:</b></td>
														<td colspan="1">${tVideo.t_user_id}</td>
													</tr>
													<tr>
														<td><b>t_app_id:</b></td>
														<td colspan="1">${tVideo.name}</td>
													</tr>
													<tr>
														<td><b>state:</b></td>
														<td colspan="1">${tVideo.state}</td>
													</tr>
													<tr>
														<td><b>custom_args:</b></td>
														<td colspan="2">${tVideo.custom_args}</td>
													</tr>
													<tr>
														<td><b>video_uuid:</b></td>
														<td colspan="2">${tVideo.video_uuid}</td>
													</tr>
													<tr>
														<td><b>create_time:</b></td>
														<td colspan="2">${tVideo.create_time}</td>
													</tr>
													<tr>
														<td><b>description:</b></td>
														<td colspan="2">${tVideo.description}</td>
													</tr>
													<tr>
														<td><b>play_url:</b></td>
														<td colspan="2">${tVideo.play_url}</td>
													</tr>
													<tr>
														<td><b>preview_image:</b></td>
														<td colspan="2">${tVideo.preview_image}</td>
													</tr>
													<tr>
														<td><b>direct:</b></td>
														<td colspan="2">${tVideo.direct}</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%@ include file="/pages/common/bottom.jsp"%>
					</div>
					<%@ include file="/pages/common/js.jsp"%>
					<script src="${BASE}/static/assets/cnlive/js/player_6.js"></script>
				</div>
			</section>
		</div>
	</div>
	<script type="text/javascript" src="../../pages/check/js/ckplayer.js" charset="utf-8"></script>
	<!-- <script type="text/javascript" src="../../pages/check/js/offlights.js" charset="utf-8"></script> -->
<script type="text/javascript">
/* jwplayer("player").setup({ 
	file: '${tVideo.play_url}', 
	height: 260, 
	image: "/assets/myVideo.jpg", 
	autostart:true,
	rtmp: { 
		bufferlength: 0.1 
	}, 
	width: 370 
}); */

    var BASE_URL = "http://localhost:8080/cnlive_live_web/static/assets/ck/", 
        prefix = "http", 
        isHLS = true,
        url = '${tVideo.play_url}';
    var isMobile = function () {
        var check = false;
        (function (a) {
            if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4)))
                check = true
        })(navigator.userAgent || navigator.vendor || window.opera);
        return check;
    }
    if (isMobile()){
		new ksVideo({
			container:"player",
			url: url,
			width:600,
			height:200,
			face:"mp4.png"
		});
    } else {
        var flashvars;
        // 播放器参数说明地址：http://www.ckplayer.com/tool/help/29.htm
        if (prefix == "http" && isHLS){
            flashvars = {
               f : BASE_URL + 'ckplayer/m3u8.swf',
               a : url || 'http://kssws.ks-cdn.com/20121218/abc.mp4-640x480-b211ebb6.mp4',
               c : 0,
               p : 1,
               e : 1,
               s : 4,
               lv: 0//注意，是否锁定进度栏  0：不锁定，1：锁定。如果是直播，需设置lv:1 
            }  
        } else if (prefix == "rtmp" || !isHLS){
            flashvars = {
                f : url || 'http://kssws.ks-cdn.com/20121218/abc.mp4-640x480-b211ebb6.mp4',
                p : 1,
                c : 0, //调用配置方式  =0：调用ckplayer.js
                lv: 0
            }
        }
        var params = {
            bgcolor:'#FFF',
            allowFullScreen:true,
            allowScriptAccess:'always',
            wmode:'transparent'
        };
        CKobject.embed('http://localhost:8080/cnlive_live_web/static/assets/ck/ckplayer/ckplayer.swf','player','ckplayer_a1','400', '350', false, flashvars)
    }
</script>
</body>

</html>

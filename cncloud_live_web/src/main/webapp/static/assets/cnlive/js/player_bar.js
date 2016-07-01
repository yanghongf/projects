 var thePlayer=jwplayer("player_span").setup({
	 	flashplayer:BASE+"/static/assets/jwplayer/jwplayer.flash.swf",
	 	file: $("#play_url").val(),
        image: BASE+"/static/assets/jwplayer/player.jpg",
        width: '640',          
        height: '480',
        icons: false,
		rtmp: { 
		     bufferlength: 0.1 
             //subscribe: true
			 //securetoken: "Kosif093n203a"
		},
		 events: {
		     //onComplete: function () { console.log("播放结束!!!"); },
		     //onVolume: function () { console.log("声音大小改变!!!"); },
		     //onReady: function () { console.log("准备就绪!!!"); },
		     //onPlay: function () { console.log("开始播放!!!"); },
		     //onPause: function () { console.log("暂停!!!"); },
		     //onBufferChange: function () { console.log("缓冲改变!!!"); },
		     //onBufferFull: function () { console.log("视频缓冲完成!!!"); },
		     //onError: function (obj) { console.log("播放器出错!!!" + obj.message); },
		     //onFullscreen: function (obj) { if (obj.fullscreen) { console.log("全屏"); } else { console.log("非全屏"); } },
		     //onMute: function (obj) { console.log("静音/取消静音") }
		 }
    });

function play(){
	if(thePlayer.getState() != 'PLAYING'){  
	       thePlayer.play(true);  
	       $("#play_button").html("断开");  
	   }else {  
	       thePlayer.play(false);  
	       thePlayer.stop();
	       $("#play_button").html("载入");  
	   }  
	   
}

 
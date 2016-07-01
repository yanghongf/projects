var map = {}; 
//获取所有播放器span
var foo= $("span[class='mailbox-attachment-icon has-img']"); 
	$(foo).each(function() {
	  var channel_id=this.id.split("_")[2];
	  var play_url= $("#play_url_"+channel_id).val();
	  var player_name=this.id;
	  //初始化播放器对象
	  var player_handel="player_"+channel_id;
	 
	  player_handel=jwplayer(player_name).setup({
		 	flashplayer:BASE+"/static/assets/jwplayer/jwplayer.flash.swf",
		 	file: play_url,
	        image: BASE+"/static/assets/jwplayer/player.jpg",
	        width: '155',          
	        height: '105',
	        autostart:false,
	        mute:true,
			rtmp: { 
			     bufferlength: 0.1 
	             //subscribe: true
				 //securetoken: "Kosif093n203a"
			}
	    });
	  
	  map["player_"+channel_id] = player_handel;
}) 
 
function play(id){
	var player=map["player_"+id];
	if(player.getState() != 'PLAYING'){  
		player.play(true);  
	       $("#play_button_"+id).html("断开");  
	   }else {  
		   player.play(false);  
		   player.stop();
	       $("#play_button_"+id).html("载入");  
	   }  
	   
}

 
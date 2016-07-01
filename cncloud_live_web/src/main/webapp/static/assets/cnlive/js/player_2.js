 var thePlayer_1=jwplayer("player_span_1").setup({
	 	flashplayer:BASE+"/static/assets/jwplayer/jwplayer.flash.swf",
	 	file: $("#play_url_1").val(),
        image: BASE+"/static/assets/jwplayer/player.jpg",
        width: '480',          
        height: '320',
        icons: false,
		rtmp: { 
		     bufferlength: 0.1 
		},
		 events: {
		 }
    });

function play_1(){
	if(thePlayer_1.getState() != 'PLAYING'){  
		thePlayer_1.play(true);  
	       $("#play_button_1").html("断开");  
	   }else {  
		   thePlayer_1.play(false);  
		   thePlayer_1.stop();
	       $("#play_button_1").html("载入");  
	   }  
	   
}


var thePlayer_2=jwplayer("player_span_2").setup({
 	flashplayer:BASE+"/static/assets/jwplayer/jwplayer.flash.swf",
 	file: $("#play_url_2").val(),
    image: BASE+"/static/assets/jwplayer/player.jpg",
    width: '480',          
    height: '320',
    icons: false,
	rtmp: { 
	     bufferlength: 0.1 
	},
	 events: {
	 }
});

function play_2(){
if(thePlayer_2.getState() != 'PLAYING'){  
	thePlayer_2.play(true);  
       $("#play_button_2").html("断开");  
   }else {  
	   thePlayer_2.play(false);  
	   thePlayer_2.stop();
       $("#play_button_2").html("载入");  
   }  
   
}



 
var ksVideo=function(options){
	this.videoUrl=options && options.url;
	this.containerID=options && options.container;
	this.videoList = options && options.videoList;
	this.width = options && options.width || 0;
	this.height=options && options.height || 0;
	this.face=options && options.face ||null;
	//this.setContainerPosition();
	if(!this.videoUrl || !this.containerID){
		return false;
	}

	this.init();

}
ksVideo.prototype={
	init:function(){
		this.safari=this.isSafari();
		this.android=this.version.ANDROID;
		this.container=this.getID(this.containerID);
		this.draw();

	},
	currentTime:0,
	draw:function(){
		this.oDiv=document.createElement("div");
		this.oDiv.style.background="#000";
		this.setContainerPosition();
		this.createVideo();
		this.loadImg();
		

		this.oBtnContainer=document.createElement("div");
		this.oBtnContainer.className="btnContainer";
		var arr=[];
		arr.push('<div class="operate"><button id="play" class="btnPlay"></button>');
		arr.push('<div class="duration" id="duration">--/--</div>');
		//arr.push('<button id="set" class="set">设置</button>');
		arr.push("</div>");
		this.oBtnContainer.innerHTML=arr.join('');
		this.oDiv.appendChild(this.oBtnContainer);

		this.container.appendChild(this.oDiv);
		this.bindEvent();

	},

	loadImg:function(){
		
		var oImage=new Image();
		this.oImage=oImage;
		if(!this.face){
			return false;
		}
		oImage.src=this.face;
		oImage.className="loadTemplate";
		
		var me=this;
		oImage.onload=function(){
			//console.log(oImage.width);
			var imageStyle=me.getImageStyle(this);
			for(var item in imageStyle){
				this.style[item]=imageStyle[item]+"px";
			}

			this.style.top="50%";
			this.style.left="50%";
			this.style.position="absolute"
			this.style.marginLeft=(-1*parseInt(this.style.width)/2)+"px";
			this.style.marginTop=(-1*parseInt(this.style.height)/2)+"px";

			me.oDiv.appendChild(oImage);
		}

	},

	getImageStyle:function(obj){
		var w=obj.width;
		var h=obj.height;
		var currentWidth=this.currentWidth;
		var currentHeight=this.currentHeight;
		var newWidth,newHeight;
		if(w>h){
			newWidth = Math.min(w,currentWidth);
			var xishu=newWidth/w;
			return {"width":newWidth,"height":h*xishu}
		}
		else{
			newHeight=Math.min(h,currentHeight);
			var xishu=newHeight/h;
			return {"height":newHeight,"width":w*xishu}
		}

	},

	createVideo:function(){
		var video=document.createElement("video");
		video.type="video/mp4";
		video.controls=false;
		//video.preload="none";
		video.src=this.videoUrl;
		//video.setAttribute("webkit-playsinline",true);
		video.setAttribute("x-webkit-airplay",true);
		video.setAttribute("preload","none");
		if(this.safari &&  !this.android){
			video.style.top="-30px";
		}
		video.style.width="100%";
		video.style.height="100%";
		video.style.position="absolute";
		video.style.top="-200%";
		video.style.zIndex=1;
		this.video=video;
		this.oDiv.appendChild(video);
		//video.load();
		this.setVideoEvent();
	},

	setVideoEvent :function(){

		var video=this.video;
		var me=this;
		video.load();


		video.addEventListener('loadeddata', function(){
			//me.closeMsg();
			video.currentTime=me.currentTime;
			video.setAttribute("webkit-playsinline",true);
			me.setDuration();
		}, false);

		video.addEventListener('timeupdate', function(){
			me.setDuration();
		}, false);
		video.addEventListener('durationchange', function(){
			me.setDuration();
		}, false);
		video.addEventListener('play', function(){
			if(me.safari && !me.android){
				video.style.top="0px";
			}
			video.style.top="0px";
			me.onPlay();
		}, false);

		video.addEventListener('pause', function(){
			me.onPause();
			if(me.safari && !me.android){
				video.style.top="-30px";
			}
		}, false);
	},

	setDuration:function(){
		var d=this.getID("duration");
		var currentTime=this.video.currentTime;
		var _dur=this.getDuration();
		var _c=this.format(currentTime);
		var _all=this.format(_dur);
		d.innerHTML=_c+"/"+_all;
	},

	getDuration:function(){
		var _duration=this.video.duration;
		return _duration;
	},
	
	format:function(str){
		var t=str;
		var h=Math.floor(t/3600);
		var min=Math.floor(t/60)-h*60;
		var s=Math.floor(t%60);
		var _h=h>9?h:"0"+h;
		var _min=min>9?min:"0"+min;
		var _s=s>9?s:"0"+s;
		return _h+":"+_min+":"+_s;
	},

	onPlay:function(){
		this.oImage.style.display="none";
		this.oBtnContainer.style.display="none";
		this.video.controls=true;
	},
	
	onPause:function(){
		this.oBtnContainer.style.display="block";
		this.video.controls=false;
	},

	setContainerPosition :function(){
		var isMobile=this.isMobile();
		var vheight=this.getVisibleHeight();
		var vwidth=this.getVisibleWidth();
		var _w=vwidth<=this.width ? vwidth : this.width?this.width:vwidth;
		var _h=vheight<=this.height ? vheight : this.height?this.height:vheight;
		this.currentWidth=_w;
		this.currentHeight=_h;

		//if(isMobile){
		this.oDiv.style.width=_w+"px";
		this.oDiv.style.height=_h+"px";	
		this.oDiv.style.position="relative";
		//}

		
	},

	bindEvent :function(){
		var btn=this.getID("play");
		var me=this;
		/*
		btn.onclick=function(){
			me.video.play();
		}
		*/
		btn.addEventListener('click', function(){
			if(!me.video){
				me.createVideo();
				//me.setVideoEvent();
			}
			me.video.play();
		}, false);


		//var btnSet=this.getID("set");
		/*
		btnSet.onclick=function(){
			me.showMsg();
		}
		*/
        /*
		btnSet.addEventListener('click', function(){
			me.showMsg();
		}, false);
        */
/*
		var btnSetContainer=this.getID("dialogSet");
		btnSetList=btnSetContainer.getElementsByTagName("span");

		btnSetList[0].addEventListener('click', function(){
			me.currentTime=me.video.currentTime;
			//console.log(me.currentTime);
			//me.showMsg();
			me.video.src=me.videoList[0];
			
			me.video.load();
			me.closeMsg();
		}, false);

		btnSetList[1].addEventListener('click', function(){
			//me.showMsg();
			me.currentTime=me.video.currentTime;
			me.video.src=me.videoList[1];
			me.closeMsg();
			me.video.load();
		}, false);

		btnSetList[2].addEventListener('click', function(){
			//me.showMsg();
			me.currentTime=me.video.currentTime;
			me.video.src=me.videoList[2];
			
			me.video.load();

			me.closeMsg();
		}, false);

		btnSetList[3].addEventListener('click', function(){
			me.closeMsg();
		}, false);*/
	},

	showMsg:function(){
		var dialogSet=this.getID("dialogSet");
		dialogSet.style.display="block";
	},

	closeMsg:function(){
		var dialogSet=this.getID("dialogSet");
		dialogSet.style.display="none";
	},

	isMobile: function() {
		var check = false;
		(function(a){
			if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))
				check = true
		})(navigator.userAgent||navigator.vendor||window.opera);
		return check; 
	},

	isSafari : function(){
        var ua = navigator.userAgent||navigator.vendor||window.opera
        return ua.indexOf("Safari") > -1 && ua.indexOf("Chrome") == -1
    },

	version : {
		IOS: !! navigator.userAgent.match(/iP(od|hone|ad)/i),
		ANDROID: !! (/Android/i).test(navigator.userAgent)
	},

	getVisibleHeight: function() {
		var doc = document;
		var docE = doc.documentElement;
		var body = doc.body;
		return (docE && docE.clientHeight) || (body && body.offsetHeight) || window.innerHeight || 0;
	},
	getVisibleWidth: function() {
		var doc = document;
		var docE = doc.documentElement;
		var body = doc.body;
		return (docE && docE.clientWidth) || (body && body.offsetWidth) || window.innerWidth || 0;
	},
	getID:function(id){
		return typeof id == "string" ?document.getElementById(id):id;
	}


}

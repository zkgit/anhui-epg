<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
 	String action= RequestUtil.getString("t", request);
 	String programType=RequestUtil.getString("programType", request);
 	long cutdrama=RequestUtil.getLong("cutdrama", request);
 	long cutTime=(long)(RequestUtil.getLong("cutTime", request));
	String playurl= RequestUtil.getString("playurl", request);
	long seriesBcharging=RequestUtil.getLong("seriesBcharging", request);
	long ordered=RequestUtil.getLong("ordered", request);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta content="IE=5.0000" http-equiv="X-UA-Compatible">
    <meta name="page-view-size" content="1280*720">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="GENERATOR" content="MSHTML 11.00.10570.1001">
    <title>smallwindow</title>
    <jsp:include page="/common/top.jsp" >
        <jsp:param name="t" value="<%=System.currentTimeMillis() %>"/>
    </jsp:include>

    <script type="text/javascript">

    window.document.onkeypress = function (keyEvent) {
        keyEvent = keyEvent ? keyEvent : window.event;
        var KV = keyEvent.which ? keyEvent.which : keyEvent.keyCode;
        if (KV == 0x0008){
           window.history.go(-1)
        }
    }
       var playUrl="<%=playurl%>";

       var watch_time=<%=cutTime%>;
       var mp,nativePlayerInstanceID;
        try {
        mp = new MediaPlayer();
        nativePlayerInstanceID = mp.getNativePlayerInstanceID();
        }catch (ex){}
       var smallt;
       if(smallt){ clearInterval(smallt)}
        function init_mp() {
    _SELECT('dec').innerHTML=playUrl;
            try {
                mp.setAllowTrickmodeFlag(0); //设置是否允许trick操作。 0：允许 1：不允许
                mp.setVideoDisplayMode(0); //0:按setVideoDisplayArea中设定的left,top,width,height,来显示视频   1：全屏显示 2：按宽度显示  指在不改变原有图像 纵横比的情况下按全屏宽度显示   3：按高度显示，指在不改变原有图像 纵横比的情况下按全屏高度显示 255: 视频显示窗口将被关闭。
                mp.setVideoDisplayArea(62, 52, 532, 314); //left,top,width,height
                mp.refreshVideoDisplay(); //刷新
                var media = '[{mediaUrl:"' + playUrl +'",mediaCode: "vod1",mediaType:2,audioType:1,videoType:3,streamType:2,drmType:1,fingerPrint:1,copyProtection:0,allowTrickmode:1,startTime:0,endTime:0,entryID:"entry1"}]';
                mp.setSingleMedia(media); //设置媒体播放器播放媒体内容
                mp.playFromStart();
                if(parseInt('<%=seriesBcharging%>')&&!<%=ordered%>){//付费并且不是会员 电视剧，纪实大于3集，综艺大于1集
                    if(watch_time>=420){mp.pause();}
                    else{
                        if(watch_time>10){
                            setTimeout('F_E_F0()',200);
                        }
                        smallt=setInterval(function(){
                            var cutPlayTime=mp.getCurrentPlayTime();
                            if(cutPlayTime>=420){
                               mp.pause();
                                clearInterval(smallt)
                            }
                        },1000)
                    }
                }else if(watch_time>10){//免费或者是会员
                   setTimeout('F_E_F0()',200);
                }
            } catch (ex) {}
          window.parent.focus();
        }

        var t1 = 0;
        //父级调用
        function F_M_0(flag) { //音量加减
            try {
                var volume = mp.getVolume(); //获取当前系统音量 0-100
                if (flag == '+') {
                    if (volume < 96) {
                        volume = volume + 6;
                        if (volume > 96) volume = 96;
                    }
                } else if (flag == '-') {
                    if (volume > 0) {
                        volume = volume - 6;
                        if (volume < 0) {
                            return;
                        }
                    }
                }
                var img_volume = Math.floor(volume / 6) + 1;
                mp.setVolume(volume); //设置当前系统音量 0-100

                //不存在img_volume  div_volume
                //_SELECT("img_volume").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/volumn_icon/voice_control" + img_volume + ".png"; //音量进程图1-17
                //_SELECT("div_volume").style.display = "block";
                if (t1 != 0) clearTimeout(t1);
                t1 = setTimeout(function () {
                  //  _SELECT("div_volume").style.display = "none";
                }, 3000);
            } catch (e) {}
        }
        function F_E_F0(){ //继续播放
             mp.pause();
            mp.playByTime(1, watch_time, 1);
        }



        //停止播放
        function F_M_10() {
            mp.stop(); //停止播放
            mp.releaseMediaPlayer(nativePlayerInstanceID); //释放机顶盒MediaPlayer的对象，结束对应MediaPlayer的生命周期   返回0释放成功  返回-1释放失败
        }


        function backPrograma(){ //退出
            setTimeout("F_M_10()", 1000);
        }

    </script>


</head>

<body bgcolor="transparent" onload="init_mp();" onunload="F_M_10()">
<div id="test" style="display:none1;left: 65px;top: 100px;width:500px;height:100px; color:red;background:#fff; font-size: 14px; position: absolute;word-wrap: break-word; "></div>

</body></html>
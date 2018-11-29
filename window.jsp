    <%@page import="java.net.URLEncoder"%>
<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String action= RequestUtil.getString("t", request);

    long id=RequestUtil.getLong("id", request);
    String cpcode=RequestUtil.getString("cpcode", request);
    String code=RequestUtil.getString("code", request);
    String programType=RequestUtil.getString("programType", request);

    String videoid=RequestUtil.getString("videoid", request);
    String title=RequestUtil.getString("title", request);
    long cutTime=RequestUtil.getLong("cutTime", request);
    String playurl= RequestUtil.getString("playurl", request);
    String returnUrl= RequestUtil.getString("returnUrl", request);

    long iscut=RequestUtil.getLong("iscut", request);
    long dramasum=RequestUtil.getLong("dramasum", request);
    long cutdrama=RequestUtil.getLong("cutdrama", request);

    String focus_id=RequestUtil.getString("focus_id", request);
    String programa_id=RequestUtil.getString("programa_id", request);
    String perv_num=RequestUtil.getString("perv_num", request);
    int perv_count=RequestUtil.getInt("perv_count", request);
    String pf_focus_id=RequestUtil.getString("pf_focus_id", request);
    long seriesBcharging=RequestUtil.getLong("seriesBcharging", request);
    long ordered=RequestUtil.getLong("ordered", request);



    String home_focus_id=RequestUtil.getString("home_focus_id", request);
	String home_from=RequestUtil.getString("home_from", request);

	String back=RequestUtil.getString("back", request);
	String home_perv_num=RequestUtil.getString("home_perv_num", request);
	String sanfocus_id=RequestUtil.getString("sanfocus_id", request);
	String sanperv_num=RequestUtil.getString("sanperv_num", request);
    String cartoon_code=RequestUtil.getString("cartoon_code", request);
    
    String backUrl=RequestUtil.getString("backUrl", request);//接受backUrl
    String backUrl_encode=URLEncoder.encode(backUrl,"UTF-8");
    
    String pervUrl="&back="+back+"&cartoon_code="+cartoon_code+"&focus_id="+focus_id+"&programa_id="+programa_id+"&perv_num="+perv_num+"&perv_count="+(perv_count+1)+"&pf_focus_id="+pf_focus_id+"&home_focus_id="+home_focus_id+"&home_from="+home_from+"&home_perv_num="+home_perv_num+"&sanfocus_id="+sanfocus_id+"&sanperv_num="+sanperv_num+"&backUrl="+backUrl_encode;
    long paixu=RequestUtil.getLong("paixu", request);

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
    <meta content="IE=5.0000" http-equiv="X-UA-Compatible">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="page-view-size" content="1280*720">
    <title>播放</title>
    <jsp:include page="/common/top.jsp">
        <jsp:param name="t" value="<%=System.currentTimeMillis() %>" />
    </jsp:include>
    <script src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/webxiri_1.0.8.js" type="text/javascript"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body,
        html {
            width: 1280px;
            height: 720px;
            overflow: hidden
        }
    </style>

    <script type="text/javascript">

        var cutdrama = '<%=programType%>' == 'film' ? 1 : '<%=programType%>' == 'arts'?<%=paixu%>:<%=cutdrama%>;
        var dramasum = <%=dramasum%>;
        var title = '<%=title%>';
        var videoid = "<%=videoid%>";
        var playUrl = "<%=playurl%>";
        var watch_time = <%=cutTime%>;
        var returnUrl='<%=returnUrl%>';
          returnUrl=returnUrl.replace(/\&perv_count=\d*/g,'&perv_count=0')


      // var returnUrl= "http://117.71.39.6/tyyq-test/detail.jsp?id=<%=id%>&programType=<%=programType%>&code=<%=code%>&perv_count=0&back=list&cpcode=<%=cpcode%><%=pervUrl%>";
        if ('<%=programType%>' != 'film') {
            var urlarr = [{
                cutdrama: {
                    playurl: "<%=playurl%>",
                    code: "<%=videoid%>"
                }
            }];
        }
        var focus_id = 'bt_f0';


        var mp;
        var nativePlayerInstanceID;
        try {
            mp = new MediaPlayer();
            nativePlayerInstanceID = mp.getNativePlayerInstanceID(); //读取本地的媒体播放实例的标识。保留这个标识   以便在跨页面时，标识这个本地的媒体播放实例
        } catch (ex) {}
        var start, playtime = 0;
        var wint,filmflag=false;
        if (wint) {clearInterval(wint)}

        function init_mp(){
            try {
                mp.setAllowTrickmodeFlag(0); //设置是否允许trick操作。 0：允许 1：不允许

                  mp.setVideoDisplayMode(1);//1：全屏显示
                //mp.setVideoDisplayMode(0); //0:按setVideoDisplayArea中设定的left,top,width,height,来显示视频   1：全屏显示 2：按宽度显示  指在不改变原有图像 纵横比的情况下按全屏宽度显示   3：按高度显示，指在不改变原有图像 纵横比的情况下按全屏高度显示 255: 视频显示窗口将被关闭。
                //mp.setVideoDisplayArea(0, 0, 1280, 720); //left,top,width,height

                mp.refreshVideoDisplay(); //刷新
                var media = '[{mediaUrl:"' + playUrl +'",mediaCode: "vod1",mediaType:2,audioType:1,videoType:3,streamType:2,drmType:1,fingerPrint:1,copyProtection:0,allowTrickmode:1,startTime:0,endTime:0,entryID:"entry1"}]';
                mp.setSingleMedia(media); //设置媒体播放器播放媒体内容
                mp.playFromStart(); //从媒体起始点播放
                start = new Date().getTime();
                initwatch();
                if ('<%=programType%>' != 'film') {
                     getDrama()
                }
            } catch (ex) {}

        }

        function initwatch(){
            if (<%=seriesBcharging%> && !<%=ordered%> && ('<%=programType%>' == ('tv' || 'documentary') ? (cutdrama > 3) :('<%=programType%>' == 'arts' ? (cutdrama > 1) : true))) { // 鉴权失败
                if ('<%=programType%>' == 'film') {
                 _SELECT("order_tips").style.display = "block";
                   filmflag=true;
                    if (watch_time>= 420) {
                        updateWatchRecord()
                        TRY_WATCH(userId, '<%=id%>', '<%=programType%>', title, '<%=cpcode%>', returnUrl)
                    } else {
                        if (watch_time > 10) {
                          setTimeout('F_WATCH_TIME2()', 1200);
                        }
                         wint = setInterval(function () {
                            var currentPlayTime = mp.getCurrentPlayTime();
                            if (currentPlayTime >= 420) {
                                mp.pause();
                                clearInterval(wint)
                                TRY_WATCH(userId, '<%=id%>', '<%=programType%>', title, '<%=cpcode%>',returnUrl)
                            }
                        }, 1000)
                    }
                } else {
                    updateWatchRecord()
                    TRY_WATCH(userId, '<%=id%>', '<%=programType%>', title, '<%=cpcode%>', returnUrl)
                }
            }else if (watch_time > 10) {
                    setTimeout('F_WATCH_TIME2()', 1200);
            }
        }
        var t1 = 0;
        var t2 = null;
        var t3 = 0;
        var t4 = null;
        var play_states = "play";
        var total_width = 1162;
        var show_times = 0;

        //处理时间
        function F_C_0(current_time) {
            var vod_time_info = parseInt(current_time);
            if (vod_time_info == 0) {
                return "00:00:00";
            }
            var hh = parseInt(vod_time_info / 3600);
            var mm = parseInt((vod_time_info - hh * 3600) / 60);
            var ss = vod_time_info - hh * 3600 - mm * 60;

            if (("" + hh).length == 1) {
                hh = "0" + hh;
            }
            if (("" + mm).length == 1) {
                mm = "0" + mm;
            }
            if (("" + ss).length == 1) {
                ss = "0" + ss;
            }
            return hh + ":" + mm + ":" + ss;
        }

        //设置播放进程
        function F_C_1() {
            var total_times = mp.getMediaDuration();
            var curr_times = show_times = mp.getCurrentPlayTime();
            _SELECT("process_bar_id").style.display = "block";
            if (total_times && curr_times && curr_times > 0) {
                var range = total_width / total_times;
                var yet_curr_width = Math.round(range * curr_times);
                //_SELECT("play_icon_id").style.left = 120+yet_curr_width+"px";
                _SELECT("played_id").style.width = yet_curr_width + "px";
                var curtime = F_C_0(curr_times);
                //_SELECT("show_time_id").style.left = 116+yet_curr_width+"px";
                _SELECT("show_time_id").innerHTML = curtime;
                var duration_str = F_C_0(total_times);
                _SELECT("end_time_id").innerHTML = "/" + duration_str;
            }
        }


        //没调用
        function F_M_0(flag) {
            try {
                var volume = mp.getVolume();
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
                mp.setVolume(volume);
                _SELECT("img_volume").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/volumn_icon/voice_control" + img_volume + ".png";
                _SELECT("div_volume").style.display = "block";
                if (t1 != 0) clearTimeout(t1);
                t1 = setTimeout(function () {
                    _SELECT("div_volume").style.display = "none";
                }, 3000);
            } catch (e) {}
        }

        var endflag=false;
        //快进、快退
        function F_M_1(key) {
            if (play_states == "play") {
                mp.pause();
                play_states = "pause";
                F_C_1();
                //return;
            }
            var total_times = mp.getMediaDuration();
            if (key == "F") { //快进
                show_times = parseInt(show_times, 10) + 30;
                if ((show_times > parseInt(total_times, 10))){
                    show_times = parseInt(total_times, 10);
                    if(!endflag){
                        endflag=true;
                        if(total_times>0){ jiancet(1);}
                   }
                }
            } else if (key == "R") { //快退
                show_times = parseInt(show_times, 10) - 30;
                if (show_times < 0) show_times = 0;
            }
            var range = total_width / parseInt(total_times, 10);
            var show_curr_width = Math.round(range * show_times);
            _SELECT("played_id").style.width = show_curr_width + "px";
            //_SELECT("play_icon_id").style.left = 120+show_curr_width+"px";
            //_SELECT("show_time_id").style.left = 120+show_curr_width+"px";

          if(filmflag&&(show_times>=420)){
               show_times=420;
             _SELECT("show_time_id").innerHTML = F_C_0(show_times);
             _SELECT("end_time_id").innerHTML = "/" + F_C_0(total_times);
             TRY_WATCH(userId, '<%=id%>', '<%=programType%>', title, '<%=cpcode%>', returnUrl)
              return;
           }
            _SELECT("show_time_id").innerHTML = F_C_0(show_times);
            _SELECT("end_time_id").innerHTML = "/" + F_C_0(total_times);
            if (t2 != null) clearTimeout(t2);
            t2 = setTimeout(function () {
                var play_point = parseInt(show_times, 10);
                mp.playByTime(1, play_point, 1);
                play_states = "play";
                _SELECT("play_button").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/play-play.png";
                _SELECT("process_bar_id").style.display = "none";
               
            }, 600);


        }

        //停止播放
        function F_M_10() {
            mp.stop();
            mp.releaseMediaPlayer(nativePlayerInstanceID); //释放机顶盒MediaPlayer的对象，结束对应MediaPlayer的生命周期   返回0释放成功  返回-1释放失败
        }

        //退出
        function backPrograma() {
            if(mp.getMediaDuration()&&title&&playUrl){
                updateWatchRecord();
            }
            setTimeout("backPrograma2()", 1000);
        }
		
        var back='<%=back%>';
        //退出播放做的操作
        function backPrograma2() {
            F_M_10();
             if(back.indexOf("animation_")!=-1 ){
                window.location.href=back+'.jsp?programType=<%=programType+pervUrl%>'
             }else {
                window.history.go(-1)
            }
        }

        function watchRecord() { //
           
        }

        var _ut = 0;
        var tvflag = false;

        function updateWatchRecord() { //提交当前播放时间
            if (_ut > 0) {
                return;
            }
            _ut++;
            // var t = (new Date()).valueOf();
            playtime = (new Date().getTime() - start) + playtime;
            var currentPlayTime = mp.getCurrentPlayTime(); //获取媒体播放到的当前 时间点
            var total_times = mp.getMediaDuration(); //获取当前播放的媒体的 总时长
            if (total_times - currentPlayTime <= 10) currentPlayTime = total_times;

            if ((watch_time > 10 && currentPlayTime <= 10) || (currentPlayTime && currentPlayTime > 10) || <%=iscut%> ==1 || tvflag) {
            	var stbModel = Authentication.CTCGetConfig("STBType");
            	var url = webset.api + "usr/demand.json?userid=" + userId + "&stb_model="+stbModel+"&videotype=video&videoid=" + videoid +"&cuttime=" + parseInt(currentPlayTime) + "&series=<%=code%>&cpcode=<%=cpcode%>&title=" + title +"&dramacount=" + dramas[cutdrama-1].dramaNo + "&opttype=1&from=bofangqi&play_time=" + (playtime / 1000);
    $.get(url, function (result) {

                });
            }
        }


        //感觉没调用
        function F_WATCH_TIME() {
            var total_times = mp.getMediaDuration();
            if (total_times - watch_time >= 20) {
                mp.pause();
                mp.playByTime(1, watch_time, 1); //当前媒体的某个时间点开始播放
            }
        }

        ////////////////////////////////////////////////


        var KEY_G_0 = 0x0008;
        var KEY_G_1 = 0x000D;
        var KEY_G_2 = 0x0021;
        var KEY_G_3 = 0x0022;
        var KEY_G_4 = 0x0025;
        var KEY_G_5 = 0x0026;
        var KEY_G_6 = 0x0027;
        var KEY_G_7 = 0x0028;
        var KEY_M_0 = 0x0103;
        var KEY_M_1 = 0x0104;
        var KEY_M_2 = 0x0105;
        var KEY_M_3 = 0x0106;
        var KEY_M_4 = 0x0107;
        var KEY_M_5 = 0x0108;
        var KEY_M_6 = 0x0109;
        var KEY_M_7 = 0x0300;
        var KEY_N_0 = 0x0030;
        var KEY_N_1 = 0x0031;
        var KEY_N_2 = 0x0032;
        var KEY_N_3 = 0x0033;
        var KEY_N_4 = 0x0034;
        var KEY_N_5 = 0x0035;
        var KEY_N_6 = 0x0036;
        var KEY_N_7 = 0x0037;
        var KEY_N_8 = 0x0038;
        var KEY_N_9 = 0x0039;
        var KEY_O_0 = 0x0072;
        var KEY_O_1 = 0x01A6;
        var KEY_O_2 = 0x0206;
        window.document.onkeypress = function (keyEvent) {
            keyEvent = keyEvent ? keyEvent : window.event;
            var KV = keyEvent.which ? keyEvent.which : keyEvent.keyCode;
            if ('F_SHOW' in window) {
                F_SHOW(KV);
            }
            if (KV == KEY_G_0) {
                if ('F_KEY_G_0' in window) {
                    F_KEY_G_0();
                }
            } else if (KV == KEY_G_1) {
                if ('F_KEY_G_1' in window) {
                    F_KEY_G_1();
                }
            } else if (KV == KEY_G_2) {
                if ('F_KEY_G_2' in window) {
                    F_KEY_G_2();
                }
            } else if (KV == KEY_G_3) {
                if ('F_KEY_G_3' in window) {
                    F_KEY_G_3();
                }
            } else if (KV == KEY_G_4) {
                if ('F_KEY_G_4' in window) {
                    F_KEY_G_4();
                }
            } else if (KV == KEY_G_5) {
                if ('F_KEY_G_5' in window) {
                    F_KEY_G_5();
                }
            } else if (KV == KEY_G_6) {
                if ('F_KEY_G_6' in window) {
                    F_KEY_G_6();
                }
            } else if (KV == KEY_G_7) {
                if ('F_KEY_G_7' in window) {
                    F_KEY_G_7();
                }
            } else if (KV == KEY_N_0) {
                if ('F_KEY_N_0' in window) {
                    F_KEY_N_0();
                }
            } else if (KV == KEY_N_1) {
                if ('F_KEY_N_1' in window) {
                    F_KEY_N_1();
                }
            } else if (KV == KEY_N_2) {
                if ('F_KEY_N_2' in window) {
                    F_KEY_N_2();
                }
            } else if (KV == KEY_N_3) {
                if ('F_KEY_N_3' in window) {
                    F_KEY_N_3();
                }
            } else if (KV == KEY_N_4) {
                if ('F_KEY_N_4' in window) {
                    F_KEY_N_4();
                }
            } else if (KV == KEY_N_5) {
                if ('F_KEY_N_5' in window) {
                    F_KEY_N_5();
                }
            } else if (KV == KEY_N_6) {
                if ('F_KEY_N_6' in window) {
                    F_KEY_N_6();
                }
            } else if (KV == KEY_N_7) {
                if ('F_KEY_N_7' in window) {
                    F_KEY_N_7();
                }
            } else if (KV == KEY_N_8) {
                if ('F_KEY_N_8' in window) {
                    F_KEY_N_8();
                }
            } else if (KV == KEY_N_9) {
                if ('F_KEY_N_9' in window) {
                    F_KEY_N_9();
                }
            } else if (KV == KEY_M_0) {
                if ('F_KEY_M_0' in window) {
                    F_KEY_M_0();
                }
            } //声音加
            else if (KV == KEY_M_1) {
                if ('F_KEY_M_1' in window) {
                    F_KEY_M_1();
                }
            } //声音减
            else if (KV == KEY_M_2) {
                if ('F_KEY_M_2' in window) {
                    F_KEY_M_2();
                }
            } //静音
            else if (KV == KEY_M_3) {
                if ('F_KEY_M_3' in window) {
                    F_KEY_M_3();
                }
            } //切换声道
            else if (KV == KEY_M_4) {
                if ('F_KEY_M_4' in window) {
                    F_KEY_M_4();
                }
            } else if (KV == KEY_M_5) {
                if ('F_KEY_M_5' in window) {
                    F_KEY_M_5();
                }
            } //快进
            else if (KV == KEY_M_6) {
                if ('F_KEY_M_6' in window) {
                    F_KEY_M_6();
                }
            } //快退
            else if (KV == KEY_M_7) {
                if ('F_KEY_M_7' in window) {
                    F_KEY_M_7();
                }
            } else if (KV == KEY_O_0) {
                if ('F_KEY_O_0' in window) {
                    F_KEY_O_0();
                }
            }
        };

        function _SELECT(_id) {
            return document.getElementById(_id);
        }
        var _BS = {};

        function init() {
            for (var i = 0; i < buttons.length; ++i) {
                var _b = buttons[i];
                this._BS[_b.id] = _b;
            }
            if (_BS[focus_id] != undefined && _SELECT(focus_id) != undefined) {
                _SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
                DOBUTTONFOCUSFUN(focus_id);
               
                _TF(focus_id, 1.1);
            }
        }

        function _H_F(_id) {
            if (_BS[focus_id] != undefined && _BS[_id] != undefined && _SELECT(focus_id) != undefined && _SELECT(_id) !=
                undefined) {
                if (focus_id.indexOf('bt_f') >= 0) {
                    _SELECT(focus_id).src = img1;
                } else {
                    _SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['blurImage'];
                }

                DOBUTTONBLURFUN(focus_id);
                //                var show_id=focus_id.replace('f','w');
                //                if(_SELECT(show_id)){_SELECT(show_id).className='';}
                focus_id = _id;
                if (focus_id.indexOf('bt_f') >= 0) {
                    _SELECT(focus_id).src = img2;
                } else {
                    _SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
                }
                DOBUTTONFOCUSFUN(focus_id);
                //                DOBUTTONFOCUSFUN(focus_id);show_id=focus_id.replace('f','w');_TF(show_id,1.1);
                _TF(focus_id, 1.1);
            }
        }

        function _TF(_t, _s) { //设置z-index
            var _f = _SELECT(_t);
            if (_s && _f) {
                _f.style.zIndex = 10;
            }
        }

        function DOBUTTONBLURFUN(_id) {
            if (_BS[_id] != undefined && _BS[_id]['blurFun'] != undefined && _BS[_id]['blurFun'] != '') {
                var _b = _BS[_id];
                var fun = _b['blurFun'];
                eval("(" + fun + ")")();
            }
        }

        function DOBUTTONFOCUSFUN(_id) {
            if (_BS[_id] != undefined && _BS[_id]['focusFun'] != undefined && _BS[_id]['focusFun'] != '') {
                var fun = _BS[_id]['focusFun'];
                eval("(" + fun + ")")();
            }
        }

        function DOBUTTONENTERFUN(_id) {
            if (_BS[_id] != undefined && _BS[_id]['enterFun'] != undefined && _BS[_id]['enterFun'] != '') {
                var _b = _BS[_id];
                var fun = _b['enterFun'];
                eval("(" + fun + ")")();
            }
        }


        var press_back = 0;

        function F_KEY_G_0() { //back
            press_back++;
            if (press_back == 2) {
                mp.resume();
                play_states = "play";
                _SELECT("play_pause").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                _SELECT("process_bar_id").style.display = "none";
                backPrograma();
            } else if (show_vs == 'yes') {
                press_back = 0;
                _SELECT("div_vs").style.display = "none";
                show_vs = 'no';
            } else {
                F_P_B1();
            }
        }

        function F_KEY_O_0() {
            press_back++;
            if (press_back == 2) {
                mp.resume();
                play_states = "play";
                _SELECT("play_pause").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                _SELECT("process_bar_id").style.display = "none";
                backPrograma();
            } else if (show_vs == 'yes') {
                _SELECT("div_vs").style.display = "none";
                show_vs = 'no';
            } else {
                F_P_B1();
            }
        }

        function F_P_B1() { //显示 再按一次退出播放 返回提示
            _SELECT("backTips").style.display = "block";
            setTimeout('F_P_B2()', 5000);
        }

        function F_P_B2() { //隐藏返回提示
            _SELECT("backTips").style.display = "none";
            press_back = 0;
        }

        function F_KEY_N_0() { //0
            backPrograma();
        }

        function F_KEY_G_2() {
            
        }

        function F_KEY_G_3() {
            
        }

        function F_PLAY_NEXT() {
           
        }


        function F_KEY_M_0() { //声音加
            F_M_0('+');
        }

        function F_KEY_M_1() { //声音减
            F_M_0('-');
        }

        function F_KEY_M_2() { //静音
        }

        function F_KEY_M_3() { //切换声道
        }

        function F_KEY_M_4() {
            F_KEY_G_1();
        }

        function F_KEY_M_5() { //快进
            _SELECT("div_vs").style.display = "none";
            F_M_1('F');
            watchFocus();
            return;
        }

        function F_KEY_M_6() { //快退
            _SELECT("div_vs").style.display = "none";
            F_M_1('R');
            watchFocus();
            return;
        }

        var timer = null;

        function F_KEY_G_1() { //确定
            if('<%=programType%>' == 'film'&&_SELECT("order_tips").style.display == "block"){
                order_soon();
                return;
            }
            if (show_vs == 'yes') { //剧集在显示
                DOBUTTONENTERFUN(focus_id);
            } else if (watch_time_show == 'no') { //继续播放 从头播放没有显示
                if (timer != null) clearTimeout(timer)
                  F_C_1(); //设置播放进程
                if (play_states == "play") {
                    mp.pause();
                    play_states = "pause";
                    playtime = (new Date().getTime() - start) + playtime;
                    _SELECT("process_bar_id").style.display = "block";
                    _SELECT("play_button").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/play-end.png";
                    watchFocus(); //当前播放提示
                    _SELECT("xj_tips").style.display = "none";
                    
                } else if (play_states == "pause") {
                    mp.resume(); //继续播放
                    play_states = "play";
                    start = new Date().getTime();

                    _SELECT("play_button").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/play-play.png";
                    timer = setTimeout(function () {
                        _SELECT("process_bar_id").style.display = "none";
                    }, 6000)

                  
                }
            }
        }

        function F_KEY_M_7() { //播放完的
            eval("oEvent = " + Utility.getEvent());
            switch (oEvent.type) {
                case 'EVENT_MEDIA_ERROR':
                case 'EVENT_MEDIA_END':
                    if ('full' == 'full') {
                        updateWatchRecord();
                        setTimeout('F_PLAY_NEXT()', 2000);

                    } else {
                    }
                    return;
                default:
                    return 1;
            }
        }

        function F_SHOW(kv) {
      
        }

        var watch_time_show = 'no';

        function F_KEY_G_4() { //左
            if (show_vs == 'yes') {
                if (focus_id == 'bt_f0' && page_now > 1) {
                    page_now--;
                    show_vs2 = 'yes2';
                    focus_id = 'bt_f' + (unit - 1);
                    F_KEY_G_7();
                } else {
                    _H_F(_BS[focus_id]['leftButtonId'])
                }
            } else if (watch_time_show == 'no') {
                F_M_1('R'); //快退
                return;
            }
        }

        function F_KEY_G_5() { //上
            F_KEY_G_7();
        }

        function F_KEY_G_6() { //右
            var i = parseInt(focus_id.replace('bt_f', ''));
            if (show_vs == 'yes' && (i + 1 == unit)) { //更多
                if ((page_now * unit) < dramasum) {
                    page_now++;
                    show_vs2 = 'yes2';
                    focus_id = 'bt_f0';
                    F_KEY_G_7();
                }
            } else if (show_vs == 'yes') {
                _H_F(_BS[focus_id]['rightButtonId']);
            } else if (watch_time_show == 'no') {
                F_M_1('F'); //快进
                return;
            }
        }

        var page_now = 1;
        var show_vs = 'no';
        var show_vs2 = 'no';
        var index_now = 0;
        var unit = '<%=programType%>' == 'arts' ? 4 : 13;
        var unitlen = '<%=programType%>' == 'arts' ? 278 : 80;
        var img1 = '<%=programType%>' == 'arts' ? 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-arts-b.png' : 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-dra-b.png';
        var img2 = '<%=programType%>' == 'arts' ? 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/v_farts.png' : 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-dra-f.png';
        var paixu = '<%=programType%>' == 'arts' ? (dramasum - cutdrama) : (cutdrama - 1);

        var dramas, dramares;

        function getDrama() {
            $.get(webset.api + 'video/drama.json?userid=' + userId + '&code=<%=code%>&cpCode=<%=cpcode%>', function (
                res) {
                var res = eval("(" + res + ")");
                if (res.response && res.response.responseHeader.code == 200) {
                    dramas = res.response.responseBody.dramas;
                    dramares = res.response.responseBody;
                    if (!dramasum) {
                        dramasum = parseInt(res.response.responseBody.dramaCount);
                    }
                }
            }, false);
        }

        function F_KEY_G_7() { //下 显示剧集
            _SELECT("xj_tips").style.display = "none";
            mp.resume(); //从当前媒体的暂停/快进/快退状 态恢复正常播放
            play_states = "play";
            _SELECT("process_bar_id").style.display = "none";
            if (show_vs2 == 'yes') {
                _SELECT("div_vs").style.display = "block";
                _SELECT("div_vs").style.top = 0;
                show_vs = 'yes';
            } else if ('<%=programType%>' != 'film') {
                paixu = '<%=programType%>' == 'arts' ? (dramasum - cutdrama) : (cutdrama - 1);
                if (show_vs2 != 'yes2') {
                    page_now = parseInt(paixu / unit) + 1;
                }
                var html =
                    "<div style='position:absolute;left:0px;top:645px;' ><img src='http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-dra-bg.png' width='1280px' height='65px'></div>";
                for (var i = 0; i < unit && ((page_now - 1) * unit + (i + 1)) <= dramasum; i++) {
                    if (paixu == ((page_now - 1) * unit + i)) {
                        index_now = i;
                    }
                    if ('<%=programType%>' == 'arts') {
                        var st = dramasum - i - 1 - unit * (page_now - 1)
                    } else {
                        var st = (page_now - 1) * unit + (i + 1);
                    }
                    var bt_w = "<div id='bt_w" + i + "' style='position:absolute; left:" + (20 + i * (unitlen + 8) + 5) +
                        "px;top:662px;width:" + (unitlen - 10) +
                        "px; height:40px; line-height:40px; text-align:center; font-size:28px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index: 20;overflow:hidden;'>" +
                        (('<%=programType%>' == 'arts') ? dramas[st].dramaTitle : st) + "</div>";
                    var bt_f = "<img id='bt_f" + i + "' src='" + img1 + "' style='position:absolute;left:" + (20 + i *
                        (unitlen + 8)) + "px;top:660px;width:" + unitlen + "px;height:40px;'/>";
                    html = html + bt_w + bt_f;
                }
                if ((page_now * unit) < dramasum) { //是否展示更多
                    var bt_w = "<div id='bt_w" + unit +
                        "' style='position:absolute; left:1164px;top:662px;width:80px; height:40px; line-height:40px; text-align:center; font-size:28px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index: 20;'>>></div>";
                    var bt_f = "<img id='bt_f" + unit + "' src='" + img1 + "' style='position:absolute;left:" + (20 +
                        unit * (unitlen + 8)) + "px;top:660px;width:" + unitlen + "px;height:40px;'/>";
                    html = html + bt_w + bt_f;
                }
                _SELECT("div_vs").style.display = "block";
                _SELECT("div_vs").innerHTML = html;
                if (show_vs2 != 'yes2') {
                    focus_id = 'bt_f' + index_now + '';
                }
                init();
                _H_F(focus_id);
                show_vs = 'yes';
                show_vs2 = 'yes';
            }
        }

        function resetdata(drama, url, id) {

            cutdrama = drama;
            playUrl = url;
            videoid = id;
            if ('<%=programType%>' == 'arts') {
                title = dramas[drama - 1].dramaTitle;
            } else {
                title = dramares.title + '第' + cutdrama + '集';
            }
            tvflag = true;
            _ut = 0;
            _SELECT('cuttitle').innerHTML = "当前播放：" + title;
            playtime = 0;
            mp = new MediaPlayer();
            nativePlayerInstanceID = mp.getNativePlayerInstanceID();
            mp.setAllowTrickmodeFlag(0); //设置是否允许trick操作。 0：允许 1：不允许
            mp.setVideoDisplayMode(1);//1：全屏显示
            mp.refreshVideoDisplay(); //刷新
            watch_time = 0;
            var mediaa = '[{mediaUrl:"' + playUrl +
                '",mediaCode: "vod1",mediaType:2,audioType:1,videoType:3,streamType:2,drmType:1,fingerPrint:1,copyProtection:0,allowTrickmode:1,startTime:0,endTime:0,entryID:"entry1"}]';
            mp.setSingleMedia(mediaa); //设置媒体播放器播放媒体内容
            mp.playFromStart();
            if (wint) {
                clearInterval(wint)
            }
            initwatch();
            watchFocus();
            flag = false;
            endflag=false;
            show_times = 0;
           clearInterval(playtime);
            playtime = setInterval(startplay, 1000)
        }

        function playdrama(i) {
            _SELECT("div_vs").style.display = "none";
            show_vs = 'no';
            show_vs2 = 'no';
            updateWatchRecord(); //提交当前播放时间
            F_M_10(); //停止播放
             //flag=true;
            if (urlarr[i].playurl) {
                resetdata(i, urlarr[i].playurl, urlarr[i].code)
            } else {
                $.get(webset.api + 'video/def.json?scode=' + dramas[i - 1].dramaId, function (res) {
                    var res = eval("(" + res + ")");
                    if (res && res.response.responseHeader && res.response.responseHeader.code == '200') {
                        resetdata(i, res.response.responseBody[0].url, res.response.responseBody[0].code);
                        urlarr.push({
                            i: {
                                playurl: res.response.responseBody[0].url,
                                code: res.response.responseBody[0].code
                            }
                        })
                    }
                }, false);
            }
            _SELECT("palyNextTips").style.display = "none";
        }

        function F_F_E() { //剧集enter
            var i = parseInt(focus_id.replace('bt_f', ''));
            var j = '<%=programType%>' == 'arts' ? (dramasum - (page_now - 1) * unit - i) : ((page_now - 1) * unit + i +1);
            if (i == unit) { //更多
                if ((page_now * unit) < dramasum) {
                    page_now++;
                    focus_id = 'bt_f0';
                    show_vs2 = 'yes2';
                    F_KEY_G_7();
                } else if (page_now > 1) {
                    page_now--;
                    focus_id = 'bt_f' + (unit - 1);
                    show_vs2 = 'yes2';
                    F_KEY_G_7();
                }
            } else {
                if (cutdrama == j) {
                    return;
                }
                playdrama(j)
            }
        }

        //不调用
        function F_YY_PLAY(arg) {

        }

        var _w_t;

        function F_WATCH_TIME2() { //上次观看到的地方
            mp.pause();
            _SELECT("watch_time").style.display = "block";
            _SELECT('prev_watch').innerHTML = '您上次观看到 ' + F_C_0(watch_time);
            watch_time_show = 'yes';
            _SELECT('a_f0').focus();
            _w_t = setInterval('WATCH_TIPS()', 1000);
        }

        var watch_tips = 6;

        function WATCH_TIPS() { //提示倒计时
            _SELECT('watch_tips').innerHTML = watch_tips + '秒后即将继续播放';
            watch_tips--;
            if (watch_tips == 0) {
                F_E_F0(); //隐藏继续播放 从头播放
            }
        }

        function F_E_F0() { //继续播放
            clearInterval(_w_t);
            _SELECT("watch_time").style.display = "none";
            mp.playByTime(1, watch_time, 1);
            watch_time_show = 'no';
        }

        function F_E_F1() { //从头播放
            clearInterval(_w_t);
            _SELECT("watch_time").style.display = "none";
           // mp.resume(); //开始播放
            mp.playFromStart(); //从头开始播放
            watch_time_show = 'no';
        }
        var video_name = '';

        function F_F_F() { //剧集focus
            if ('<%=programType%>' == 'arts') {
                video_name = _SELECT(focus_id.replace('f', 'w')).innerHTML;
                if (video_name.length > 10) {
                    _SELECT(focus_id.replace('f', 'w')).innerHTML = '<marquee direction="left">' + video_name +
                        "</marquee>";
                }
            }
        }

        function F_F_B() { //剧集blur
            if ('<%=programType%>' == 'arts') {
                _SELECT(focus_id.replace('f', 'w')).innerHTML = video_name;
            }
        }

        var buttons = [{
                id: 'bt_f0',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: '',
                rightButtonId: 'bt_f1',
                blurFun: 'F_F_B',
                focusFun: 'F_F_F',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f1',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f0',
                rightButtonId: 'bt_f2',
                blurFun: 'F_F_B',
                focusFun: 'F_F_F',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f2',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f1',
                rightButtonId: 'bt_f3',
                blurFun: 'F_F_B',
                focusFun: 'F_F_F',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f3',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f2',
                rightButtonId: 'bt_f4',
                blurFun: 'F_F_B',
                focusFun: 'F_F_F',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f4',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f3',
                rightButtonId: 'bt_f5',
                blurFun: 'F_F_B',
                focusFun: 'F_F_F',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f5',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f4',
                rightButtonId: 'bt_f6',
                blurFun: '',
                focusFun: '',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f6',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f5',
                rightButtonId: 'bt_f7',
                blurFun: '',
                focusFun: '',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f7',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f6',
                rightButtonId: 'bt_f8',
                blurFun: '',
                focusFun: '',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f8',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f7',
                rightButtonId: 'bt_f9',
                blurFun: '',
                focusFun: '',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f9',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f8',
                rightButtonId: 'bt_f10',
                blurFun: '',
                focusFun: '',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f10',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f9',
                rightButtonId: 'bt_f11',
                blurFun: '',
                focusFun: '',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f11',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f10',
                rightButtonId: 'bt_f12',
                blurFun: '',
                focusFun: '',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f12',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f11',
                rightButtonId: 'bt_f13',
                blurFun: '',
                focusFun: '',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            },
            {
                id: 'bt_f13',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f12',
                rightButtonId: '',
                blurFun: '',
                focusFun: '',
                enterFun: 'F_F_E',
                focusImage: 'window-dra-f.png',
                blurImage: 'window-dra-b.png'
            }
        ]

        //不调用
        function getVideoCharge() {
            return 'N';
        }

        function watchFocus() { //当前播放提示
            if ('full' != 'small') {
                _SELECT("videoNameTips").style.display = "block";
                vnt = setTimeout(function () {
                    _SELECT("videoNameTips").style.display = "none";
                }, 6000);
            }
        }

        function order_soon() { //立即订购
              TRY_WATCH(userId, '<%=id%>', '<%=programType%>', title, '<%=cpcode%>',returnUrl)
        }
        ////////////////////////////
        var seriesCp_name = new Array();
            var callback = function(intent){
                var _command = intent['_command'];
                if(_command=='_PLAY'){
                    var action= intent['_action'];
                    if (action == 'PLAY'){
                        mp.resume();
                        return;
                    } else if (action == 'PAUSE') {
                        mp.pause();
                        return;
                    } else if (action == 'RESUME') {
                        mp.resume();
                        return;
                    } else if (action == 'RESTART') {
                        var index = 1;
                        mp.playByTime(1,index,1);
                        return;
                    } else if (action == 'SEEK') {
                        var index = intent['position'];
                        mp.playByTime(1,index,1);
                        return;
                    } else if (action == 'FORWARD') {
                        var _index = intent['offset'];
                        var _play_point = parseInt(mp.getCurrentPlayTime(),10);
                        mp.playByTime(1,(_play_point+_index),1);
                        return;
                    } else if (action == 'BACKWARD') {
                        var _index = intent['offset'];
                        var _play_point = parseInt(mp.getCurrentPlayTime(),10);
                        mp.playByTime(1,(_play_point-_index),1);
                        return;
                    } else if (action == 'EXIT') {
                        backPrograma();
                        return;
                    } else if (action == 'INDEX') {
                        var index = intent['index'];
                        F_KEY_GO_PAGE(index);
                        return;
                    }
                } else if(_command=='_EPISODE'){
                    var action= intent['_action'];
                    if (action == 'PREV') {
                    cutdrama = '<%=programType%>' == 'arts' ?cutdrama+1: cutdrama-1;
                    playdrama(cutdrama);return;
                    } else if (action == 'NEXT') {
                      cutdrama = '<%=programType%>' == 'arts' ?cutdrama-1: cutdrama+1;
                      playdrama(cutdrama);return;
                    } else if (action == 'INDEX') {
                        if(cutdrama!=intent['index']||(cutdrama<=dramasum)){
                            cutdrama = intent['index'];
                            playdrama(cutdrama);return;
                         }
                    }
                }
                _H_F(_command);
                DOBUTTONENTERFUN(_command);
            }
            var listener = new Xiri.Listener(callback);
        function FYY(){
        var scene = {
        _scene: "com.iflytek.xiri.MGTV",
        _commands: {
        "_PLAY": ["$P(_PLAY)"],
        "_EPISODE": ["$P(_EPISODE)"],
        "test1": ["测试1"],
        "test2": ["测试2"]
        },
        _feedbacks: {
        "test1": '为你测试1',
        "test2": '为你测试2'
        }
        };
        listener.regist(scene);
        }
    </script>

    <meta name="GENERATOR" content="MSHTML 11.00.10570.1001">
</head>

<body bgcolor="transparent"  onload="init_mp();" onunload="F_M_10()">
    <div id="backTips" style="left: 0px; top: 660px; width: 1280px; height: 50px; text-align: center; display: none; position: absolute; opacity: 0.8; background-color: rgb(0, 0, 0);">
        <font style="text-align: center; color: rgb(255, 255, 255); font-size: 32px;">再按一次退出播放</font>
    </div>
    <div id="palyNextTips" style="left: 0px; top: 660px; width: 1280px; height: 50px;font-size: 32px; color:#fff; text-align: center; display: none; position: absolute; opacity: 0.8; background-color: rgb(0, 0, 0);"></div>
    <div id="videoNameTips" style="left: 0px;width: 1280px;height: 50px;text-align: center;margin-top: 0px;position: absolute;opacity: 0.8;background-color: rgb(0, 0, 0);/* display: none; */">
        <font style="text-align: center; color: rgb(255, 255, 255); font-size: 32px;" id="cuttitle">当前播放：
            <%=title%>
        </font>
    </div>
    <div id="div_volume" style="left: 580px; top: 320px; display: none; position: absolute; z-index: 300;">
        <img width="105" height="105" id="img_volume" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/voice_control5.png">
    </div>
    <img id="logo" style="left: 1110px; top: 2px; position: absolute;"
    src="http://apkpic.kanketv.com.ahct.lv1.vcache.cn/image/CPPhoto/<%=cpcode%>.png">
   
    <div id="process_bar_id" style="left: 0px; top: 30px; display: none; position: absolute;">
        <div id="pb_bg_id" style="left: 0px; top: 625px; position: absolute;">
            <img width="1280" height="65" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-process-bg.png"> </div>
        <div id="end_time_id" style="left: 1130px; top: 627px; width: 100px; height: 60px; text-align: left; color: rgb(255, 255, 255); font-size: 21px; position: absolute;">/00:00:00</div>
        <!--<div id="duration_bg_id" style="position:absolute;left:80px;top:660px;width:990px;height:10px;background-color:grey;"></div> -->

        <div id="played_id" style="left: 85px; top: 657px; width: 15px; height: 15px; position: absolute; background-color: rgb(38, 170, 212);"></div>
        <div id="show_time_id" style="left: 1030px; top: 627px; width: 100px; height: 60px; text-align: right; color: rgb(255, 255, 255); font-size: 21px; position: absolute;">00:00:00</div>
        <div id="play_icon_id" style="left: 15px; top: 631px; position: absolute;">
            <img id="play_button" style="width: 56px; height: 56px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/play-end.png">
        </div>
    </div>
    <div id="div_vs" style="left: 0px; top: 0px; position: absolute;display: none;">
    </div>
    <div id="watch_time" style="left: 320px; top: 130px; display: none; position: absolute;">
        <img style="left: 0px; top: 0px; width: 696px; height: 401px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-bg.png" border="0">
        <a id="a_f0" style="left: 6px; top: 8px; position: absolute;" onfocus="MM_swapImage('im_jx','','http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-watchbtn-f.png',1);"
            onblur="MM_swapImgRestore();" href="javascript:F_E_F0()">
            <img width="1" height="1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" border="0"> </a>
        <img id="im_jx" style="left: 90px; top: 60px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" border="0">
        <img style="left: 90px; top: 60px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-continue.png" border="0">
        <a id="a_f1" style="left: 206px; top: 8px; position: absolute;" onfocus="MM_swapImage('im_ct','','http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-watchbtn-f.png',1);"
            onblur="MM_swapImgRestore();" href="javascript:F_E_F1()">
            <img width="1" height="1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" border="0"> </a>
        <img id="im_ct" style="left: 360px; top: 60px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" border="0">
        <img style="left: 360px; top: 60px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-start.png" border="0">
        <div id="prev_watch" style="margin: 0px; padding: 0px; left: 160px; top: 260px; width: 370px; height: 156px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-size: 23px; font-weight: normal; position: absolute;"></div>
        <div id="watch_tips" style="margin: 0px; padding: 0px; left: 160px; top: 290px; width: 370px; height: 156px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-size: 23px; font-weight: normal; position: absolute;"></div>
    </div>
    <img width="178" height="178" id="play_pause" style="left: 550px; top: 271px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    <div id="test" style="left: 50px; top: 300px; color: rgb(255, 0, 0); font-size: 30px; position: absolute;"></div>
    <div id="test2" style="left: 50px; top: 350px; color: rgb(255, 0, 255); font-size: 30px; position: absolute;"></div>
    <div id="test3" style="left: 50px; top: 400px; color: rgb(255, 0, 255); font-size: 30px; position: absolute;"></div>
    <div id="test4" style="left: 50px; top: 450px; color: rgb(255, 0, 255); font-size: 30px; position: absolute;"></div>
    <img id="watchRecord" style="left: 1px; top: 1px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/record.png?action=watchRecord&amp;position=1&amp;record=yes&amp;t=1526117993783">
    <div id="xj_tips" style="left: 0px; top: 660px; width: 1280px; height: 50px; text-align: center; display: none; position: absolute; opacity: 0.8; background-color: rgb(0, 0, 0);">
        <font style="text-align: center; color: rgb(255, 255, 255); font-size: 32px;"></font>
    </div>
    <div id="order_tips" style="left: 0px; top: 563px; width: 1280px; display: none; position: absolute;">
        <a id="bt_ordertips" style="left: 6px; top: 8px; position: absolute;" href="javascript:;">
         <img width="1" height="1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" border="0"> </a>
        <img id="bt_ordertips_f" style="left: 730px; top: 85px; position: absolute; z-index: 10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-order-btn.png" border="0">
        <img width="1280" height="175" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/window-order-bg.png">
    </div>
    <div id="dd" style="display:none;left: 0px; top: 400px; position: absolute;width:600px;height:110px; word-wrap: break-word;background:#fff;color:red;font-size:16px;line-height:20px;"></div>
    <script type="text/javascript">

        if ('full' != 'small') {
            vnt = setTimeout(function () {
                _SELECT("videoNameTips").style.display = "none";
                
            }, 6000);
            var flag = false;
            function nextfun(){
                if ('<%=programType%>' == 'film' || (cutdrama == dramasum)) {
                    _SELECT("palyNextTips").innerHTML = "即将返回";
                    _SELECT("palyNextTips").style.display = "block";
                    setTimeout('backPrograma()', 3000);
                } else {
                    _SELECT("palyNextTips").innerHTML = "即将播放下一集";
                    _SELECT("palyNextTips").style.display = "block";
                    setTimeout(function(){
                     playdrama(cutdrama+1)
                    }, 3000);
                }
             }
        var backTime=30
        if ('<%=programType%>' == 'anime') {
          backTime=5
        }
            function jiancet(v){
               if(v){
                clearInterval(jiance)
                 if(flag){return}
                 nextfun()
               }else if(mp){

                var currentPlayTime = mp.getCurrentPlayTime();
                var total_times = mp.getMediaDuration();

                 if(total_times - currentPlayTime <=80&&total_times - currentPlayTime>backTime){
                    if(jiance){clearInterval(jiance)}
                    jiance = setInterval(jiancet, 2000)
                 }
                if ((total_times - currentPlayTime <= backTime) && !flag && total_times > 0||(currentPlayTime>total_times&&total_times==0)) {
                     if(endflag){return;}
                     endflag=true;
                    flag = true;
                     clearInterval(jiance)
                     nextfun()
                }
               }
            }
            var jiance;
            var playtime = setInterval(startplay, 1000);

            function startplay() {
                if (play_states == "play") {
                    var total_times = mp.getMediaDuration();
                    if (!total_times) {
                        return;
                    }
                    if(jiance){clearInterval(jiance)}
                    jiance = setInterval(jiancet, 10000)
                    _SELECT("play_button").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/play-play.png";
                    clearInterval(playtime);
                }
            }
        }
        var tryWatch = 420;
    
        FYY();
    </script>

</body>

</html>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.vstartek.epg.utils.HttpLinkUtils"%>
<%@page import="com.vstartek.epg.pojo.TopicSeries"%>
<%@page import="com.vstartek.epg.action.TopicAction"%>
<%@page import="com.vstartek.epg.pojo.SearchHistory"%>
<%@page import="com.vstartek.epg.action.UserAction"%>
<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%


	String programType=RequestUtil.getString("programType", request);
	String back=RequestUtil.getString("back", request);
	long id=RequestUtil.getInt("id", request);
	if(id==0){
	    response.sendRedirect("error404.jsp");
	    return;
	}
	List<TopicSeries> list= TopicAction.getTopicSeries(id, programType);
	
	String focus_id=RequestUtil.getString("focus_id", request);
	String programa_id=RequestUtil.getString("programa_id", request);
	String perv_num=RequestUtil.getString("perv_num", request);
	int perv_count=RequestUtil.getInt("perv_count", request);
	String pf_focus_id=RequestUtil.getString("pf_focus_id", request);

	String home_focus_id=RequestUtil.getString("home_focus_id", request);
	String home_from=RequestUtil.getString("home_from", request);
	
	String backUrl=RequestUtil.getString("backUrl", request);//接受backUrl
	String backUrl_encode=URLEncoder.encode(backUrl,"UTF-8");
	
	String pervUrl="&back=special_01&focus_id="+focus_id+"&programa_id="+programa_id+"&perv_num="+perv_num+"&perv_count="+(perv_count+1)+"&pf_focus_id="+pf_focus_id+"&home_focus_id="+home_focus_id+"&home_from="+home_from+"&backUrl="+backUrl_encode;
	
	String from=RequestUtil.getString("from", request);
	
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta content="IE=5.0000" http-equiv="X-UA-Compatible">
    <meta name="page-view-size" content="1280*720">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>专题01</title>
    <script src="config/config.js"></script>
    <script type="text/javascript" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/ajax.min.js"></script>
    <script type="text/javascript" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/public.js"></script>
    <script type="text/javascript" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/jquery.min.js"></script>
    <style type="text/css">
        .move_location_right {
            transform: translate(164px, 0);
            -ms-transform: translate(164px, 0);
            -webkit-transform: translate(164px, 0);
            -o-transform: translate(164px, 0);
            -moz-transform: translate(164px, 0)
        }

        .move_location_left {
            transform: translate(-164px, 0);
            -ms-transform: translate(-164px, 0);
            -webkit-transform: translate(-164px, 0);
            -o-transform: translate(-164px, 0);
            -moz-transform: translate(-164px, 0)
        }

        .img_move {
            transition: left .5s linear;
            -webkit-transition: left .5s linear;
            -moz-transition: left .5s linear;
            -o-transition: left .5s linear
        }

        @keyframes myfirst {
            from {
                left: red
            }
            to {
                background: yellow
            }
        }

        @-moz-keyframes myfirst {
            from {
                background: red
            }
            to {
                background: yellow
            }
        }

        @-webkit-keyframes myfirst {
            from {
                background: red
            }
            to {
                background: yellow
            }
        }

        @-o-keyframes myfirst {
            from {
                background: red
            }
            to {
                background: yellow
            }
        }

        .movetran {
            animation: myfirst 5s;
            -moz-animation: myfirst 5s;
            -webkit-animation: myfirst 5s;
            -o-animation: myfirst 5s
        }
    </style>
    <script type="text/javascript">
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
            } else if (KV == KEY_M_1) {
                if ('F_KEY_M_1' in window) {
                    F_KEY_M_1();
                }
            } else if (KV == KEY_M_2) {
                if ('F_KEY_M_2' in window) {
                    F_KEY_M_2();
                }
            } else if (KV == KEY_M_3) {
                if ('F_KEY_M_3' in window) {
                    F_KEY_M_3();
                }
            } else if (KV == KEY_M_4) {
                if ('F_KEY_M_4' in window) {
                    F_KEY_M_4();
                }
            } else if (KV == KEY_M_5) {
                if ('F_KEY_M_5' in window) {
                    F_KEY_M_5();
                }
            } else if (KV == KEY_M_6) {
                if ('F_KEY_M_6' in window) {
                    F_KEY_M_6();
                }
            } else if (KV == KEY_M_7) {
                if ('F_KEY_M_7' in window) {
                    F_KEY_M_7();
                }
            } else if (KV == KEY_O_0) {
                if ('F_KEY_O_0' in window) {
                    F_KEY_O_0();
                }
            }
        };


        var _BS = {};

        function init() {
            for (var i = 0; i < buttons.length; ++i) {
                var _b = buttons[i];
                this._BS[_b.id] = _b;
            }
            if (_BS[focus_id] != undefined && _SELECT(focus_id) != undefined) {
                //_SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
                if (_BS[focus_id]['focusImage'] != 'Pixel.png') {
                    _SELECT("DIV_F").className = 'WTD';
                    _SELECT("DIV_F").style.left = $("#" + focus_id + "").offset().left;
                    _SELECT("DIV_F").style.top = $("#" + focus_id + "").offset().top;
                    if (parseInt(_SELECT(focus_id).style.height) > 0) {
                        _SELECT("IMG_F").style.height = _SELECT(focus_id).style.height;
                    } else {
                        _SELECT("IMG_F").style.height = '';
                    }
                    if (parseInt(_SELECT(focus_id).style.width) > 0) {
                        _SELECT("IMG_F").style.width = _SELECT(focus_id).style.width;
                    } else {
                        _SELECT("IMG_F").style.width = '';
                    }
                    //_SELECT("IMG_F").src ='http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'+_BS[focus_id]['focusImage'];
                }
                DOBUTTONFOCUSFUN(focus_id);
                var show_id = focus_id.replace('f', 's');
                _TF(show_id, 1.1);
                _TF(focus_id, 1.1);
                _SH(show_id);
            }
        }

        function _H_F(_id) {
            if (_BS[focus_id] != undefined && _BS[_id] != undefined && _SELECT(focus_id) != undefined && _SELECT(_id) !=
                undefined) {
                if (_id.indexOf('bt_f') >= 0) {
                    var _p_div = _id.replace('bt', 'div');
                    if (_SELECT(_p_div).style.display == 'none') {
                        return;
                    }
                }

                //_SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['blurImage'];
                DOBUTTONBLURFUN(focus_id);
                var show_id = focus_id.replace('f', 's');
                if (_SELECT(show_id)) {
                    _SELECT(show_id).className = '';
                }
                focus_id = _id;
                /////////////////////////////////////////////////
                _SELECT("DIV_F").className = '';
                var _F_I_SR = _SELECT("IMG_F").src;
                _F_I_SR = _F_I_SR.substring(_F_I_SR.indexOf('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'));
                var _F_I_SR2 = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
                if (_F_I_SR != _F_I_SR2) {
                    _SELECT("IMG_F").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png';
                }
                if (_BS[focus_id]['focusImage'] != 'Pixel.png') {
                    var _f_h_ = parseInt(_SELECT(focus_id).style.height);
                    var _f_w_ = parseInt(_SELECT(focus_id).style.width);
                    var _fi_h_ = parseInt(_SELECT("IMG_F").style.height);
                    var _fi_w_ = parseInt(_SELECT("IMG_F").style.width);
                    if (_f_h_ == _fi_h_ && _f_w_ == _fi_w_) {
                        //  _SELECT("DIV_F").className = 'WTD';
                    }
                    if ((focus_id.indexOf('bt_sf') >= 0 || focus_id.indexOf('bt_f') >= 0 || focus_id.indexOf('bt_if') >=
                            0 ||
                            focus_id.indexOf('bt_hf') >= 0 || focus_id.indexOf('bt_hi') >= 0 || focus_id.indexOf(
                                'bt_clear') >= 0 ||
                            focus_id.indexOf('bt_delete') >= 0 || focus_id.indexOf('bt_js') >= 0) && _f_h_ == _fi_h_ &&
                        _f_w_ == _fi_w_) {
                        _SELECT("DIV_F").className = 'WTD';
                    }
                    if (parseInt(_SELECT(focus_id).style.height) > 0) {
                        _SELECT("IMG_F").style.height = _SELECT(focus_id).style.height;
                    } else {
                        _SELECT("IMG_F").style.height = '';
                    }
                    if (parseInt(_SELECT(focus_id).style.width) > 0) {
                        _SELECT("IMG_F").style.width = _SELECT(focus_id).style.width;
                    } else {
                        _SELECT("IMG_F").style.width = '';
                    }
                    _SELECT("DIV_F").style.zIndex = 11;
                    _SELECT("DIV_F").style.left = $("#" + focus_id + "").offset().left;
                    _SELECT("DIV_F").style.top = $("#" + focus_id + "").offset().top;
                    if (_F_I_SR != _F_I_SR2) {
                        //_SELECT("IMG_F").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
                    } else {}
                }
                ////////////////////////////////////////////////////////////////////
                DOBUTTONFOCUSFUN(focus_id);
                show_id = focus_id.replace('f', 's');
                _TF(show_id, 1.1);
                _TF(focus_id, 1.1);
                _SH(show_id);
            }
        }

        function _TF(_t, _s) {
            var _f = _SELECT(_t);
            if (_s && _f) {
                _f.style.zIndex = 10;
            }
        }

        function _SH(_t) {
            var _f = _SELECT(_t);
            if (_f) {}
        }

        function F_KEY_G_4() {
            if (_BS[focus_id] != undefined && _BS[focus_id]['leftButtonId'] != '') {
                var show_id = focus_id.replace('f', 's');
                _TF(show_id, 1.0);
                _TF(focus_id, 1.0);
                _H_F(_BS[focus_id]['leftButtonId']);
            }
            return;
        }

        function F_KEY_G_5() {
            if (_BS[focus_id] != undefined && _BS[focus_id]['upButtonId'] != '') {
                var show_id = focus_id.replace('f', 's');
                _TF(show_id, 1.0);
                _TF(focus_id, 1.0);
                _H_F(_BS[focus_id]['upButtonId']);
            }
            return;
        }

        function F_KEY_G_6() {
            if (_BS[focus_id] != undefined && _BS[focus_id]['rightButtonId'] != '') {
                var show_id = focus_id.replace('f', 's');
                _TF(show_id, 1.0);
                _TF(focus_id, 1.0);
                _H_F(_BS[focus_id]['rightButtonId'])
            };
            return;
        }

        function F_KEY_G_7() {
            if (_BS[focus_id] != undefined && _BS[focus_id]['downButtonId'] != '') {
                var show_id = focus_id.replace('f', 's');
                _TF(show_id, 1.0);
                _TF(focus_id, 1.0);
                _H_F(_BS[focus_id]['downButtonId'])
            };
            return;
        }

        function DOBUTTONBLURFUN(_id) {
            if (_BS[_id] != undefined && _BS[_id]['blurFun'] != undefined && _BS[_id]['blurFun'] != '') {
                var _b = _BS[_id];
                var fun = _b['blurFun'];
                eval("(" + fun + ")");
            }
        }

        function DOBUTTONFOCUSFUN(_id) {
            if (_BS[_id] != undefined && _BS[_id]['focusFun'] != undefined && _BS[_id]['focusFun'] != '') {
                var _b = _BS[_id];
                var fun = _b['focusFun'];
                eval("(" + fun + ")");
            }
        }

        function DOBUTTONENTERFUN(_id) {
            if (_BS[_id] != undefined && _BS[_id]['enterFun'] != undefined && _BS[_id]['enterFun'] != '') {
                var _b = _BS[_id];
                var fun = _b['enterFun'];
                eval("(" + fun + ")");
            }
        }
        //    jsp修改
        var arr = [
        <%
        	for(int i=0;i<list.size();i++){
        		TopicSeries topicSeries=list.get(i);
        %>
        {
            "focusImage": "<%=topicSeries.getPosterUrl3()%>", //焦点高亮小图
            "seriesCp_cpCode": "<%=topicSeries.getCpCode()%>",
            "templateBg": "",
            "seriesCp_id": "<%=topicSeries.getCode()%>",
            "showImage": "<%=topicSeries.getPosterUrl1()%>", //未选中默认小图
            "posterImage": "<%=topicSeries.getPosterUrl2()%>", //大海报背景图片
            "id": "<%=topicSeries.getId()%>",
            "title":"<%=topicSeries.getTitle()%>"
        }
        <%
	        	if(list.size()-1!=i){
	        		out.write(",");
	        	}
        	}
        %>];
        $.ajaxSetup({
            async: false
        });
        var buttons = [{
                id: 'item_focus_01',
                upButtonId: '',
                downButtonId: '',
                rightButtonId: 'item_focus_02',
                leftButtonId: 'transfer_left',
                blurFun: 'hideInfo(1)',
                focusFun: 'showInfo(1)',
                enterFun: 'watchVideo(1)',
                focusImage: 'Pixel.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'item_focus_02',
                upButtonId: '',
                downButtonId: '',
                rightButtonId: 'item_focus_03',
                leftButtonId: 'item_focus_01',
                blurFun: 'hideInfo(2)',
                focusFun: 'showInfo(2)',
                enterFun: 'watchVideo(2)',
                focusImage: 'Pixel.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'item_focus_03',
                upButtonId: '',
                downButtonId: '',
                rightButtonId: 'item_focus_04',
                leftButtonId: 'item_focus_02',
                blurFun: 'hideInfo(3)',
                focusFun: 'showInfo(3)',
                enterFun: 'watchVideo(3)',
                focusImage: 'Pixel.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'item_focus_04',
                upButtonId: '',
                downButtonId: '',
                rightButtonId: 'transfer_right',
                leftButtonId: 'item_focus_03',
                blurFun: 'hideInfo(4)',
                focusFun: 'showInfo(4)',
                enterFun: 'watchVideo(4)',
                focusImage: 'Pixel.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'transfer_left',
                upButtonId: '',
                downButtonId: '',
                rightButtonId: 'item_focus_02',
                leftButtonId: 'transfer_left',
                blurFun: '',
                focusFun: 'go_left()',
                enterFun: '',
                focusImage: 'Pixel.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'transfer_right',
                upButtonId: '',
                downButtonId: '',
                rightButtonId: 'transfer_right',
                leftButtonId: 'item_focus_04',
                blurFun: '',
                focusFun: 'go_right()',
                enterFun: '',
                focusImage: 'Pixel.png',
                blurImage: 'Pixel.png'
            }

        ]
        ////////////////////////////////////////////////////////////////////
        Array.prototype.contains = function (needle) {
            for (i in this) {
                if (this[i] == needle) return true;
            }
            return false;
        }
		
        var from='<%=from%>';
        var back='<%=back%>';

        function F_KEY_G_0() {
        	if(from==''){
        		if(back.indexOf("animation_")!=-1){
					window.location.href = back+".jsp?programType=<%=programType+pervUrl%>"; //区分列表和首页
				}else{
					window.location.href = "list.jsp?programType=<%=programType+pervUrl%>"; //jsp修改返回列表参数
				}
        	}else{
        		Utility.setValueByName("exitIptvApp");
        	}
            
        }

        function F_KEY_N_0() {
            F_KEY_G_0();
        }
        var focus_id = 'item_focus_01';

        function F_KEY_G_1() {
            DOBUTTONENTERFUN(focus_id);
        }
        var order = 1;

        function go_left() {
            var json = arr.pop();
            arr.unshift(json);
            foreach(arr, "left");
            _H_F("item_focus_01");
        }

        function go_right() {
            var json = arr.shift();
            arr.push(json);
            foreach(arr, "right");
            _H_F("item_focus_04");


        }

        function showInfo(seq) {
            $("#im_b").attr("src", arr[seq].posterImage);
            $("#item_show_0" + seq).attr("src", arr[seq].focusImage);
            $("#item_focus_0" + seq).show();
        }

        function hideInfo(seq) {
            $("#item_show_0" + seq).attr("src", arr[seq].showImage);
            $("#item_focus_0" + seq).hide();
        }

        function foreach(arr, sign) {
            var arrLocaltion = [-79, 84, 247, 410, 573, 736];
            $("[id^='item_show_0']").css("z-index", "3");
            arr.forEach(function (item, index) {
                if (index < 6) {
                    var a = index;
                    $("#item_show_0" + a).attr("src", arr[index].showImage);
                    if (sign == "left") {
                        index==arr.length-1?index=0:index
                        $("#item_show_0" + a).attr("src",arr[index+1].showImage);
                        var left = $("#item_show_0" + a).offset().left;
                        if (arrLocaltion.contains(left)) {
                            if (left > 574) {
                                left = -79 - 80;
                            } else {
                                left = left + 163 - 80;
                            }
                            $("#item_show_0" + a).css("left", left + "px");
                        }
                        if (a == 1) {
                            $("#im_b").attr("src", arr[index].posterImage);
                        }
                        setTimeout(function () {

                        })

                    }
                    if (sign == "right") {
                        if (index > 0) {
                            $("#item_show_0" + a).attr("src", 
                                arr[index - 1].showImage);
                        }

                        var left = $("#item_show_0" + a).offset().left;
                        if (arrLocaltion.contains(left)) {
                            if (left < 83) {
                                left = 736 - 80;
                            } else {
                                left = left - 163 - 80;
                            }
                            $("#item_show_0" + a).css("left", left + "px");

                        }

                        if (a == 4) {
                            $("#im_b").attr("src", arr[index].posterImage);
                        }
                        setTimeout(function () {

                        }, 100)
                    }


                }
            });
            replaceId(sign);
        }

        function replaceId(sign) {
         
            $("[style*='left: -159px;']").attr("id", "item_show_00");
            $("[style*='left: 4px;']").attr("id", "item_show_01");
            $("[style*='left: 167px;']").attr("id", "item_show_02");
            $("[style*='left: 330px;']").attr("id", "item_show_03");
            $("[style*='left: 493px;']").attr("id", "item_show_04");
            $("[style*='left: 656px;']").attr("id", "item_show_05");
            if (sign == "right") {
                $("#item_show_05").css("z-index", "1");
                setTimeout(function () {
                    $("#item_show_00").css("z-index", "1");
                }, 1000)
            } else if (sign == "left") {
                $("#item_show_00").css("z-index", "1");
                setTimeout(function () {
                    $("#item_show_05").css("z-index", "1");
                }, 1000)
            } else {
                $("#item_show_05").css("z-index", "1");
                $("#item_show_00").css("z-index", "1");
            }


        }

        function replace() {
            var json = arr.pop();
            arr.unshift(json);
        }
        $(function () {
            var i = 0;
            var str = '';
            var index = focus_id.substring(focus_id.length - 1, focus_id.length) - 1;
            index = index + 1;
            if (str.length > 2) {
                while (arr[index].seriesCp_id != str && i < 10) {
                    replace();
                    i++;
                }
            }
            foreachStart(arr);

        })

        function foreachStart(arr) {
            arr.forEach(function (item, index) {
                if (index < 6) {
                    var a = index;

                    $("#item_show_0" + a).attr("src", arr[index].showImage);


                }
            });
        }

        //播放
        function watchVideo(index) {
            var _cpcode = arr[index].seriesCp_cpCode;
            var _code = arr[index].seriesCp_id;
            var _id = arr[index].id;
            var _programType='<%=programType%>';
            var _programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
            
            <%
    		String _stat="影视聚合-"+HttpLinkUtils.getProgramType_ZH(programType);
    	    if("fd6cc3669a190ab7ac6c8150b6997749".equals(programa_id)||"animation_index".equals(back)){
    	    	_stat+="-热门专题";
    		}else {
    			_stat+="-专题列表";
    		}
	    		_stat+="-";
	    	%>
	    	var _stat="<%=_stat %>"+arr[index].title;
	    	setTimeout("_STAT('"+_stat+"')", 1);

            commen_play(_id,_programType,_programType2,_code,_cpcode,'<%=pervUrl%>');
            
            
        }
    </script>
</head>

<body onload="init()" style="overflow:hidden;background-repeat:no-repeat;">
    <!-- 默认大海报背景jsp修改 -->
    <%
    	if(list.size()>0){
    		TopicSeries topicSeries=list.get(1);
    %>
    <img id="im_b" src="<%=topicSeries.getPosterUrl2() %>" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;z-index:2">
    <%} %>
    <!-- 光标 -->
    
    <!-- 海报光标()-->
    <img id="item_focus_01" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute; left: 105px; top: 425px; z-index: 10;">
    <img id="item_focus_02" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="display:none;position:absolute;left:321px; top:425px;z-index:3">
    <img id="item_focus_03" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="display:none;position:absolute;left:535px; top:425px;z-index:3">
    <img id="item_focus_04" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="display:none;position:absolute;left:752px; top:425px;z-index:3">

    <!-- 海报小图(入口图)jsp修改 -->
    <div style="position:absolute;left:80px;top:545px;width:655px;height:115px;z-index:4;overflow:hidden;">
    	<%
    		for(int i=0;i<list.size();i++){
    			TopicSeries topicSeries=list.get(i);
    			int left=i*163-159;
   
    	%>
        <img id="item_show_0<%=i %>" src="<%=topicSeries.getPosterUrl3() %>" class="img_move" style="position:absolute;left:<%=left%>px; top:0px;width:156px;height:115px;z-index:2">
        <%
        	}
    	%>
    </div>

    <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/specail-02-left.png" style="position:absolute;left:25px; top:574px;width:52px;height:66px;z-index:2">
    <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/specail-02-right.png" style="position:absolute;left:740px; top:574px;width:52px;height:66px;z-index:2">




    <!-- 过渡id -->
    <img id="transfer_left" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    <img id="transfer_right" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">

    <div id="DIV_F" style="position:absolute;left:0px;top:0px;z-index:15">
        <img id="IMG_F" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
    <img id="visitRecord" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/record.png" style="position: absolute;left:1px;top:1px" width="0" height="0">
    <div id="test" style="position: absolute;left:20px;top:300px;font-size:30px;color:#FF0000;"><img id="stat" style="left: 1px; top: 1px; position: absolute;" src=""> </div>
    <script type="text/javascript">
    function _STAT(_stat) { //用户点击行为上报
	    _stat = encodeURI(encodeURI(_stat));
	    var _url = 'http://sta.jisu8.cn/stat?category=' + _stat +'&contid=&style=&label=&id=6955&action=click&account='+userId+'&plat=&vlauncher=&vterminal=';
	    _SELECT('stat').src = _url;
    }   
    </script>
</body>

</html>
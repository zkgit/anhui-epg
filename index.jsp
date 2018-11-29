<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%
	String home_focus_id=RequestUtil.getString("home_focus_id", request);
	if("".equals(home_focus_id)){
		home_focus_id="bt_f0";
	}
	String backUrl=RequestUtil.getString("backUrl", request);
	String backUrl_encode=URLEncoder.encode(backUrl,"UTF-8");
%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>Welcome</title>
	<script type="text/javascript" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/public_0718.js?v=0718"></script>
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
		// 测试添加
		var _test_i = 1;
		var _test_i_i = 1;
		function F_KEY_N_6(){
			_test_i++
			if(_test_i==6){
				window.location.href = "TEST_F_T_A_C_D.html";
// 				window.location.href = "http://arts.itvengine.com.lv1.vcache.cn/itv-epg/index_zq.jsp";
			}
		}
		function F_KEY_N_7(){
			_test_i_i++
			if(_test_i_i==6){
				window.location.href = "http://epgpic.itvengine.com.lv1.vcache.cn/itv-epg-test/index.jsp?backUrl=https%3a%2f%2fitv.etao189.com%2fthemeview%2fview.jhtml%3fthemeId%3d951";
			}
		}
		
		function F_KEY_N_8(){
			window.location.href = "http://ando.itvengine.com.lv1.vcache.cn/itv-epg/detail_anime1.jsp?id=279558&programType=anime&code=91030001000000010000000000129356&cpcode=mgtv&from=zhuoying&time=<%=System.currentTimeMillis()%>";
		}


		var _BS = {};

		function init() {
			for (var i = 0; i < buttons.length; ++i) {
				var _b = buttons[i];
				this._BS[_b.id] = _b;
			}
			if (_BS[focus_id] != undefined && _SELECT(focus_id) != undefined) {
				if (focus_id.indexOf('bt_f') >= 0) {
					_TF('DIV_F', 1.05);
					var show_id = focus_id.replace('f', 's');
					_TF(show_id, 1.05);
				}
				if (_BS[focus_id]['focusImage'] != 'Pixel.png') {
					_SELECT("DIV_F").style.zIndex = 11;
					_SELECT("IMG_F").style.height = _SELECT(focus_id).style.height;
					_SELECT("IMG_F").style.width = _SELECT(focus_id).style.width;
					var gb = _SELECT(focus_id);
					_SELECT("DIV_F").style.left = gb.getBoundingClientRect().left + "px";
					_SELECT("DIV_F").style.top = gb.getBoundingClientRect().top + "px";
					_SELECT("IMG_F").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
				}
				DOBUTTONFOCUSFUN(focus_id);
			}
		}

		function S_F(_id) {
			if (_BS[focus_id] != undefined && _BS[_id] != undefined && _SELECT(focus_id) != undefined && _SELECT(_id) !=
				undefined) {
				if (_id.indexOf('bt_f') >= 0) {
					var _p_div = _id.replace('bt', 'div');
					if (_SELECT(_p_div).style.display == 'none') {
						return;
					}
				} else if (_id.indexOf('bt_js') >= 0) {
					var _p_div = _id.replace('js', 'div');
					if (_SELECT(_p_div).style.display == 'none') {
						return;
					}
				}

				DOBUTTONBLURFUN(focus_id);
				if (focus_id.indexOf('bt_f') >= 0) {
					var show_id = focus_id.replace('f', 's');
					var black_id = focus_id.replace('f', 'bg');
					var jb_id = focus_id.replace('f', 'jb');
					_TF(show_id, 1.0);
					_TF(black_id, 1.0);
					_FD(jb_id, 1.0, 1.0);
				}
				focus_id = _id;
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
					if (_F_I_SR != _F_I_SR2) {
						_SELECT("IMG_F").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
					} else {}
					if (focus_id.indexOf('bt_f') >= 0) {
						_TF('DIV_F', 1.05);
						var show_id = focus_id.replace('f', 's');
						var black_id = focus_id.replace('f', 'bg');
						var jb_id = focus_id.replace('f', 'jb');
						_TF(show_id, 1.05);
						_TF(black_id, 1.1);
						_FD(jb_id, 1.3, 1.4);
					}
					_SELECT("DIV_F").style.zIndex = 11;
					var gb = _SELECT(focus_id);
					_SELECT("DIV_F").style.left = gb.getBoundingClientRect().left + "px";
					_SELECT("DIV_F").style.top = gb.getBoundingClientRect().top + "px";
				}

				DOBUTTONFOCUSFUN(focus_id);
				show_id = focus_id.replace('f', 's');
			}
		}

		function _FD(_t, _s, y) {
			var _f = _SELECT(_t);
			if (_s && _f) {
				_f.style.zIndex = 10;
				_f.style.transform = "scale(" + _s + "," + y + ")";
				_f.style.webkitTransform = "scale(" + _s + "," + y + ")";
			}
		}

		function _TF(_t, _s) {
			var _f = _SELECT(_t);
			if (_s && _f) {
				_f.style.zIndex = 10;
				_f.style.transform = "scale(" + _s + ")";
				_f.style.webkitTransform = "scale(" + _s + ")";
			}
		}

		function _SH(_t) {
			var _f = _SELECT(_t);
			if (_f) {}
		}

		function F_KEY_G_4() {
			if (_BS[focus_id] != undefined && _BS[focus_id]['leftButtonId'] != '') {
				S_F(_BS[focus_id]['leftButtonId']);
			}
			return;
		}

		function F_KEY_G_5() {
			if (_BS[focus_id] != undefined && _BS[focus_id]['upButtonId'] != '') {
				S_F(_BS[focus_id]['upButtonId']);
			}
			return;
		}

		function F_KEY_G_6() {
			if (_BS[focus_id] != undefined && _BS[focus_id]['rightButtonId'] != '') {
				S_F(_BS[focus_id]['rightButtonId'])
			};
			return;
		}

		function F_KEY_G_7() {
			if (_BS[focus_id] != undefined && _BS[focus_id]['downButtonId'] != '') {
				S_F(_BS[focus_id]['downButtonId'])
			};
			return;
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
				var _b = _BS[_id];
				var fun = _b['focusFun'];
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

		function F_KEY_G_0() {
			<%
				String txt="";
				if(backUrl.equals("")){
					txt="Utility.setValueByName(\"exitIptvApp\");";
				}else{
					txt="window.location.href = \""+URLDecoder.decode(backUrl,"UTF-8")+"\"";
				}
			%>
			<%=txt%>
			// window.location.href = "index.jsp"//测试
		}

		var buttons = [{
				id: 'bt_sz',
				upButtonId: '',
				downButtonId: 'bt_f0',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_SZ',
				focusImage: 'hyb_sz_f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f0',
				upButtonId: 'bt_f0',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: 'bt_f1',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_TV',
				focusImage: 'hy-home-f1.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f1',
				upButtonId: 'bt_f1',
				downButtonId: 'bt_f3',
				leftButtonId: 'bt_f0',
				rightButtonId: 'bt_f2',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_film',
				focusImage: 'hy-home-f2.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f2',
				upButtonId: 'bt_f2',
				downButtonId: 'bt_f4',
				leftButtonId: 'bt_f1',
				rightButtonId: '',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_ANIME',
				focusImage: 'hy-home-f2.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f3',
				upButtonId: 'bt_f1',
				downButtonId: '',
				leftButtonId: 'bt_f0',
				rightButtonId: 'bt_f4',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_ARTS',
				focusImage: 'hy-home-f2.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f4',
				upButtonId: 'bt_f2',
				downButtonId: '',
				leftButtonId: 'bt_f3',
				rightButtonId: '',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_DOCUMENTARY',
				focusImage: 'hy-home-f2.png',
				blurImage: 'Pixel.png'
			}
		]

		function TO_TV() {
			window.location.href = "http://tv.itvengine.com.lv1.vcache.cn/itv-epg/list.jsp?programType=tv&home_focus_id=" + focus_id+"&backUrl=<%=backUrl_encode %>";
		}

		function TO_film() {
			window.location.href = "http://film.itvengine.com.lv1.vcache.cn/itv-epg/list.jsp?programType=film&home_focus_id=" + focus_id+"&backUrl=<%=backUrl_encode %>";
		}

		function TO_ANIME() {
			window.location.href = "http://ando.itvengine.com.lv1.vcache.cn/itv-epg/animation_index.jsp?programType=anime&home_focus_id=" + focus_id+"&backUrl=<%=backUrl_encode%>";
		}

		function TO_ARTS() {
			window.location.href = "http://arts.itvengine.com.lv1.vcache.cn/itv-epg/list.jsp?programType=arts&home_focus_id=" + focus_id+"&backUrl=<%=backUrl_encode%>";
		}

		function TO_DOCUMENTARY() {
			window.location.href = "http://ando.itvengine.com.lv1.vcache.cn/itv-epg/list.jsp?programType=documentary&home_focus_id=" + focus_id+"&backUrl=<%=backUrl_encode%>";
		}

		function F_SZ() {
		
		}

		var focus_id = '<%=home_focus_id%>'; //jsp绑定默认为bt_f0,取home_focus_id

		function F_KEY_G_1() {
			DOBUTTONENTERFUN(focus_id);
		}
	</script>
</head>

<body onload="init()">
	<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/hy-home-bg.jpg" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;">
	<div id="DIV_F" style="position: absolute; left: 801px; top: 180px; z-index: 11 ; transform: scale(1.05);">
		<img style="height: 230px; width: 372px;" id="IMG_F" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
	</div>

	<div id="div_f0" style="position:absolute;left:122px;top:194px;">
		<img id="bt_f0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-13px;top:-12px;;width:365px;height:438px;">
		<img id="bt_s0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/hy-home-tv.png" style="position: absolute; left: 0px; top: 0px; width: 337px; height: 410px; z-index: 10; transform: scale(1);">
	</div>
	<div id="div_f1" style="position:absolute;left:470px;top:192px;">
		<img id="bt_f1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-17px;top:-12px;;width:372px;height:230px;">
		<img id="bt_s1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/hy-home-film.png" style="position: absolute; left: 0px; top: 0px; width: 337px; height: 202px; z-index: 10; transform: scale(1);">
	</div>
	<div id="div_f2" style="position:absolute;left:819px;top:192px;">
		<img id="bt_f2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-18px;top:-12px;;width:372px;height:230px;">
		<img id="bt_s2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/hy-home-anime.png" style="position: absolute; left: 0px; top: 0px; width: 337px; height: 202px; z-index: 10; transform: scale(1.05);">
	</div>
	<div id="div_f3" style="position:absolute;left:470px;top:402px;">
		<img id="bt_f3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-16px;top:-11px;;width:372px;height:230px;">
		<img id="bt_s3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/hy-home-arts.png" style="position: absolute; left: 0px; top: 0px; width: 337px; height: 202px; z-index: 10; transform: scale(1);">
	</div>
	<div id="div_f4" style="position:absolute;left:819px;top:402px;">
		<img id="bt_f4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-18px;top:-13px;;width:372px;height:230px;">
		<img id="bt_s4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/hy-home-documentary.png" style="position: absolute; left: 0px; top: 0px; width: 337px; height: 202px; z-index: 10; transform: scale(1);">
	</div>

	<div style="position: absolute;left:980px;top:50px;">
		<span id="time" style="text-align:right; font-size:23px; font-weight:normal;font-family:微软雅黑; color:#ffffff; overflow:hidden; margin:0; padding:0;">6月21日 17 : 31</span>
	</div>

	<img id="visitRecord" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/record.png" style="position: absolute;left:1px;top:1px" height="0" width="0">
	<div id="test" style="position: absolute;left:20px;top:300px;font-size:30px;color:#FF0000;"></div>
	<script type="text/javascript">

		function getNowTime() {
			var d = new Date();
			var MIN = d.getMinutes();
			if (MIN < 10) {
				MIN = "0" + MIN;
			}
			var str = (d.getMonth() + 1) + "月" + d.getDate() + "日      " + d.getHours() + " : " + MIN;
			document.getElementById('time').innerHTML = str;
		}
		setInterval("getNowTime()", 100);
		
		setInterval("IndexBFQversion()", 10);
		
	</script>

</body>

</html>

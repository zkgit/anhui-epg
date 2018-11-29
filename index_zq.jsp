<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta name="page-view-size" content="1280*720">
	<title>Welcome</title>
    <script type="text/javascript" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/ajax.min.js"></script>
	<script type="text/javascript" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/public_0718.js?v=0718"></script>
    <script type="text/javascript" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/jquery.min.js"></script>
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
				//_SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'+_BS[focus_id]['focusImage'];
				if (_BS[focus_id]['focusImage'] != 'Pixel.png') {
					_SELECT("DIV_F").style.left = $("#" + focus_id + "").offset().left;
					_SELECT("DIV_F").style.top = $("#" + focus_id + "").offset().top;
					_SELECT("IMG_F").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
				}
				DOBUTTONFOCUSFUN(focus_id);
			}
		}

		function _H_F(_id) {
			if (_BS[focus_id] != undefined && _BS[_id] != undefined && _SELECT(focus_id) != undefined && _SELECT(_id) != undefined) {
				if (_id.indexOf('bt_f') >= 0) {
					var _p_div = _id.replace('bt', 'div');
					if (_SELECT(_p_div).style.display == 'none') {
						return;
					}
				} else if (_id.indexOf('bt_js') >= 0) {
					var _p_div = _id.replace('js', 'div');
					if (_SELECT(_p_div).style.visibility == 'hidden') {
						return;
					}
				}

				_SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['blurImage'];
				DOBUTTONBLURFUN(focus_id);
				if (focus_id.indexOf('bt_f') >= 0) {
					var show_id = focus_id.replace('f', 's');
					var black_id = focus_id.replace('f', 'bg');
					var jb_id = focus_id.replace('f', 'jb');
					_TF(show_id, 1.0);
					_TF(black_id, 1.0);
					_FD(jb_id, 1.0, 1.0);
				}
				_TF('DIV_F', 1.0);
				focus_id = _id;
				//_SELECT("DIV_F").className='';
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
						//	_SELECT("DIV_F").className='WTD';
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
						_TF('DIV_F', 1.1);
						var show_id = focus_id.replace('f', 's');
						var black_id = focus_id.replace('f', 'bg');
						var jb_id = focus_id.replace('f', 'jb');
						_TF(show_id, 1.1);
						_TF(black_id, 1.1);
						_FD(jb_id, 1.3, 1.4);
					}
					_SELECT("DIV_F").style.zIndex = 11;
					_SELECT("DIV_F").style.left = $("#" + focus_id + "").offset().left;
					_SELECT("DIV_F").style.top = $("#" + focus_id + "").offset().top;
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


		function F_KEY_G_4() {
			if (_BS[focus_id] != undefined && _BS[focus_id]['leftButtonId'] != '') {
				_H_F(_BS[focus_id]['leftButtonId']);
			}
			return;
		}

		function F_KEY_G_5() {
			if (_BS[focus_id] != undefined && _BS[focus_id]['upButtonId'] != '') {
				_H_F(_BS[focus_id]['upButtonId']);
			}
			return;
		}

		function F_KEY_G_6() {
			if (_BS[focus_id] != undefined && _BS[focus_id]['rightButtonId'] != '') {
				_H_F(_BS[focus_id]['rightButtonId'])
			};
			return;
		}

		function F_KEY_G_7() {
			if (_BS[focus_id] != undefined && _BS[focus_id]['downButtonId'] != '') {
				_H_F(_BS[focus_id]['downButtonId'])
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


		$.ajaxSetup({
			async: false
		});

		function F_KEY_G_0() {
			Utility.setValueByName("exitIptvApp");
		}

		var buttons = [{
				id: 'bt_f0',
				upButtonId: '',
				downButtonId: 'bt_f3',
				leftButtonId: '',
				rightButtonId: 'bt_f1',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_BesTV',
				focusImage: 'zhaunqu-ys-f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f1',
				upButtonId: '',
				downButtonId: 'bt_f4',
				leftButtonId: 'bt_f0',
				rightButtonId: 'bt_f2',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_superM',
				focusImage: 'zhaunqu-ys-f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f2',
				upButtonId: '',
				downButtonId: 'bt_f5',
				leftButtonId: 'bt_f1',
				rightButtonId: 'bt_f3',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_HSTV',
				focusImage: 'zhaunqu-ys-f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f3',
				upButtonId: 'bt_f0',
				downButtonId: '',
				leftButtonId: 'bt_f2',
				rightButtonId: 'bt_f4',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_MGTV',
				focusImage: 'zhaunqu-ys-f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f4',
				upButtonId: 'bt_f1',
				downButtonId: '',
				leftButtonId: 'bt_f3',
				rightButtonId: 'bt_f5',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_YOUKU',
				focusImage: 'zhaunqu-ys-f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f5',
				upButtonId: 'bt_f2',
				downButtonId: '',
				leftButtonId: 'bt_f4',
				rightButtonId: '',
				blurFun: '',
				focusFun: '',
				enterFun: 'TO_IQIYI',
				focusImage: 'zhaunqu-ys-f.png',
				blurImage: 'Pixel.png'
			}
		]
		
		var returnUrl=encodeURI("http://arts.itvengine.com.lv1.vcache.cn/itv-epg/index_zq.jsp");

		function TO_BesTV() {		
			window.location.href = "http://61.132.236.248:8087/vasroot/epgcore/epg_vis/index/1?returnUrl=http%3a%2f%2farts.itvengine.com.lv1.vcache.cn%2fitv-epg%2findex_zq.jsp&goUrl=http%3a%2f%2f61.132.236.248%3a8087%2fvasroot%2fviscore%2fportal%2fbiz_AHDXHF_1_10026930_hd"
		}

		function TO_superM() {
			window.location.href = "http://ahtelstboxhuiyuan.voole.com/?returnUrl="+returnUrl;
		}

		function TO_HSTV() {
			window.location.href = "http://117.71.18.21:8181/hstv/index.jsp?position=1&type=xjd&returnUrl="+returnUrl;
		}

		function TO_YOUKU() {
			window.location.href = "http://itvmkt.ah163.net/youku?returnUrl="+returnUrl;
		}

		function TO_IQIYI() {
// 			window.location.href = "http://117.71.41.5:9090/aqy/index.jsp?position=1&type=classic&returnUrl="+returnUrl;
		}

		function TO_MGTV() {
			window.location.href = "http://61.191.42.118:6001/epg/index.php?returnUrl3="+returnUrl;
		}


		var focus_id = 'bt_f0';

		function F_KEY_G_1() {
			DOBUTTONENTERFUN(focus_id);
		}
	</script>
</head>

<body onload="init()" bgcolor="transparent">
	<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/zhunqu_bg.jpg" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;">
	<div id="DIV_F" style="position: absolute; left: 129px; top: 385px; z-index: 11; transform: scale(1.1);">
		<img style="height: 207px; width: 358px;" id="IMG_F" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/zhaunqu-ys-f.png">
	</div>

	<div id="div_f0" style="position:absolute;left:146px;top:205px;">
		<img id="bt_f0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-17px;top:-13px;;width:358px;height:207px;">
		<img id="bt_s0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/ZQ-BESTV.png" style="position: absolute; left: 0px; top: 0px; width: 322px; height: 181px; z-index: 10; transform: scale(1.1);">
	</div>
	<div id="div_f1" style="position:absolute;left:478px;top:205px;">
		<img id="bt_f1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-17px;top:-13px;;width:358px;height:207px;">
		<img id="bt_s1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/ZQ-SUPER-M.png" style="position: absolute; left: 0px; top: 0px; width: 322px; height: 181px; z-index: 10; transform: scale(1);">
	</div>
	<div id="div_f2" style="position:absolute;left:810px;top:205px;">
		<img id="bt_f2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-17px;top:-13px;;width:358px;height:207px;">
		<img id="bt_s2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/ZQ-HSTV.png" style="position: absolute; left: 0px; top: 0px; width: 322px; height: 181px; z-index: 10; transform: scale(1);">
	</div>
	<div id="div_f3" style="position:absolute;left:146px;top:398px;">
		<img id="bt_f3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-17px;top:-13px;;width:358px;height:207px;">
		<img id="bt_s3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/ZQ-MGTV.png" style="position: absolute; left: 0px; top: 0px; width: 322px; height: 181px; z-index: 10; transform: scale(1);">
	</div>
	<div id="div_f4" style="position:absolute;left:478px;top:398px;">
		<img id="bt_f4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-17px;top:-13px;;width:358px;height:207px;">
		<img id="bt_s4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/ZQ-YOUKU.png" style="position: absolute; left: 0px; top: 0px; width: 322px; height: 181px; z-index: 10; transform: scale(1);">
	</div>
	<div id="div_f5" style="position:absolute;left:810px;top:398px;">
		<img id="bt_f5" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-17px;top:-13px;;width:358px;height:207px;">
		<img id="bt_s5" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/ZQ-QIY-WHZ.png" style="position: absolute; left: 0px; top: 0px; width: 322px; height: 181px; z-index: 10; transform: scale(1);">
	</div>
</body>

</html>
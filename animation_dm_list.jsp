<%@page import="java.net.URLEncoder"%>
<%@page import="com.vstartek.epg.utils.HttpLinkUtils"%>
<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String programType=RequestUtil.getString("programType", request);
	programType="".equals(programType)?"anime":programType;

	String focus_id=RequestUtil.getString("focus_id", request);
	String programa_id=RequestUtil.getString("programa_id", request);
	String perv_num=RequestUtil.getString("perv_num", request);
	int perv_count=RequestUtil.getInt("perv_count", request);
	String pf_focus_id=RequestUtil.getString("pf_focus_id", request);
	
	//系统需要传输的字段
	String home_focus_id=RequestUtil.getString("home_focus_id", request);//卓影5个栏目进入
	String home_from=RequestUtil.getString("home_from", request);//酒店行业版进入
	//动画首页的热门推荐数量
	String home_perv_num=RequestUtil.getString("home_perv_num", request);
	
	String backUrl=RequestUtil.getString("backUrl", request);//接受backUrl
	String backUrl_encode=URLEncoder.encode(backUrl,"UTF-8");
	
	String pervUrl="&home_focus_id="+home_focus_id+"&home_from="+home_from+"&home_perv_num="+home_perv_num+"&backUrl="+backUrl_encode;
	
%>
<html>

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">

	<title>Welcome</title>
	<jsp:include page="/common/anime_top.jsp" >
		<jsp:param name="t" value="<%=System.currentTimeMillis() %>"/>
	</jsp:include>
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
				if (_BS[focus_id]['focusImage'] != 'Pixel.png') {
					var gb = _SELECT(focus_id);
					_SELECT("DIV_F").style.left = gb.getBoundingClientRect().left;
					_SELECT("DIV_F").style.top = gb.getBoundingClientRect().top;
					_SELECT("IMG_F").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
					if (focus_id.indexOf('bt_af') >= 0) {
						var show_id = focus_id.replace('f', 'd');
						_TF(show_id, 1.05);
						_TF('DIV_F', 1.05);
					} else if (focus_id.indexOf('bt_lmf') >= 0) {
						var show_id = focus_id.replace('f', 's');
						var lmblack_id = focus_id.replace('f', 'm');
						_TF(show_id, 1.05);
						_TF(lmblack_id, 1.05);
						_TF('DIV_F', 1.05);
					} else if (focus_id.indexOf('bt_f') >= 0) {
						var show_id = focus_id.replace('f', 's');
						var black_id = focus_id.replace('f', 'b');
						var jb_id = focus_id.replace('f', 'jb');
						_TF(show_id, 1.05);
						_TF(black_id, 1.05);
						_FD(jb_id, 1.12, 1.2);
						_TF('DIV_F', 1.055);
					}
				}
				DOBUTTONFOCUSFUN(focus_id);
			}
		}

		function _H_F(_id) {
			console.log("_H_F():"+_id);
			if (_BS[focus_id] != undefined && _BS[_id] != undefined && _SELECT(focus_id) != undefined && _SELECT(_id) != undefined) {
				if (_id.indexOf('bt_f') >= 0) {
					var _p_div = _id.replace('bt', 'div');
					if (_SELECT(_p_div).style.display == 'none') {
						return;
					}
				}
				//_SELECT(focus_id).src ='http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'+_BS[focus_id]['blurImage'];
				DOBUTTONBLURFUN(focus_id);
				if (focus_id.indexOf('bt_f') >= 0) {
					var show_id = focus_id.replace('f', 's');
					var black_id = focus_id.replace('f', 'b');
					var jb_id = focus_id.replace('f', 'jb');
					_TF(show_id, 1.0);
					_TF(black_id, 1.0);
					_FD(jb_id, 1.0, 1.0);
					_TF('DIV_F', 1.0);
				} else if (focus_id.indexOf('bt_lmf') >= 0) {
					var show_id = focus_id.replace('f', 's');
					var lmblack_id = focus_id.replace('f', 'm');
					_TF(show_id, 1.0);
					_TF(lmblack_id, 1.0);
					_TF('DIV_F', 1.0);
				} else if (focus_id.indexOf('bt_af') >= 0) {
					var show_id = focus_id.replace('f', 'd');
					_TF(show_id, 1.0);
					_TF('DIV_F', 1.0);
				}
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
						var show_id = focus_id.replace('f', 's');
						var black_id = focus_id.replace('f', 'b');
						var jb_id = focus_id.replace('f', 'jb');
						_TF(show_id, 1.05);
						_TF(black_id, 1.05);
						_FD(jb_id, 1.12, 1.2);
						_TF('DIV_F', 1.055);
					} else if (focus_id.indexOf('bt_lmf') >= 0) {
						var show_id = focus_id.replace('f', 's');
						var lmblack_id = focus_id.replace('f', 'm');
						_TF(show_id, 1.04050);
						_TF(lmblack_id, 1.04050);
						_TF('DIV_F', 1.04050);
					} else if (focus_id.indexOf('bt_af') >= 0) {
						var show_id = focus_id.replace('f', 'd');
						_TF(show_id, 1.05);
						_TF('DIV_F', 1.05);
					}
					_SELECT("DIV_F").style.zIndex = 11;
					var gb = _SELECT(focus_id);
					_SELECT("DIV_F").style.left = gb.getBoundingClientRect().left;
					_SELECT("DIV_F").style.top = gb.getBoundingClientRect().top;
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

//返回
		var backUrl = "animation_index.jsp?focus_id=bt_af1<%=pervUrl%>";

		function F_KEY_G_0() {
			window.location.href = backUrl;
		}

		function F_KEY_N_0() {
			window.location.href = backUrl;
		}

		function getPrevUrl() {};
		var buttons = [
			//左边光标
			{
				id: 'bt_pf0',
				upButtonId: 'bt_search',
				downButtonId: 'bt_pf1',
				leftButtonId: '',
				rightButtonId: 'bt_f0',
				blurFun: 'F_E_BLUR0',
				focusFun: 'F_E_PF0',
				enterFun: '',
				focusImage: 'anime-item-left-f1.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pf1',
				upButtonId: 'bt_pf0',
				downButtonId: 'bt_pf2',
				leftButtonId: '',
				rightButtonId: 'bt_f0',
				blurFun: 'F_E_BLUR1',
				focusFun: 'F_E_PF1',
				enterFun: '',
				focusImage: 'anime-item-left-f1.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pf2',
				upButtonId: 'bt_pf1',
				downButtonId: 'bt_pf3',
				leftButtonId: '',
				rightButtonId: 'bt_f0',
				blurFun: 'F_E_BLUR2',
				focusFun: 'F_E_PF2',
				enterFun: '',
				focusImage: 'anime-item-left-f1.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pf3',
				upButtonId: 'bt_pf2',
				downButtonId: 'bt_pf3',
				leftButtonId: '',
				rightButtonId: 'bt_f0',
				blurFun: 'F_E_BLUR3',
				focusFun: 'F_E_PF3',
				enterFun: '',
				focusImage: 'anime-item-left-f1.png',
				blurImage: 'Pixel.png'
			},
			//右边光标
			{
				id: 'bt_f0',
				upButtonId: 'bt_prev_f',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_pdgd',
				rightButtonId: 'bt_f1',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-item-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_f1',
				upButtonId: 'bt_prev_f',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_f0',
				rightButtonId: 'bt_f2',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-item-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_f2',
				upButtonId: 'bt_prev_f',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_f1',
				rightButtonId: 'bt_f3',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-item-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_f3',
				upButtonId: 'bt_prev_f',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_f2',
				rightButtonId: 'bt_f4',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-item-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_f4',
				upButtonId: 'bt_prev_f',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_f3',
				rightButtonId: 'bt_f5',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-item-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_f5',
				upButtonId: 'bt_f0',
				downButtonId: 'bt_next_f',
				leftButtonId: 'bt_pdgd',
				rightButtonId: 'bt_f6',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-item-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_f6',
				upButtonId: 'bt_f1',
				downButtonId: 'bt_next_f',
				leftButtonId: 'bt_f5',
				rightButtonId: 'bt_f7',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-item-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_f7',
				upButtonId: 'bt_f2',
				downButtonId: 'bt_next_f',
				leftButtonId: 'bt_f6',
				rightButtonId: 'bt_f8',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-item-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_f8',
				upButtonId: 'bt_f3',
				downButtonId: 'bt_next_f',
				leftButtonId: 'bt_f7',
				rightButtonId: 'bt_f9',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-item-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_f9',
				upButtonId: 'bt_f4',
				downButtonId: 'bt_next_f',
				leftButtonId: 'bt_f8',
				rightButtonId: '',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-item-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_search',
				upButtonId: '',
				downButtonId: 'bt_pf0',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'SEARCH_FOCUS',
				enterFun: 'F_TOSEARCH',
				focusImage: 'anime-index-f05.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_prev_f',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_KEY_G_2',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_next_f',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: 'bt_next_f',
				blurFun: '',
				focusFun: 'F_KEY_G_3',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_pdgd',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_F_PFGD',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_pdg_f',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_F_PFG_F',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}
		]
		var timeboolean = 1;
		var nowid = ""; 
	
		var programa_id_left = "<%="".equals(programa_id)?"0d46672abfc0d45f160d681a60e69f28":programa_id%>";//左边code
		var pf_focus_id = '<%="".equals(pf_focus_id)?"bt_pf0":pf_focus_id%>';//左边文字高亮焦点
		var focus_id = '<%="".equals(focus_id)?"bt_pf0":focus_id%>';//左边及右边focus焦点
		var pf_f = '<%="".equals(focus_id)?"bt_pf0":focus_id%>';//focus参数
		var p=<%="".equals(perv_num)?"1":perv_num%>;  //页数：没有取1

		function timecount(obj, id) {
			timeboolean = 1;
			setTimeout(function () {
				if (nowid == id) {
					timeboolean = 2;
					obj();
					timeboolean = 1;
				}
			}, 500);
		}
		var item_id = new Array();
		var itemid = new Array();
		var seriesCp_cpCode = new Array();
		var _programa_id_left = new Array();
		var _programa_title_left = new Array();
//顺序从上到下
		_programa_id_left.push('0d46672abfc0d45f160d681a60e69f28');
		_programa_id_left.push('578614da8c4136208a27a398a1a46121');
		_programa_id_left.push('cea3e3a2c73409259046dc6bda1f674a');
		_programa_id_left.push('755288f71c9d2d6c865fa4bfc2aec969');
		
		_programa_title_left.push('热播');
		_programa_title_left.push('冒险');
		_programa_title_left.push('梦幻');		
		_programa_title_left.push('更多');
		
		

		function F_E_PF0() {
			var bg = pf_focus_id;
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			nowid = '0d46672abfc0d45f160d681a60e69f28';
			leftTitle = _programa_title_left[0];
			if (timeboolean == 1) {
				if (programa_id_left != nowid) {
					timecount(F_E_PF0, nowid);
				}
			} else {
				if (programa_id_left != nowid) {
					item_id = [];
					itemid = [];
					seriesCp_name = [];
					pf_focus_id = 'bt_pf0';
					F_GET_JQUERY(nowid);
					programa_id_left = nowid;
					_H_F(focus_id);
				}
			}
		}

		function F_E_PF1() {
			var bg = pf_focus_id;
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			nowid = '578614da8c4136208a27a398a1a46121';
			leftTitle = _programa_title_left[1];
			if (timeboolean == 1) {
				if (programa_id_left != nowid) {
					timecount(F_E_PF1, nowid);
				}
			} else {
				if (programa_id_left != nowid) {
					item_id = [];
					itemid = [];
					seriesCp_name = [];
					pf_focus_id = 'bt_pf1';
					F_GET_JQUERY(nowid);
					programa_id_left = nowid;
					_H_F(focus_id);
				}
			}
		}

		function F_E_PF2() {
			var bg = pf_focus_id;
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			nowid = 'cea3e3a2c73409259046dc6bda1f674a';
			leftTitle = _programa_title_left[2];
			if (timeboolean == 1) {
				if (programa_id_left != nowid) {
					timecount(F_E_PF2, nowid);
				}
			} else {
				if (programa_id_left != nowid) {
					item_id = [];
					itemid = [];
					seriesCp_name = [];
					pf_focus_id = 'bt_pf2';
					F_GET_JQUERY(nowid);
					programa_id_left = nowid;
					_H_F(focus_id);
				}
			}
		}

		function F_E_PF3() {
			var bg = pf_focus_id;
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			nowid = '755288f71c9d2d6c865fa4bfc2aec969';
			leftTitle = _programa_title_left[3];
			if (timeboolean == 1) {
				if (programa_id_left != nowid) {
					timecount(F_E_PF3, nowid);
				}
			} else {
				if (programa_id_left != nowid) {
					item_id = [];
					itemid = [];
					seriesCp_name = [];
					pf_focus_id = 'bt_pf3';
					F_GET_JQUERY(nowid);
					programa_id_left = nowid;
					_H_F(focus_id);
				}
			}
		}
		var pageSum;
//查询
		function F_GET_JQUERY(arg) {
			item_id = [];
			itemid = [];
			seriesCp_name = [];
			seriesCp_cpCode = [];
			var _arg_i = _programa_id_left.indexOf(arg);
			if (_arg_i > 8) {
				_arg_i = 0;
			}
			var programa_id_left_next = _programa_id_left[_arg_i];
			var parentfile = _interceptTwo(arg);
			_arg_i++;
			var url = webset.apiStatic +"programType/anime_new/"+parentfile+"/"+arg+"_1.json";
			$.get(url, function (result) {
				var json = eval('(' + result + ')');
				p = json.res.currentPage;
				pageSum = json.res.totalPage;
				F_NONEAllDIV();
				F_threeDIV();
				$.each(json.res.currentPageList, function (i, item) {
					blockDiv("div_f" + i);
					_SELECT("bt_s" + i).src = item.imagetv;
					if (item.bcharging == '1') {
						_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
					} else {
						_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
					}
					_SELECT("bt_p" + i).innerHTML = item.title;
					item_id.push(item.code);
					itemid.push(item.id);
					seriesCp_name.push(item.title);
					seriesCp_cpCode.push(item.cpCode);
					if (item.volumnCount == item.currentCount) {
						_SELECT("bt_2p" + i).innerHTML = "共" + item.volumnCount + "集 已完结";
//					} else if (item.seriescp_filecount == item.seriescp_update) {
//						_SELECT("bt_2p" + i).innerHTML = "共" + item.volumnCount + "集 已完结";
					} else {
						_SELECT("bt_2p" + i).innerHTML = "更新至第" + item.currentCount + "集";
					}
					// _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
				});
				if (json.res.nextPreloadPageList != "") {
					$.each(json.res.nextPreloadPageList, function (i, item) {
						if (i < 5) {
							blockDiv("d_b" + i);
							_SELECT("div_b" + i).style.backgroundImage = "url('" + item.imagetv + "')";
							if (item.bcharging == '1') {
								_SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
							} else {
								_SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
							}
							// _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
						}
					});
				}
				_SELECT("n_s").innerHTML = "当前第" + json.res.currentPage + "页/共" + json.res.totalPage + "页";
			}, false);
			FYY();
		}
		//$(document).ready(function(){
		function initdatas() {
			item_id = [];
			itemid = [];
			seriesCp_name = [];
			seriesCp_cpCode = [];
			var _arg_i = _programa_id_left.indexOf(programa_id_left);
			if (_arg_i > 8) {
				_arg_i = 0;
			}
			var programa_id_left_next = _programa_id_left[_arg_i];
			var parentfile = _interceptTwo(programa_id_left);
			_arg_i++;
			var url = webset.apiStatic +"programType/anime_new/"+parentfile+"/"+programa_id_left+"_"+p+".json";
			$.get(url, function (result) {
				var json = eval('(' + result + ')');
				p = json.res.currentPage;
				pageSum = json.res.totalPage;
				F_NONEAllDIV();
				F_threeDIV();
				$.each(json.res.currentPageList, function (i, item) {
					blockDiv("div_f" + i);
					_SELECT("bt_s" + i).src = item.imagetv;
					if (item.bcharging == '1') {
						_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
					} else {
						_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
					}
					_SELECT("bt_p" + i).innerHTML = item.title;
					item_id.push(item.code);
					itemid.push(item.id);
					seriesCp_name.push(item.title);
					seriesCp_cpCode.push(item.cpCode);
					if (item.volumnCount == item.currentCount) {
						_SELECT("bt_2p" + i).innerHTML = "共" + item.volumnCount + "集 已完结";
//					} else if (item.seriescp_filecount == item.seriescp_update) {
//						_SELECT("bt_2p" + i).innerHTML = "共" + item.volumnCount + "集 已完结";
					} else {
						_SELECT("bt_2p" + i).innerHTML = "更新至第" + item.currentCount + "集";
					}
					// _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
				});
				if (json.res.nextPreloadPageList != "") {
					$.each(json.res.nextPreloadPageList, function (i, item) {
						if (i < 5) {
							blockDiv("d_b" + i);
							//_SELECT("div_b"+i).src=item.item_poster;
							_SELECT("div_b" + i).style.backgroundImage = "url('" + item.imagetv + "')";
							if (item.bcharging == '1') {
								_SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
							} else {
								_SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
							}
							// _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
						}
					});
				}
				_SELECT("n_s").innerHTML = "当前第" + json.res.currentPage + "页/共" + json.res.totalPage + "页";
			}, false);
			FYY();
			init();
		}
		//});
		function SETFOCUS() {
			_H_F(focus_id);
		}
		var _title = "";
		function F_E_F0() {
			//leftTitle:左边栏目参数
			var i = parseInt(focus_id.replace('bt_f', ''));
			_title = seriesCp_name[i];//影片名称
			var _cpcode = seriesCp_cpCode[i],
                _code = item_id[i],
                _id = itemid[i],               
                _programType='<%=programType%>',
                _programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
            var _stat="影视聚合-动画-动漫-"+leftTitle+"-"+_title;
     		setTimeout("_STAT('"+_stat+"')", 1);
     			
			commen_play(_id,_programType,_programType2,_code,_cpcode,"&back=animation_dm_list&programa_id=" + programa_id_left 
			+"&pf_focus_id=" +pf_focus_id +"&focus_id=" + focus_id+"&perv_num="+p+"<%=pervUrl%>");	
		}

		function getPreposition(item_id) {}

		function getfirstposition(item_id) {}

		function F_KEY_G_2() {
			//if(pageSum>1){
			if ((p - 1) > 0) {
				//setTimeout(function(){
				item_id = [];				
				itemid = [];
				seriesCp_name = [];
				seriesCp_cpCode = [];
				var _arg_i = _programa_id_left.indexOf(programa_id_left);
				_arg_i++;
				if (_arg_i > 8) {
					_arg_i = 0;
				}
				var programa_id_left_next = _programa_id_left[_arg_i];
				var parentfile = _interceptTwo(programa_id_left);
				var url = webset.apiStatic +"programType/anime_new/"+parentfile+"/"+programa_id_left+"_"+(p-1)+".json";
				$.get(url, function (result) {
					var json = eval('(' + result + ')');
					p = json.res.currentPage;
					pageSum = json.res.totalPage;
					F_NONEAllDIV();
					F_threeDIV();
					$.each(json.res.currentPageList, function (i, item) {
						blockDiv("div_f" + i);
						_SELECT("bt_s" + i).src = item.imagetv;
						//_SELECT("bt_p"+i).innerHTML=item.seriesCp_name;
						if (item.bcharging == '1') {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
						}
						_SELECT("bt_p" + i).innerHTML = item.title;
						item_id.push(item.code);
						itemid.push(item.id);
						seriesCp_name.push(item.title);
						seriesCp_cpCode.push(item.cpCode);
						if (item.volumnCount == item.currentCount) {
							_SELECT("bt_2p" + i).innerHTML = "共" + item.volumnCount + "集 已完结";
	//					} else if (item.seriescp_filecount == item.seriescp_update) {
	//						_SELECT("bt_2p" + i).innerHTML = "共" + item.volumnCount + "集 已完结";
						} else {
							_SELECT("bt_2p" + i).innerHTML = "更新至第" + item.currentCount + "集";
						}
						// _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
					});
					if (json.res.nextPreloadPageList != "") {
						$.each(json.res.nextPreloadPageList, function (i, item) {
							if (i < 5) {
								blockDiv("d_b" + i);
								//_SELECT("div_b"+i).src=item.item_poster;
								_SELECT("div_b" + i).style.backgroundImage = "url('" + item.imagetv + "')";
								if (item.bcharging == '1') {
									_SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
								} else {
									_SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
								}
								// _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
							}
						});
					}
					_SELECT("n_s").innerHTML = "当前第" + json.res.currentPage + "页/共" + json.res.totalPage + "页";
				}, false);
				FYY();
				var i = parseInt(pf_f.replace('bt_f', ''));
				if (item_id.length > i) {
					_H_F("bt_f" + i);
				} else {
					_H_F("bt_f" + (item_id.length - 1));
				}
				//},100);
			} else {
				var i = parseInt(pf_focus_id.replace('bt_pf', ''));
				var j = i - 1;
				if (j >= 0) {
					item_id = [];
					seriesCp_name = [];
					seriesCp_cpCode = [];
					//j=3;
					SWITCHFUN(j);
				} else {
					_H_F('bt_f0');
				}
			}
		}

		function F_KEY_G_3() {
			//if(pageSum>1){
			if ((p + 1) <= pageSum) {
				item_id = [];
				itemid = [];
				seriesCp_name = [];
				seriesCp_cpCode = [];
				//setTimeout(function(){
				var _arg_i = _programa_id_left.indexOf(programa_id_left);
				var programa_id_left_next = _programa_id_left[_arg_i];
				var parentfile = _interceptTwo(programa_id_left);
				_arg_i++;
				if (_arg_i > 8) {
					_arg_i = 0;
				}
				var url = webset.apiStatic +"programType/anime_new/"+parentfile+"/"+programa_id_left+"_"+(p+1)+".json";
				$.get(url, function (result) {
					var json = eval('(' + result + ')');
					p = json.res.currentPage;
					pageSum = json.res.totalPage;
					F_NONEAllDIV();
					F_threeDIV();
					$.each(json.res.currentPageList, function (i, item) {
						blockDiv("div_f" + i);
						_SELECT("bt_s" + i).src = item.imagetv;
						//_SELECT("bt_p"+i).innerHTML=item.seriesCp_name;
						if (item.bcharging == '1') {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
						}
						_SELECT("bt_p" + i).innerHTML = item.title;
						item_id.push(item.code);
						itemid.push(item.id);
						seriesCp_name.push(item.title);
						seriesCp_cpCode.push(item.cpCode);
						if (item.volumnCount == item.currentCount) {
							_SELECT("bt_2p" + i).innerHTML = "共" + item.volumnCount + "集 已完结";
	//					} else if (item.seriescp_filecount == item.seriescp_update) {
	//						_SELECT("bt_2p" + i).innerHTML = "共" + item.volumnCount + "集 已完结";
						} else {
							_SELECT("bt_2p" + i).innerHTML = "更新至第" + item.currentCount + "集";
						}
						// _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
					});
					if (json.res.nextPreloadPageList != "") {
						$.each(json.res.nextPreloadPageList, function (i, item) {
							if (i < 5) {
								blockDiv("d_b" + i);
								//_SELECT("div_b"+i).src=item.item_poster;
								_SELECT("div_b" + i).style.backgroundImage = "url('" + item.imagetv + "')";
								if (item.bcharging == '1') {
									_SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
								} else {
									_SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
								}
								// _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
							}
						});
					}
					_SELECT("n_s").innerHTML = "当前第" + json.res.currentPage + "页/共" + json.res.totalPage + "页";
				}, false);
				FYY();
				var i = parseInt(pf_f.replace('bt_f', ''));
				if (i < 5) {
					_H_F("bt_f" + i);
				} else if (item_id.length > (i - 5)) {
					_H_F("bt_f" + (i - 5));
				} else {
					_H_F("bt_f" + (item_id.length - 1));
				}
				//},100);
			} else {
				item_id = [];
				seriesCp_name = [];
				seriesCp_cpCode = [];
				var i = parseInt(pf_focus_id.replace('bt_pf', ''));
				var j = i + 1;
				if (j > 3) {
					j = 0;
				}
				SWITCHFUN(j);
			}
		}
//语音查询
		function F_KEY_GO_PAGE(index1) {
			//if(pageSum>1){
			if (index1 > 0 && index1 <= pageSum) {
				item_id = [];
				itemid = [];
				seriesCp_name = [];
				seriesCp_cpCode = [];
				//setTimeout(function(){
				var _arg_i = _programa_id_left.indexOf(programa_id_left);
				_arg_i++;
				if (_arg_i > 8) {
					_arg_i = 0;
				}
				var programa_id_left_next = _programa_id_left[_arg_i];
				var parentfile = _interceptTwo(programa_id_left);
				var url = webset.apiStatic +"programType/anime_new/"+parentfile+"/"+programa_id_left+"_"+index1+".json";
				$.get(url, function (result) {
					var json = eval('(' + result + ')');
					p = json.res.currentPage;
					pageSum = json.res.totalPage;
					F_NONEAllDIV();
					F_threeDIV();
					$.each(json.res.currentPageList, function (i, item) {
						blockDiv("div_f" + i);
						_SELECT("bt_s" + i).src = item.imagetv;
						//_SELECT("bt_p"+i).innerHTML=item.seriesCp_name;
						if (item.bcharging == '1') {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
						}
						_SELECT("bt_p" + i).innerHTML = item.title;
						item_id.push(item.code);
						itemid.push(item.id);
						seriesCp_name.push(item.title);
						seriesCp_cpCode.push(item.cpCode);
						if (item.volumnCount == item.currentCount) {
							_SELECT("bt_2p" + i).innerHTML = "共" + item.volumnCount + "集 已完结";
	//					} else if (item.seriescp_filecount == item.seriescp_update) {
	//						_SELECT("bt_2p" + i).innerHTML = "共" + item.volumnCount + "集 已完结";
						} else {
							_SELECT("bt_2p" + i).innerHTML = "更新至第" + item.currentCount + "集";
						}
						// _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
					});
					if (json.res.nextPreloadPageList != "") {
						$.each(json.res.nextPreloadPageList, function (i, item) {
							if (i < 5) {
								blockDiv("d_b" + i);
								//_SELECT("div_b"+i).src=item.item_poster;
								_SELECT("div_b" + i).style.backgroundImage = "url('" + item.imagetv + "')";
								if (item.bcharging == '1') {
									_SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
								} else {
									_SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
								}
								// _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
							}
						});
					}
					_SELECT("n_s").innerHTML = "当前第" + json.res.currentPage + "页/共" + json.res.totalPage + "页";
				}, false);
				FYY();
				var i = parseInt(pf_f.replace('bt_f', ''));
				if (i < 5) {
					_H_F("bt_f" + i);
				} else if (item_id.length > (i - 5)) {
					_H_F("bt_f" + (i - 5));
				} else {
					_H_F("bt_f" + (item_id.length - 1));
				}
				//},100);
			}
		}

		function F_F_PFGD() {
			_H_F(pf_focus_id);
		}

		function F_F_PFG() {
			_H_F(pf_f);
		}
		var item_name = '';

		function F_E_RF() {
			pf_f = focus_id;
			item_name = _SELECT(focus_id.replace('f', 'p')).innerHTML;
			if (item_name.length > 6) {
				_SELECT(focus_id.replace('f', 'p')).innerHTML = '<marquee direction="left">' + item_name + "</marquee>";
			}
			var bg = pf_focus_id.replace('pf', 'pd');
			//_SELECT(bg).src='http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/sy_lf.png';
			var p_id = pf_focus_id.replace("p", "wz");
			_SELECT(p_id).style.color = "#e6a700";
		}

		function F_B_F0() {
			_SELECT(focus_id.replace('f', 'p')).innerHTML = '' + item_name + "";
		}

		function F_KEY_G_1() {
			DOBUTTONENTERFUN(focus_id);
		}

		function F_E_BLUR0() {
			var p_id = focus_id.replace("p", "wz");
			_SELECT(p_id).style.color = "#ffffff";
		}

		function F_E_BLUR1() {
			var p_id = focus_id.replace("p", "wz");
			_SELECT(p_id).style.color = "#ffffff";
		}

		function F_E_BLUR2() {
			var p_id = focus_id.replace("p", "wz");
			_SELECT(p_id).style.color = "#ffffff";
		}

		function F_E_BLUR3() {
			var p_id = focus_id.replace("p", "wz");
			_SELECT(p_id).style.color = "#ffffff";
		}

		function F_TOSEARCH() {
		}

		function F_F_PFG_F() {
			var i = parseInt(pf_f.replace('bt_f', ''));
			if (item_id.length > i + 5) {
				_H_F("bt_f" + (i + 5));
			} else if (item_id.length > 5) {
				_H_F("bt_f" + (item_id.length - 1));
			} else {
				_H_F("bt_next_f");
			}
		}

		function SWITCHFUN(i) {
			switch (i) {
				case 0:
					F_E_PFO0();
					break;
				case 1:
					F_E_PFO1();
					break;
				case 2:
					F_E_PFO2();
					break;
				case 3:
					F_E_PFO3();
					break;
				case 4:
					F_E_PFO4();
					break;
				case 5:
					F_E_PFO5();
					break;
				case 6:
					F_E_PFO6();
					break;
				case 7:
					F_E_PFO7();
					break;
				case 8:
					F_E_PFO8();
					break;
				case 9:
					F_E_PFO9();
					break;
				default:
					;
			}
		}

		function F_E_PFO0() {
			var bg = pf_focus_id;
			_SELECT(bg).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png';
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			if (focus_id != 'bt_prev_f') {
				var p_id = focus_id.replace("p", "wz");
				_SELECT(p_id).style.color = "#65c7ff";
			}
			nowid = '0d46672abfc0d45f160d681a60e69f28';
			if (timeboolean == 1) {
				if (programa_id_left != nowid) {
					timecount(F_E_PFO0, nowid);
				}
			} else {
				if (programa_id_left != nowid) {
					item_id = [];
					seriesCp_name = [];
					pf_focus_id = 'bt_pf0';
					F_GET_JQUERY(nowid);
					programa_id_left = nowid;
					var now_wzid = pf_focus_id.replace("p", "wz");
					_SELECT(now_wzid).style.color = "#65c7ff";
					//_H_F("bt_f0");
					var i = parseInt(pf_f.replace('bt_f', ''));
					if (i < 5) {
						if (item_id.length > i) {
							_H_F("bt_f" + i);
						} else {
							_H_F("bt_f" + (item_id.length - 1));
						}
					} else {
						if (item_id.length > (i - 5)) {
							_H_F("bt_f" + (i - 5));
						} else {
							_H_F("bt_f" + (item_id.length - 1));
						}
					}
				}
			}
		}

		function F_E_PFO1() {
			var bg = pf_focus_id;
			_SELECT(bg).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png';
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			if (focus_id != 'bt_prev_f') {
				var p_id = focus_id.replace("p", "wz");
				_SELECT(p_id).style.color = "#65c7ff";
			}
			nowid = '578614da8c4136208a27a398a1a46121';
			if (timeboolean == 1) {
				if (programa_id_left != nowid) {
					timecount(F_E_PFO1, nowid);
				}
			} else {
				if (programa_id_left != nowid) {
					item_id = [];
					seriesCp_name = [];
					pf_focus_id = 'bt_pf1';
					F_GET_JQUERY(nowid);
					programa_id_left = nowid;
					var now_wzid = pf_focus_id.replace("p", "wz");
					_SELECT(now_wzid).style.color = "#65c7ff";
					//_H_F("bt_f0");
					var i = parseInt(pf_f.replace('bt_f', ''));
					if (i < 5) {
						if (item_id.length > i) {
							_H_F("bt_f" + i);
						} else {
							_H_F("bt_f" + (item_id.length - 1));
						}
					} else {
						if (item_id.length > (i - 5)) {
							_H_F("bt_f" + (i - 5));
						} else {
							_H_F("bt_f" + (item_id.length - 1));
						}
					}
				}
			}
		}

		function F_E_PFO2() {
			var bg = pf_focus_id;
			_SELECT(bg).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png';
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			if (focus_id != 'bt_prev_f') {
				var p_id = focus_id.replace("p", "wz");
				_SELECT(p_id).style.color = "#65c7ff";
			}
			nowid = 'cea3e3a2c73409259046dc6bda1f674a';
			if (timeboolean == 1) {
				if (programa_id_left != nowid) {
					timecount(F_E_PFO2, nowid);
				}
			} else {
				if (programa_id_left != nowid) {
					item_id = [];
					seriesCp_name = [];
					pf_focus_id = 'bt_pf2';
					F_GET_JQUERY(nowid);
					programa_id_left = nowid;
					var now_wzid = pf_focus_id.replace("p", "wz");
					_SELECT(now_wzid).style.color = "#65c7ff";
					//_H_F("bt_f0");
					var i = parseInt(pf_f.replace('bt_f', ''));
					if (i < 5) {
						if (item_id.length > i) {
							_H_F("bt_f" + i);
						} else {
							_H_F("bt_f" + (item_id.length - 1));
						}
					} else {
						if (item_id.length > (i - 5)) {
							_H_F("bt_f" + (i - 5));
						} else {
							_H_F("bt_f" + (item_id.length - 1));
						}
					}
				}
			}
		}

		function F_E_PFO3() {
			var bg = pf_focus_id;
			_SELECT(bg).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png';
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
			_SELECT(upwzid).style.color = "#ffffff";
			if (focus_id != 'bt_prev_f') {
				var p_id = focus_id.replace("p", "wz");
				_SELECT(p_id).style.color = "#65c7ff";
			}
			nowid = '755288f71c9d2d6c865fa4bfc2aec969';
			if (timeboolean == 1) {
				if (programa_id_left != nowid) {
					timecount(F_E_PFO3, nowid);
				}
			} else {
				if (programa_id_left != nowid) {
					item_id = [];
					seriesCp_name = [];
					pf_focus_id = 'bt_pf3';
					F_GET_JQUERY(nowid);
					programa_id_left = nowid;
					var now_wzid = pf_focus_id.replace("p", "wz");
					_SELECT(now_wzid).style.color = "#65c7ff";
					//_H_F("bt_f0");
					var i = parseInt(pf_f.replace('bt_f', ''));
					if (i < 5) {
						if (item_id.length > i) {
							_H_F("bt_f" + i);
						} else {
							_H_F("bt_f" + (item_id.length - 1));
						}
					} else {
						if (item_id.length > (i - 5)) {
							_H_F("bt_f" + (i - 5));
						} else {
							_H_F("bt_f" + (item_id.length - 1));
						}
					}
				}
			}
		}
		
		function F_NONEAllDIV() { //隐藏所有节目
			for (var i = 0; i < 10; i++) {
				noneDiv("div_f" + i);
			}
		}

		function F_threeDIV() { //隐藏第三行
			for (var i = 0; i < 6; i++) {
				noneDiv("d_b" + i);
			}
		}

		function insertWatchItemId(item_id) {
			
		}
		////////////////////////////
		var seriesCp_name = new Array();
		var callback = function (intent) {
				var _command = intent['_command'];
				if (_command == '_PAGE') {
					var action = intent['_action'];
					if (action == 'NEXT') {
						_command = "bt_next_f";
					} else if (action == 'PREV') {
						_command = "bt_prev_f";
					} else if (action == 'INDEX') {
						var index = intent['index'];
						F_KEY_GO_PAGE(index);
						return;
					}
				}
				_H_F(_command);
				DOBUTTONENTERFUN(_command);
			}
		var listener = new Xiri.Listener(callback);
		function FYY() {
			var scene = {
				_scene: "com.iflytek.xiri.MGTV",
				_commands: {
					"bt_pf0": ["热播"],
					"bt_pf1": ["冒险"],
					"bt_pf2": ["梦幻"],
					"bt_pf3": ["更多"],
					"bt_f0": ["" + seriesCp_name[0] + ""],
					"bt_f1": ["" + seriesCp_name[1] + ""],
					"bt_f2": ["" + seriesCp_name[2] + ""],
					"bt_f3": ["" + seriesCp_name[3] + ""],
					"bt_f4": ["" + seriesCp_name[4] + ""],
					"bt_f5": ["" + seriesCp_name[5] + ""],
					"bt_f6": ["" + seriesCp_name[6] + ""],
					"bt_f7": ["" + seriesCp_name[7] + ""],
					"bt_f8": ["" + seriesCp_name[8] + ""],
					"bt_f9": ["" + seriesCp_name[9] + ""],
					"_PAGE": ["$P(_PAGE)"],
					"bt_prev_f": ["上一页"],
					"bt_next_f": ["下一页"],
					"test1": ["测试1"],
					"test2": ["测试2"]
				},
				_feedbacks: {
					"bt_pf0": '跳到热播',
					"bt_pf1": '跳到冒险',
					"bt_pf2": '跳到梦幻',
					"bt_pf3": '跳到更多',
					"bt_f0": '打开' + seriesCp_name[0] + '',
					"bt_f0": '打开' + seriesCp_name[0] + '',
					"bt_f1": '打开' + seriesCp_name[1] + '',
					"bt_f2": '打开' + seriesCp_name[2] + '',
					"bt_f3": '打开' + seriesCp_name[3] + '',
					"bt_f4": '打开' + seriesCp_name[4] + '',
					"bt_f5": '打开' + seriesCp_name[5] + '',
					"bt_f6": '打开' + seriesCp_name[6] + '',
					"bt_f7": '打开' + seriesCp_name[7] + '',
					"bt_f8": '打开' + seriesCp_name[8] + '',
					"bt_f9": '打开' + seriesCp_name[9] + '',
					"bt_prev_f": '上一页',
					"bt_next_f": '下一页',
					"test1": '为你测试1',
					"test2": '为你测试2'
				}
			};
			
			listener.regist(scene);
		}
		////////////////////////////
	</script>

	<style type="text/css">
		.p0 {
			font-size: 16px
		}

		.p1 {
			font-size: 16px
		}
	</style>

	<style type="text/css">
		.WTD {
			-webkit-transition-duration: 300ms;
			transition-duration: 300ms;
		}
	</style>
</head>

<body onload="initdatas()" bgcolor="transparent">
	<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-bg03.jpg" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;">
	<div id="DIV_F" style="position: absolute; left: 45px; top: 132px; z-index: 11;">
		<img id="IMG_F" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-left-f1.png">
	</div>
	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdgd" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>

	<div style="position:absolute;left:100px;top:150px; width:120px;height:40px;z-index:11;">
		<p id="bt_wzf0" style="position:absolute; left:0px; top:0px; width:120px; height:40px; line-height:40px; text-align:left; font-size:32px;font-family:微软雅黑; font-weight:600; color:#ffffff; overflow:hidden; margin:0; padding:0;">热播</p>
	</div>

	<div style="position:absolute;left:45px;top:132px;">
		<img id="bt_pf0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;width:168px;height:91px;">
	</div>

	<div style="position:absolute;left:100px;top:230px; width:120px;height:40px;z-index:11;">
		<p id="bt_wzf1" style="position:absolute; left:0px; top:0px; width:120px; height:40px; line-height:40px; text-align:left; font-size:32px;font-family:微软雅黑; font-weight:600; color:#ffffff; overflow:hidden; margin:0; padding:0;">冒险</p>
	</div>

	<div style="position:absolute;left:45px;top:212px;">
		<img id="bt_pf1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;width:168px;height:91px;">
	</div>

	<div style="position:absolute;left:100px;top:310px; width:120px;height:40px;z-index:11;">
		<p id="bt_wzf2" style="position:absolute; left:0px; top:0px; width:120px; height:40px; line-height:40px; text-align:left; font-size:32px;font-family:微软雅黑; font-weight:600; color:#ffffff; overflow:hidden; margin:0; padding:0;">梦幻</p>
	</div>

	<div style="position:absolute;left:45px;top:292px;">
		<img id="bt_pf2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;width:168px;height:91px;">
	</div>

	<div style="position:absolute;left:100px;top:390px; width:120px;height:40px;z-index:11;">
		<p id="bt_wzf3" style="position:absolute; left:0px; top:0px; width:120px; height:40px; line-height:40px; text-align:left; font-size:32px;font-family:微软雅黑; font-weight:600; color:#ffffff; overflow:hidden; margin:0; padding:0;">更多</p>
	</div>

	<div style="position:absolute;left:45px;top:372px;">
		<img id="bt_pf3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;width:168px;height:91px;">
	</div>

	<div id="itempage">
		<div id="div_f0" style="position: absolute; left: 285px; top: 88px; display: block;">
			<img id="bt_s0" style="position: absolute;left:14px;top:12px;width:131px;height:197px;z-index:11;">
			<img id="bt_jb0" style="position: absolute;left:14px;top:12px;width:61px;height:60px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png">
			<img id="bt_f0" style="position: absolute;left:-27px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<img id="bt_bg0" style="position:absolute;left:0px;top:0px;width:163px;height:259px;z-index:1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png">
			<img id="bt_jbr0" style="position: absolute;left:92px;top:12px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<div style="position:absolute;left:10px;top:212px; width:110px;height:25px;z-index:11;">
				<p id="bt_p0" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:121px;top:210px; width:24px;height:25px;z-index:11;">
				<p id="bt_1p0" class="p1" style="position:absolute; left:0px; top:0px; width:24px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:10px;top:230px; width:110px;height:25px;z-index:11;">
				<p id="bt_2p0" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:gray; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
		</div>
		<div id="div_f1" style="position: absolute; left: 466px; top: 88px; display: block;">
			<img id="bt_s1" style="position: absolute;left:14px;top:12px;width:131px;height:197px;z-index:11;">
			<img id="bt_jb1" style="position: absolute;left:14px;top:12px;width:61px;height:60px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png">
			<img id="bt_f1" style="position: absolute;left:-27px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<img id="bt_bg1" style="position:absolute;left:0px;top:0px;width:163px;height:259px;z-index:1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png">
			<img id="bt_jbr1" style="position: absolute;left:92px;top:12px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<div style="position:absolute;left:10px;top:212px; width:110px;height:25px;z-index:11;">
				<p id="bt_p1" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:121px;top:210px; width:24px;height:25px;z-index:10;">
				<p id="bt_1p1" class="p1" style="position:absolute; left:0px; top:0px; width:24px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:10px;top:230px; width:110px;height:25px;z-index:11;">
				<p id="bt_2p1" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:gray; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
		</div>
		<div id="div_f2" style="position: absolute; left: 647px; top: 88px; display: block;">
			<img id="bt_s2" style="position: absolute;left:14px;top:12px;width:131px;height:197px;z-index:11;">
			<img id="bt_jb2" style="position: absolute;left:14px;top:12px;width:61px;height:60px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png">
			<img id="bt_f2" style="position: absolute;left:-27px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<img id="bt_bg2" style="position:absolute;left:0px;top:0px;width:163px;height:259px;z-index:1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png">
			<img id="bt_jbr2" style="position: absolute;left:92px;top:12px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<div style="position:absolute;left:10px;top:212px; width:110px;height:25px;z-index:11;">
				<p id="bt_p2" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:121px;top:210px; width:24px;height:25px;z-index:10;">
				<p id="bt_1p2" class="p1" style="position:absolute; left:0px; top:0px; width:24px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:10px;top:230px; width:110px;height:25px;z-index:11;">
				<p id="bt_2p2" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:gray; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
		</div>
		<div id="div_f3" style="position: absolute; left: 828px; top: 88px; display: block;">
			<img id="bt_s3" style="position: absolute;left:14px;top:12px;width:131px;height:197px;z-index:11;">
			<img id="bt_jb3" style="position: absolute;left:14px;top:12px;width:61px;height:60px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png">
			<img id="bt_f3" style="position: absolute;left:-29px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<img id="bt_bg3" style="position:absolute;left:0px;top:0px;width:163px;height:259px;z-index:1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png">
			<img id="bt_jbr3" style="position: absolute;left:92px;top:12px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<div style="position:absolute;left:10px;top:212px; width:110px;height:25px;z-index:11;">
				<p id="bt_p3" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:121px;top:210px; width:24px;height:25px;z-index:10;">
				<p id="bt_1p3" class="p1" style="position:absolute; left:0px; top:0px; width:24px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:10px;top:230px; width:110px;height:25px;z-index:11;">
				<p id="bt_2p3" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:gray; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
		</div>
		<div id="div_f4" style="position: absolute; left: 1009px; top: 88px; display: block;">
			<img id="bt_s4" style="position: absolute;left:14px;top:12px;width:131px;height:197px;z-index:11;">
			<img id="bt_jb4" style="position: absolute;left:14px;top:12px;width:61px;height:60px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png">
			<img id="bt_f4" style="position: absolute;left:-29px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<img id="bt_bg4" style="position:absolute;left:0px;top:0px;width:163px;height:259px;z-index:1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png">
			<img id="bt_jbr4" style="position: absolute;left:92px;top:12px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<div style="position:absolute;left:10px;top:212px; width:110px;height:25px;z-index:11;">
				<p id="bt_p4" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:121px;top:210px; width:24px;height:25px;z-index:10;">
				<p id="bt_1p4" class="p1" style="position:absolute; left:0px; top:0px; width:24px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:10px;top:230px; width:110px;height:25px;z-index:11;">
				<p id="bt_2p4" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:gray; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
		</div>
		<div id="div_f5" style="position: absolute; left: 285px; top: 371px; display: block;">
			<img id="bt_s5" style="position: absolute;left:14px;top:12px;width:131px;height:197px;z-index:11;">
			<img id="bt_jb5" style="position: absolute;left:14px;top:12px;width:61px;height:60px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png">
			<img id="bt_f5" style="position: absolute;left:-27px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<img id="bt_bg5" style="position:absolute;left:0px;top:0px;width:163px;height:259px;z-index:1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png">
			<img id="bt_jbr5" style="position: absolute;left:92px;top:12px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<div style="position:absolute;left:10px;top:212px; width:110px;height:25px;z-index:11;">
				<p id="bt_p5" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:121px;top:210px; width:24px;height:25px;z-index:10;">
				<p id="bt_1p5" class="p1" style="position:absolute; left:0px; top:0px; width:24px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:10px;top:230px; width:110px;height:25px;z-index:11;">
				<p id="bt_2p5" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:gray; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
		</div>
		<div id="div_f6" style="position: absolute; left: 466px; top: 371px; display: block;">
			<img id="bt_s6" style="position: absolute;left:14px;top:12px;width:131px;height:197px;z-index:11;">
			<img id="bt_jb6" style="position: absolute;left:14px;top:12px;width:61px;height:60px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png">
			<img id="bt_f6" style="position: absolute;left:-27px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<img id="bt_bg6" style="position:absolute;left:0px;top:0px;width:163px;height:259px;z-index:1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png">
			<img id="bt_jbr6" style="position: absolute;left:92px;top:12px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<div style="position:absolute;left:10px;top:212px; width:110px;height:25px;z-index:11;">
				<p id="bt_p6" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:121px;top:210px; width:24px;height:25px;z-index:10;">
				<p id="bt_1p6" class="p1" style="position:absolute; left:0px; top:0px; width:24px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:10px;top:230px; width:110px;height:25px;z-index:11;">
				<p id="bt_2p6" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:gray; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
		</div>
		<div id="div_f7" style="position: absolute; left: 647px; top: 371px; display: block;">
			<img id="bt_s7" style="position: absolute;left:14px;top:12px;width:131px;height:197px;z-index:11;">
			<img id="bt_jb7" style="position: absolute;left:14px;top:12px;width:61px;height:60px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png">
			<img id="bt_f7" style="position: absolute;left:-27px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<img id="bt_bg7" style="position:absolute;left:0px;top:0px;width:163px;height:259px;z-index:1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png">
			<img id="bt_jbr7" style="position: absolute;left:92px;top:12px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<div style="position:absolute;left:10px;top:212px; width:110px;height:25px;z-index:11;">
				<p id="bt_p7" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:121px;top:210px; width:24px;height:25px;z-index:10;">
				<p id="bt_1p7" class="p1" style="position:absolute; left:0px; top:0px; width:24px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:10px;top:230px; width:110px;height:25px;z-index:11;">
				<p id="bt_2p7" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:gray; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
		</div>
		<div id="div_f8" style="position: absolute; left: 828px; top: 371px; display: block;">
			<img id="bt_s8" style="position: absolute;left:14px;top:12px;width:131px;height:197px;z-index:11;">
			<img id="bt_jb8" style="position: absolute;left:14px;top:12px;width:61px;height:60px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png">
			<img id="bt_f8" style="position: absolute;left:-29px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<img id="bt_bg8" style="position:absolute;left:0px;top:0px;width:163px;height:259px;z-index:1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png">
			<img id="bt_jbr8" style="position: absolute;left:92px;top:12px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<div style="position:absolute;left:10px;top:212px; width:110px;height:25px;z-index:11;">
				<p id="bt_p8" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:121px;top:210px; width:24px;height:25px;z-index:10;">
				<p id="bt_1p8" class="p1" style="position:absolute; left:0px; top:0px; width:24px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:10px;top:230px; width:110px;height:25px;z-index:11;">
				<p id="bt_2p8" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:gray; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
		</div>
		<div id="div_f9" style="position: absolute; left: 1009px; top: 371px; display: block;">
			<img id="bt_s9" style="position: absolute;left:14px;top:12px;width:131px;height:197px;z-index:11;">
			<img id="bt_jb9" style="position: absolute;left:14px;top:12px;width:61px;height:60px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png">
			<img id="bt_f9" style="position: absolute;left:-29px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<img id="bt_bg9" style="position:absolute;left:0px;top:0px;width:163px;height:259px;z-index:1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png">
			<img id="bt_jbr9" style="position: absolute;left:92px;top:12px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<div style="position:absolute;left:10px;top:212px; width:110px;height:25px;z-index:11;">
				<p id="bt_p9" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:121px;top:210px; width:24px;height:25px;z-index:10;">
				<p id="bt_1p9" class="p1" style="position:absolute; left:0px; top:0px; width:24px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
			<div style="position:absolute;left:10px;top:230px; width:110px;height:25px;z-index:11;">
				<p id="bt_2p9" class="p1" style="position:absolute; left:0px; top:0px; width:110px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:gray; overflow:hidden; margin:0; padding:0;z-index:100"></p>
			</div>
		</div>
		<div id="d_b0" style="position: absolute; left: 285px; top: 459px; display: block;">
			<div id="div_b0" style="background-image: url(&quot;http://pic.imgo2.ahct.lv1.vcache.cn/images/20170412/212281/91030001000000080000000000026140.jpg&quot;); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 148px; width: 131px; height: 197px; position: absolute; left: 14px; top: 62px; z-index: 10;">
			</div>
			<img id="im_b0" style="position: absolute;left:14px;top:210px;width:61px;height:49px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png">
			<div style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png');background-repeat:no-repeat;background-size:100%;background-position:0px 194px;width:163px;height:259px;position: absolute;left:0px;top:0px;z-index:1;">
			</div>
			<img id="im_jb0" style="position: absolute;left:92px;top:210px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div id="d_b1" style="position: absolute; left: 466px; top: 459px; display: block;">
			<div id="div_b1" style="background-image: url(&quot;http://pic.wasu.ahct.lv1.vcache.cn/hstv/images/2016-12/15/cb21804f876f49b28778be5128ad0cff.jpg&quot;); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 148px; width: 131px; height: 197px; position: absolute; left: 14px; top: 62px; z-index: 10;">
			</div>
			<img id="im_b1" style="position: absolute;left:14px;top:210px;width:61px;height:49px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png">
			<div style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png');background-repeat:no-repeat;background-size:100%;background-position:0px 194px;width:163px;height:259px;position: absolute;left:0px;top:0px;z-index:1;">
			</div>
			<img id="im_jb1" style="position: absolute;left:92px;top:210px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div id="d_b2" style="position: absolute; left: 647px; top: 459px; display: block;">
			<div id="div_b2" style="background-image: url(&quot;http://pic.youku.ahct.lv1.vcache.cn/asset/inject/050E000053E0365667379F11250E980D.jpg&quot;); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 148px; width: 131px; height: 197px; position: absolute; left: 14px; top: 62px; z-index: 10;">
			</div>
			<img id="im_b2" style="position: absolute;left:14px;top:210px;width:61px;height:49px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png">
			<div style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png');background-repeat:no-repeat;background-size:100%;background-position:0px 194px;width:163px;height:259px;position: absolute;left:0px;top:0px;z-index:1;">
			</div>
			<img id="im_jb2" style="position: absolute;left:92px;top:210px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div id="d_b3" style="position: absolute; left: 828px; top: 459px; display: block;">
			<div id="div_b3" style="background-image: url(&quot;http://pic.wasu.ahct.lv1.vcache.cn/hstv/images/c2585d69c3f5460baf8b49b020ee99d2.jpg&quot;); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 148px; width: 131px; height: 197px; position: absolute; left: 14px; top: 62px; z-index: 10;">
			</div>
			<img id="im_b3" style="position: absolute;left:14px;top:210px;width:61px;height:49px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png">
			<div style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png');background-repeat:no-repeat;background-size:100%;background-position:0px 194px;width:163px;height:259px;position: absolute;left:0px;top:0px;z-index:1;">
			</div>
			<img id="im_jb3" style="position: absolute;left:92px;top:210px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div id="d_b4" style="position: absolute; left: 1009px; top: 459px; display: block;">
			<div id="div_b4" style="background-image: url(&quot;http://pic.youku.ahct.lv1.vcache.cn/asset/inject/050E000051B7DDDD67583935120D08DE.jpg&quot;); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 148px; width: 131px; height: 197px; position: absolute; left: 14px; top: 62px; z-index: 10;">
			</div>
			<img id="im_b4" style="position: absolute;left:14px;top:210px;width:61px;height:49px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png">
			<div style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-white.png');background-repeat:no-repeat;background-size:100%;background-position:0px 194px;width:163px;height:259px;position: absolute;left:0px;top:0px;z-index:1;">
			</div>
			<img id="im_jb4" style="position: absolute;left:92px;top:210px;width:56px;height:29px;z-index:11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>

		<div style="position: absolute;left:1006px;top:10px;">
			<p id="n_s" style="position:absolute; left:0px; top:0px; width:220px; height:35px; line-height:35px; text-align:left; font-size:23px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第1页/共6页</p>
		</div>
	</div>
	<img id="bt_prev_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px; width:1px;height:1px">
	<img id="bt_next_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px; width:1px;height:1px">
	<div style="position:absolute;left:290px;top:12px; width:33px;height:45px;z-index:10;"></div>
	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdg_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>
	<img id="visitRecord" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/record.png" style="position: absolute;left:1px;top:1px" height="0" width="0">
	<div id="test" style="position: absolute;left:20px;top:300px;font-size:30px;color:#FF0000;">
	<img id="stat" style="left: 1px; top: 1px; position: absolute;" src=""> 
	</div>
	<script type="text/javascript">
	function _STAT(_stat) { //用户点击行为上报
	    _stat = encodeURI(encodeURI(_stat));
	    var _url = 'http://sta.jisu8.cn/stat?category=' + _stat +'&contid=&style=&label=&id=6955&action=click&account='+userId+'&plat=&vlauncher=&vterminal=';
	    _SELECT('stat').src = _url;
    }
	</script>

</body>

</html>
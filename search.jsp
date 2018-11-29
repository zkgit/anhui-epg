<%@page import="java.net.URLEncoder"%>
<%@page import="com.vstartek.epg.utils.HttpLinkUtils"%>
<%@page import="com.vstartek.epg.pojo.SearchHistory"%>
<%@page import="com.vstartek.epg.action.UserAction"%>
<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	
	String programType=RequestUtil.getString("programType", request);

	String focus_id=RequestUtil.getString("focus_id", request);
	String programa_id=RequestUtil.getString("programa_id", request);
	String perv_num=RequestUtil.getString("perv_num", request);
	int perv_count=RequestUtil.getInt("perv_count", request);
	String pf_focus_id=RequestUtil.getString("pf_focus_id", request);
	
	String home_focus_id=RequestUtil.getString("home_focus_id", request);
	String home_from=RequestUtil.getString("home_from", request);
	
	String backUrl=RequestUtil.getString("backUrl", request);//接受backUrl
	String backUrl_encode=URLEncoder.encode(backUrl,"UTF-8");

	if("".equals(focus_id)){
		if("".equals(programa_id)){
			focus_id="bt_fA";
		}else{
			focus_id="bt_if0";
		}		
	}
	
	String programType_ZH=HttpLinkUtils.getProgramType_ZH(programType);
	
	String pervUrl="&back=search&focus_id="+focus_id+"&programa_id="+programa_id+"&perv_num="+perv_num+"&perv_count="+(perv_count+1)+"&pf_focus_id="+pf_focus_id+"&home_focus_id="+home_focus_id+"&home_from="+home_from+"&backUrl="+backUrl_encode;
	String pervUrl2="&home_focus_id="+home_focus_id+"&home_from="+home_from+"&backUrl="+backUrl_encode;
	String detailpage="detail";
	if("arts".equals(programType)){
		detailpage="detail_arts";
	}else if("film".equals(programType)){
		detailpage="detail";
	}else{
		detailpage="detail_tv";
	}
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
	<META content="IE=5.0000" http-equiv="X-UA-Compatible">
	<META name="page-view-size" content="1280*720">
	<META http-equiv="Content-Type" content="text/html; charset=utf-8">
	<TITLE>SEARCH</TITLE>
	<jsp:include page="/common/top.jsp" >
		<jsp:param name="t" value="<%=System.currentTimeMillis() %>"/>
	</jsp:include>
	<script src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/webxiri_1.0.8.js" type="text/javascript"></script>
	<SCRIPT type="text/javascript">
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
		
		// function _SELECT(id) {
		//     if (id == '' || id == null) {
		//         return false;
		//     } else {
		//         return document.getElementById(id);
		//     }
		// }
		
		var _BS = {};

		function init() {
			for (var i = 0; i < buttons.length; ++i) {
				var _b = buttons[i];
				this._BS[_b.id] = _b;
			}
			if (_BS[focus_id] != undefined && _SELECT(focus_id) != undefined) {
				_SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
				if (_BS[focus_id]['focusImage'] != 'Pixel.png') {
					var gb = _SELECT(focus_id);
					_SELECT("DIV_F").style.left = gb.getBoundingClientRect().left + "px";
					_SELECT("DIV_F").style.top = gb.getBoundingClientRect().top + "px";
					//			_SELECT("IMG_F").src ='http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'+_BS[focus_id]['focusImage'];
				}
				DOBUTTONFOCUSFUN(focus_id);
				var show_id = focus_id.replace('f', 's');
				_SH(show_id);
				//		_H_F("bt_fA");//初始化时给A添加焦点样式
			}
			getHistoryList();//获取历史记录列表
		}

		function _H_F(_id) {
			
			/*if (focus_id.indexOf('bt_if') >= 0) {
				var show_id = focus_id.replace('f', 's');
				var black_id = focus_id.replace('f', 'bg');
				var jb_id = focus_id.replace('f', 'jb');
				_TF(show_id, 1.0);
				_TF(black_id, 1.0);
				_FD(jb_id, 1.0, 1.0);
				_TF('DIV_F', 1.0);
			}*/
			if (_BS[focus_id] != undefined && _BS[_id] != undefined && _SELECT(focus_id) != undefined && _SELECT(_id) != undefined) {
				_SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['blurImage'];
				DOBUTTONBLURFUN(focus_id);  
				var show_id = focus_id.replace('f', 's');
				if (_SELECT(show_id)) {
					_SELECT(show_id).className = '';
				}

				if (focus_id.indexOf('bt_hf') >= 0) {
					var show_id = focus_id.replace('f', 'm');
					var black_id = focus_id.replace('f', 'b');
					var jb_id = focus_id.replace('f', 'bg');
					_TF(show_id, 1.0);
					_TF(black_id, 1.0);
					_FD(jb_id, 1.0, 1.0);
					_TF('DIV_F', 1.0);
				} else if (focus_id.indexOf('bt_if') >= 0) {
					var show_id = focus_id.replace('f', 's');
					var black_id = focus_id.replace('f', 'bg');
					var jb_id = focus_id.replace('f', 'jb');
					_TF(show_id, 1.0);
					_TF(black_id, 1.0);
					_FD(jb_id, 1.0, 1.0);
					_TF('DIV_F', 1.0);
				} else if (focus_id.indexOf('bt_nf') >= 0) {
					var show_id = focus_id.replace('f', 'm');
					var black_id = focus_id.replace('f', 'b');
					var jb_id = focus_id.replace('f', 'jb');
					_TF(show_id, 1.0);
					_TF(black_id, 1.0);
					_FD(jb_id, 1.0, 1.0);
					_TF('DIV_F', 1.0);
				}
				focus_id = _id;
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
						_SELECT("DIV_F").className = '';
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
					if (focus_id.indexOf('bt_hf') >= 0) {
						var show_id = focus_id.replace('f', 'm');
						var black_id = focus_id.replace('f', 'b');
						var jb_id = focus_id.replace('f', 'bg');
						if (_SELECT(show_id)) {
							//   _SELECT(show_id).className = 'WTD';
						}
						if (_SELECT(black_id)) {
							//    _SELECT(black_id).className = 'WTD';
						}
						if (_SELECT(jb_id)) {
							//    _SELECT(jb_id).className = 'WTD';
						}
						_TF(show_id, 1.1);
						_TF(black_id, 1.1);
						_FD(jb_id, 1.3, 1.4);
						_TF('DIV_F', 1.1);
					} else if (focus_id.indexOf('bt_if') >= 0) {
						var show_id = focus_id.replace('f', 's');
						var black_id = focus_id.replace('f', 'bg');
						var jb_id = focus_id.replace('f', 'jb');
						if (_SELECT(show_id)) {
							//    _SELECT(show_id).className = 'WTD';
						}
						if (_SELECT(black_id)) {
							//    _SELECT(black_id).className = 'WTD';
						}
						if (_SELECT(jb_id)) {
							//    _SELECT(jb_id).className = 'WTD';
						}
						_TF(show_id, 1.1);
						_TF(black_id, 1.1);
						_FD(jb_id, 1.3, 1.4);
						_TF('DIV_F', 1.1);
					} else if (focus_id.indexOf('bt_nf') >= 0) {
						var show_id = focus_id.replace('f', 'm');
						var black_id = focus_id.replace('f', 'b');
						var jb_id = focus_id.replace('f', 'jb');
						if (_SELECT(show_id)) {
							//    _SELECT(show_id).className = 'WTD';
						}
						if (_SELECT(black_id)) {
							//    _SELECT(black_id).className = 'WTD';
						}
						if (_SELECT(jb_id)) {
							//    _SELECT(jb_id).className = 'WTD';
						}
						_TF(show_id, 1.1);
						_TF(black_id, 1.1);
						_FD(jb_id, 1.3, 1.4);
						_TF('DIV_F', 1.1);
					}
					_SELECT("DIV_F").style.zIndex = 11;
				}
				//		_SELECT("DIV_F").style.left = $("#" + focus_id + "").offset().left;
				//		_SELECT("DIV_F").style.top = $("#" + focus_id + "").offset().top;
				var gb = _SELECT(focus_id);
				_SELECT("DIV_F").style.left = gb.getBoundingClientRect().left + "px";
				_SELECT("DIV_F").style.top = gb.getBoundingClientRect().top + "px";
				DOBUTTONFOCUSFUN(focus_id);
				show_id = focus_id.replace('f', 's');
				_SH(show_id);
			}
			if (focus_id.indexOf('bt_if') >= 0) {
				 setTimeout(function(){
					if (focus_id.indexOf('bt_if') >= 0) {
						var show_id = focus_id.replace('f', 's');
						var black_id = focus_id.replace('f', 'bg');
						var jb_id = focus_id.replace('f', 'jb');
						_TF(show_id, 1.0);
						_TF(black_id, 1.0);
						_FD(jb_id, 1.0, 1.0);
						_TF('DIV_F', 1.0);
					}
				},300);
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

		var backUrl = 'list.jsp?programType=<%=programType%>&focus_id=bt_search&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>';

		function F_KEY_G_0() {
			window.location.href = backUrl;
		}

		function F_KEY_N_0() {
			window.location.href = backUrl;
		}

		var buttons = [{
				id: 'bt_if0',
				upButtonId: 'bt_prev_f',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_pdg',
				rightButtonId: 'bt_if1',
				blurFun: 'F_B_F0',
				focusFun: 'F_F_F0',
				enterFun: 'F_E_FPAGE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_if1',
				upButtonId: 'bt_prev_f',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_if0',
				rightButtonId: 'bt_if2',
				blurFun: 'F_B_F0',
				focusFun: 'F_F_F0',
				enterFun: 'F_E_FPAGE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_if2',
				upButtonId: 'bt_prev_f',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_if1',
				rightButtonId: 'bt_if3',
				blurFun: 'F_B_F0',
				focusFun: 'F_F_F0',
				enterFun: 'F_E_FPAGE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_if3',
				upButtonId: 'bt_prev_f',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_if2',
				rightButtonId: 'bt_if4',
				blurFun: 'F_B_F0',
				focusFun: 'F_F_F0',
				enterFun: 'F_E_FPAGE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_if4',
				upButtonId: 'bt_if0',
				downButtonId: 'bt_next_f',
				leftButtonId: 'bt_pdg',
				rightButtonId: 'bt_if5',
				blurFun: 'F_B_F0',
				focusFun: 'F_F_F0',
				enterFun: 'F_E_FPAGE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_if5',
				upButtonId: 'bt_if1',
				downButtonId: 'bt_next_f',
				leftButtonId: 'bt_if4',
				rightButtonId: 'bt_if6',
				blurFun: 'F_B_F0',
				focusFun: 'F_F_F0',
				enterFun: 'F_E_FPAGE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_if6',
				upButtonId: 'bt_if2',
				downButtonId: 'bt_next_f',
				leftButtonId: 'bt_if5',
				rightButtonId: 'bt_if7',
				blurFun: 'F_B_F0',
				focusFun: 'F_F_F0',
				enterFun: 'F_E_FPAGE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_if7',
				upButtonId: 'bt_if3',
				downButtonId: 'bt_next_f',
				leftButtonId: 'bt_if6',
				rightButtonId: '',
				blurFun: 'F_B_F0',
				focusFun: 'F_F_F0',
				enterFun: 'F_E_FPAGE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			},

			{
				id: 'bt_hf0',
				upButtonId: '',
				downButtonId: 'bt_hi0',
				leftButtonId: 'bt_pdg',
				rightButtonId: 'bt_hf1',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_F_HOT',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_hf1',
				upButtonId: '',
				downButtonId: 'bt_hi0',
				leftButtonId: 'bt_hf0',
				rightButtonId: 'bt_hf2',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_F_HOT',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_hf2',
				upButtonId: '',
				downButtonId: 'bt_hi1',
				leftButtonId: 'bt_hf1',
				rightButtonId: 'bt_hf3',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_F_HOT',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_hf3',
				upButtonId: '',
				downButtonId: 'bt_hi1',
				leftButtonId: 'bt_hf2',
				rightButtonId: 'bt_hf4',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_F_HOT',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			},

			{
				id: 'bt_nf0',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: 'bt_pdg',
				rightButtonId: 'bt_nf1',
				blurFun: 'F_B_NM0',
				focusFun: 'F_F_NM',
				enterFun: 'F_E_F_LIKE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_nf1',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: 'bt_nf0',
				rightButtonId: 'bt_nf2',
				blurFun: 'F_B_NM0',
				focusFun: 'F_F_NM',
				enterFun: 'F_E_F_LIKE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_nf2',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: 'bt_nf1',
				rightButtonId: 'bt_nf3',
				blurFun: 'F_B_NM0',
				focusFun: 'F_F_NM',
				enterFun: 'F_E_F_LIKE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_nf3',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: 'bt_nf2',
				rightButtonId: '',
				blurFun: 'F_B_NM0',
				focusFun: 'F_F_NM',
				enterFun: 'F_E_F_LIKE',
				focusImage: 'index-poster-f.png',
				blurImage: 'Pixel.png'
			},
			//bt_hi0--bt_hi7搜索历史对应的8个元素
			{
				id: 'bt_hi0',
				upButtonId: 'bt_h_pdg',
				downButtonId: 'bt_hi2',
				leftButtonId: 'bt_pdg',
				rightButtonId: 'bt_hi1',
				blurFun: 'F_B_HM0',
				focusFun: 'F_F_HM',
				enterFun: 'F_E_NAME_SEARCH',
				focusImage: 'search-ls-f.png',
				blurImage: 'Pixel.png'
			},

			{
				id: 'bt_hi1',
				upButtonId: 'bt_h_pdg',
				downButtonId: 'bt_hi3',
				leftButtonId: 'bt_hi0',
				rightButtonId: 'bt_hi2',
				blurFun: 'F_B_HM0',
				focusFun: 'F_F_HM',
				enterFun: 'F_E_NAME_SEARCH',
				focusImage: 'search-ls-f.png',
				blurImage: 'Pixel.png'
			},

			{
				id: 'bt_hi2',
				upButtonId: 'bt_hi0',
				downButtonId: 'bt_hi4',
				leftButtonId: 'bt_pdg',
				rightButtonId: 'bt_hi3',
				blurFun: 'F_B_HM0',
				focusFun: 'F_F_HM',
				enterFun: 'F_E_NAME_SEARCH',
				focusImage: 'search-ls-f.png', //search-ls-f.png
				blurImage: 'Pixel.png'
			},

			{
				id: 'bt_hi3',
				upButtonId: 'bt_hi1',
				downButtonId: 'bt_hi5',
				leftButtonId: 'bt_hi2',
				rightButtonId: 'bt_hi4',
				blurFun: 'F_B_HM0',
				focusFun: 'F_F_HM',
				enterFun: 'F_E_NAME_SEARCH',
				focusImage: 'search-ls-f.png', //search-ls-f.png
				blurImage: 'Pixel.png'
			},

			{
				id: 'bt_hi4',
				upButtonId: 'bt_hi2',
				downButtonId: 'bt_hi6',
				leftButtonId: 'bt_pdg',
				rightButtonId: 'bt_hi5',
				blurFun: 'F_B_HM0',
				focusFun: 'F_F_HM',
				enterFun: 'F_E_NAME_SEARCH',
				focusImage: 'search-ls-f.png',
				blurImage: 'Pixel.png'
			},

			{
				id: 'bt_hi5',
				upButtonId: 'bt_hi3',
				downButtonId: 'bt_hi7',
				leftButtonId: 'bt_hi4',
				rightButtonId: 'bt_hi6',
				blurFun: 'F_B_HM0',
				focusFun: 'F_F_HM',
				enterFun: 'F_E_NAME_SEARCH',
				focusImage: 'search-ls-f.png',
				blurImage: 'Pixel.png'
			},

			{
				id: 'bt_hi6',
				upButtonId: 'bt_hi4',
				downButtonId: 'bt_hi8',
				leftButtonId: 'bt_pdg',
				rightButtonId: 'bt_hi7',
				blurFun: 'F_B_HM0',
				focusFun: 'F_F_HM',
				enterFun: 'F_E_NAME_SEARCH',
				focusImage: 'search-ls-f.png',
				blurImage: 'Pixel.png'
			},

			{
				id: 'bt_hi7',
				upButtonId: 'bt_hi5',
				downButtonId: 'bt_hi9',
				leftButtonId: 'bt_hi6',
				rightButtonId: 'bt_hi8',
				blurFun: 'F_B_HM0',
				focusFun: 'F_F_HM',
				enterFun: 'F_E_NAME_SEARCH',
				focusImage: 'search-ls-f.png',
				blurImage: 'Pixel.png'
			},

			{
				id: 'bt_fA',
				upButtonId: 'bt_clear',
				downButtonId: 'bt_fG',
				leftButtonId: '',
				rightButtonId: 'bt_fB',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fB',
				upButtonId: 'bt_clear',
				downButtonId: 'bt_fH',
				leftButtonId: 'bt_fA',
				rightButtonId: 'bt_fC',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fC',
				upButtonId: 'bt_clear',
				downButtonId: 'bt_fI',
				leftButtonId: 'bt_fB',
				rightButtonId: 'bt_fD',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fD',
				upButtonId: 'bt_delete',
				downButtonId: 'bt_fJ',
				leftButtonId: 'bt_fC',
				rightButtonId: 'bt_fE',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fE',
				upButtonId: 'bt_delete',
				downButtonId: 'bt_fK',
				leftButtonId: 'bt_fD',
				rightButtonId: 'bt_fF',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fF',
				upButtonId: 'bt_delete',
				downButtonId: 'bt_fL',
				leftButtonId: 'bt_fE',
				rightButtonId: 'bt_tg',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fG',
				upButtonId: 'bt_fA',
				downButtonId: 'bt_fM',
				leftButtonId: 'bt_fF',
				rightButtonId: 'bt_fH',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fH',
				upButtonId: 'bt_fB',
				downButtonId: 'bt_fN',
				leftButtonId: 'bt_fG',
				rightButtonId: 'bt_fI',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fI',
				upButtonId: 'bt_fC',
				downButtonId: 'bt_fO',
				leftButtonId: 'bt_fH',
				rightButtonId: 'bt_fJ',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fJ',
				upButtonId: 'bt_fD',
				downButtonId: 'bt_fP',
				leftButtonId: 'bt_fI',
				rightButtonId: 'bt_fK',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fK',
				upButtonId: 'bt_fE',
				downButtonId: 'bt_fQ',
				leftButtonId: 'bt_fJ',
				rightButtonId: 'bt_fL',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fL',
				upButtonId: 'bt_fF',
				downButtonId: 'bt_fR',
				leftButtonId: 'bt_fK',
				rightButtonId: 'bt_tg',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fM',
				upButtonId: 'bt_fG',
				downButtonId: 'bt_fS',
				leftButtonId: 'bt_fL',
				rightButtonId: 'bt_fN',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fN',
				upButtonId: 'bt_fH',
				downButtonId: 'bt_fT',
				leftButtonId: 'bt_fM',
				rightButtonId: 'bt_fO',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fO',
				upButtonId: 'bt_fI',
				downButtonId: 'bt_fU',
				leftButtonId: 'bt_fN',
				rightButtonId: 'bt_fP',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fP',
				upButtonId: 'bt_fJ',
				downButtonId: 'bt_fV',
				leftButtonId: 'bt_fO',
				rightButtonId: 'bt_fQ',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fQ',
				upButtonId: 'bt_fK',
				downButtonId: 'bt_fW',
				leftButtonId: 'bt_fP',
				rightButtonId: 'bt_fR',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fR',
				upButtonId: 'bt_fL',
				downButtonId: 'bt_fX',
				leftButtonId: 'bt_fQ',
				rightButtonId: 'bt_tg',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fS',
				upButtonId: 'bt_fM',
				downButtonId: 'bt_fY',
				leftButtonId: 'bt_fR',
				rightButtonId: 'bt_fT',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fT',
				upButtonId: 'bt_fN',
				downButtonId: 'bt_fZ',
				leftButtonId: 'bt_fS',
				rightButtonId: 'bt_fU',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fU',
				upButtonId: 'bt_fO',
				downButtonId: 'bt_f1',
				leftButtonId: 'bt_fT',
				rightButtonId: 'bt_fV',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fV',
				upButtonId: 'bt_fP',
				downButtonId: 'bt_f2',
				leftButtonId: 'bt_fU',
				rightButtonId: 'bt_fW',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fW',
				upButtonId: 'bt_fQ',
				downButtonId: 'bt_f3',
				leftButtonId: 'bt_fV',
				rightButtonId: 'bt_fX',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fX',
				upButtonId: 'bt_fR',
				downButtonId: 'bt_f4',
				leftButtonId: 'bt_fW',
				rightButtonId: 'bt_tg',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fY',
				upButtonId: 'bt_fS',
				downButtonId: 'bt_f5',
				leftButtonId: 'bt_fX',
				rightButtonId: 'bt_fZ',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_fZ',
				upButtonId: 'bt_fT',
				downButtonId: 'bt_f6',
				leftButtonId: 'bt_fY',
				rightButtonId: 'bt_f1',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_f1',
				upButtonId: 'bt_fU',
				downButtonId: 'bt_f7',
				leftButtonId: 'bt_fZ',
				rightButtonId: 'bt_f2',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_f2',
				upButtonId: 'bt_fV',
				downButtonId: 'bt_f8',
				leftButtonId: 'bt_f1',
				rightButtonId: 'bt_f3',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_f3',
				upButtonId: 'bt_fW',
				downButtonId: 'bt_f9',
				leftButtonId: 'bt_f2',
				rightButtonId: 'bt_f4',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_f4',
				upButtonId: 'bt_fX',
				downButtonId: 'bt_f0',
				leftButtonId: 'bt_f3',
				rightButtonId: 'bt_tg',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_f5',
				upButtonId: 'bt_fY',
				downButtonId: '',
				leftButtonId: 'bt_f4',
				rightButtonId: 'bt_f6',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_f6',
				upButtonId: 'bt_fZ',
				downButtonId: '',
				leftButtonId: 'bt_f5',
				rightButtonId: 'bt_f7',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_f7',
				upButtonId: 'bt_f1',
				downButtonId: '',
				leftButtonId: 'bt_f6',
				rightButtonId: 'bt_f8',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_f8',
				upButtonId: 'bt_f2',
				downButtonId: '',
				leftButtonId: 'bt_f7',
				rightButtonId: 'bt_f9',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_f9',
				upButtonId: 'bt_f3',
				downButtonId: '',
				leftButtonId: 'bt_f8',
				rightButtonId: 'bt_f0',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_f0',
				upButtonId: 'bt_f4',
				downButtonId: '',
				leftButtonId: 'bt_f9',
				rightButtonId: 'bt_tg',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_K',
				focusImage: 'search-num-f.png',
				blurImage: 'search-num-bg.png'
			}, {
				id: 'bt_clear',
				upButtonId: '',
				downButtonId: 'bt_c_pdg',
				leftButtonId: '',
				rightButtonId: 'bt_delete',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_CLEAR',
				focusImage: 'search-clear-f.png',
				blurImage: 'search-clear-bg.png'
			}, {
				id: 'bt_delete',
				upButtonId: '',
				downButtonId: 'bt_d_pdg',
				leftButtonId: 'bt_clear',
				rightButtonId: 'bt_tg',
				blurFun: '',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_DELETE',
				focusImage: 'search-clear-f.png',
				blurImage: 'search-clear-bg.png'
			}, {
				id: 'bt_prev_f',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: 'bt_s0',
				blurFun: '',
				focusFun: 'F_KEY_G_2',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_next_f',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: 'bt_s9',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_KEY_G_3',
				enterFun: '',
				focusImage: '',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_tf0',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_KEY_G_3',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_pdg',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_F_PFG',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_c_pdg',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_C_PFG',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_d_pdg',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_D_PFG',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_h_pdg',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_H_PFG',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}, {
				id: 'bt_tg',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_H_TG',
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

		function F_E_K() {
			var content = focus_id.replace('bt_f', '');
			//	_SELECT("bt_content").append(content);
			_SELECT("bt_content").innerHTML = _SELECT("bt_content").innerHTML + content;
			if (_SELECT("like_item").style.visibility == "hidden") {
				F_E_SEARCH();
			}
		}

		//清空的enter事件
		function F_E_CLEAR() {
			
			var str = _SELECT("bt_content").innerHTML;
			str = "";
			_SELECT("bt_content").innerHTML = str;
			F_E_SEARCH();
			_SELECT("like_item").style.visibility = "hidden";
			_SELECT("itempage").style.visibility = "hidden";
			_SELECT("hotdiv").style.visibility = "visible";
			_SELECT("history_itemlist").style.visibility = "visible";
		}

		//回删
		function F_E_DELETE() {
			var str = _SELECT("bt_content").innerHTML;
			var newstr = str.substring(0, str.length - 1);
			_SELECT("bt_content").innerHTML = newstr;
			if (newstr.length > 0) {
				F_E_SEARCH();
			} else {
				F_E_SEARCH();
				_SELECT("itempage").style.visibility = "hidden";
				_SELECT("like_item").style.visibility = "hidden";
				_SELECT("hotdiv").style.visibility = "visible";
				_SELECT("history_itemlist").style.visibility = "visible";
			}
		}

		function F_KEY_GO_PAGE(index1) {
			
//			if (pagesum >= index1) {
				if (index1 <= pagesum) {
					item_itemId = [];
					itemitemId = [];
					item_behavior = [];
					item_item_charge = [];
					if_name = [];
					pf_name = [];
					item_redirect_url = [];
					item_video_name = [];
					var item_keyword = _SELECT("bt_content").innerHTML;
					var url = webset.solo+ 'search/searchResult.json?key=' + encodeURI(item_keyword) + '&from=epg&type=video&pageNo=' + index1+
						'&pageSize=8&videoType=<%=programType_ZH%>';
				} else {
					item_itemId = [];
					itemitemId = [];
					item_behavior = [];
					item_item_charge = [];
					if_name = [];
					pf_name = [];
					item_redirect_url = [];
					item_video_name = [];
					var item_keyword = _SELECT("bt_content").innerHTML;
					var url = webset.solo+ 'search/searchResult.json?key=' + encodeURI(item_keyword) + '&from=epg&type=video&pageNo=1&pageSize=8&videoType=<%=programType_ZH%>';					
				}
				$.get(url, function (result) {
					var json = eval('(' + result + ')');
					var itemlist = json.list;
					var pagenow = json.currentPage;
					pagesum = json.totalPage;
					p = json.currentPage;
					
					_SELECT("hotdiv").style.visibility = "hidden";
					_SELECT("history_itemlist").style.visibility = "hidden";
					var item_html =
						'<div style="position: absolute;left:880px;top:103px;"><p style="position:relative; left:0; top:0; width:230px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' +
						pagenow + '页/共' + pagesum + '页</p></div>';
					_SELECT("item_pages").innerHTML = item_html;
					var totalhtml2 = "";
					var html_1 = "";
					$.each(itemlist, function (i, item) {
						item_itemId.push(item.id);
						item_redirect_url.push(item.redirect_url);
						if_name.push(item.video_name);
						pf_name.push(item.video_name);
						item_video_name.push(item.video_name);

						html_1 = create_pageHtml(i, item.seriesCp_id, item.video_image, item.bcharging, item.item_corner, item.video_name); //调用公共拼html方法
						totalhtml2 += html_1;
					});
					var pagesumhtml =
						'<div style="position:absolute;left:880px;top:103px; width:33px;height:35px;z-index:10;"><p style="position:relative; left:0; top:0; width:300px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' +
						pagenow + '页/共' + pagesum + '页</p></div>';
					_SELECT("itempage").style.visibility = "visible";
					_SELECT("item_pages").innerHTML = totalhtml2 + pagesumhtml;
				},false);
//			}
			_H_F("bt_if0");
			 FYY3();
		}
		//focus事件
		function F_E_RF() {
			
			if (focus_id == "bt_fA" || focus_id == "bt_fB" || focus_id == "bt_fC") {
				pf_c_f = focus_id;
			} else if (focus_id == "bt_fD" || focus_id == "bt_fE" || focus_id == "bt_fF") {
				pf_d_f = focus_id;
			}
			pf_f = focus_id;
		}

		function F_F_PFG() {
			
			if (pf_f == "") {
				_H_F("bt_delete");
			} else {
				_H_F(pf_f);
			}

		}

		function F_C_PFG() {
			
			if (pf_c_f == "") {
				_H_F("bt_fA");
			} else {
				_H_F(pf_c_f);
			}
		}

		function F_D_PFG() {
			if (pf_d_f == "") {
				_H_F("bt_fD");
			} else {
				_H_F(pf_d_f);
			}

		}

		function F_H_PFG() {
			if (pf_h_f == "") {
				_H_F("bt_hf0");
			} else {
				_H_F(pf_h_f);
			}

		}

		function F_H_EH() {
			_SELECT(focus_id.replace('f', 'h')).innerHTML = '' + hot_itmes + "";
		}

		var pf_f = "";
		var pf_c_f = ""; //pf_clear_f
		var pf_d_f = ""; //pf_delete_f
		var pf_h_f = "";


		function F_KEY_G_1() {
			DOBUTTONENTERFUN(focus_id);
		}

		//节目名称滚动
		var item_name = '';

		function F_F_F0() {
			pf_f_f = focus_id;
			item_name = _SELECT(focus_id.replace('f', 'p')).innerHTML;
			if (item_name.length > 9) {
				_SELECT(focus_id.replace('f', 'p')).innerHTML = '<marquee direction="left">' + item_name + "</marquee>";
			}
		}

		function F_B_F0() {
			_SELECT(focus_id.replace('f', 'p')).innerHTML = '' + item_name + "";
		}
		//猜你喜欢节目名称滚动
		var like_items = '';

		function F_F_NM() {
			like_items = _SELECT(focus_id.replace('f', 'm')).innerHTML;
			if (like_items.length > 9) {
				_SELECT(focus_id.replace('f', 'm')).innerHTML = '<marquee direction="left">' + like_items + "</marquee>";
			}
		}

		function F_B_NM0() {
			_SELECT(focus_id.replace('f', 'm')).innerHTML = '' + like_items + "";
		}

		(function () {
			var ie = !!(window.attachEvent && !window.opera);
			var wk = /webkit\/(\d+)/i.test(navigator.userAgent) && (RegExp.$1 < 525);
			var fn = [];
			var run = function () {
				for (var i = 0; i < fn.length; i++) fn[i]();
			};
			var d = document;
			d.ready = function (f) {
				if (!ie && !wk && d.addEventListener)
					return d.addEventListener('DOMContentLoaded', f, false);
				if (fn.push(f) > 1) return;
				if (ie)
					(function () {
						try {
							d.documentElement.doScroll('left');
							run();
						} catch (err) {
							setTimeout(arguments.callee, 0);
						}
					})();
				else if (wk)
					var t = setInterval(function () {
						if (/^(loaded|complete)$/.test(d.readyState))
							clearInterval(t), run();
					}, 0);
			};
		})();
		/*
		 * 调用上面封装的原生document.ready，初始化
		 * */

		var hot_programa_id = "";
		var hot_itemId = new Array();
		var hot_behavior = new Array();
		var hot_item_charge = new Array();
		var userIdStr = "";
		if(!!userId){
			if(userId.length>4){
				userIdStr = userId.slice(userId.length-4,userId.length);
			}else{
				userIdStr=userId;
			}
		}

		var back = ''; // 返回路径		
		var programa_id = '<%=programa_id%>';//搜索的value:item_keyword2
		var perv_num = '<%="".equals(perv_num)?"1":perv_num%>';//页数p2				
		var pf_focus_id = '<%=pf_focus_id%>';//历史记录的影视名称
		var focus_id = '<%=focus_id%>';

		document.ready(function () {
			if (pf_focus_id != "") {
				hotitem_AJAX(pf_focus_id);
				getItemByName(pf_focus_id);
			} else {
				//初始化走的这里
				hotitem_AJAX(programa_id);
				if (programa_id != "") {
					getItemPage(programa_id);
//					like_item("");
				}
			}
		});

//根据记录页数和关键字查询
		function getItemPage(keyword) {
			
			var url = webset.solo+ 'search/searchResult.json?key=' + encodeURI(keyword) +
				'&from=epg&type=video&pageNo='+perv_num+'&pageSize=8&videoType=<%=programType_ZH%>';
			$.get(url, function(result) {
				item_itemId = [];
				itemitemId = [];
				item_behavior = [];
				item_item_charge = [];
				item_redirect_url = [];
				if_name = [];
				var json = eval('(' + result + ')');
				var itemlist = json.list;
				var pagenow = json.currentPage;
				pagesum = json.totalPage;
				
				if (itemlist.length > 0) {
					p = json.currentPage;
					_SELECT("hotdiv").style.visibility = "hidden";
					_SELECT("history_itemlist").style.visibility = "hidden";
					var item_html = '<div style="position: absolute;left:880px;top:103px;"><p style="position:relative; left:0; top:0; width:230px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' + pagenow + '页/共' + pagesum + '页</p></div>';
					_SELECT("item_pages").innerHTML = item_html;
					var totalhtml2 = "";
					var html_1 = "";
					$.each(itemlist, function(i, item) {
						item_itemId.push(item.id);
						item_redirect_url.push(item.redirect_url);
						if_name.push(item.video_name);
						html_1 = create_pageHtml(i, item.seriesCp_id, item.video_image, item.bcharging, item.item_corner, item.video_name); //调用公共拼html方法
						totalhtml2 += html_1;
					});
					var pagesumhtml = '<div style="position:absolute;left:880px;top:103px; width:33px;height:35px;z-index:10;"><p style="position:relative; left:0; top:0; width:300px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' + pagenow + '页/共' + pagesum + '页</p></div>';
					_SELECT("itempage").style.visibility = "visible";
					_SELECT("item_pages").innerHTML = totalhtml2 + pagesumhtml;
				} else {
					if (_SELECT("likeitems").innerHTML == null || _SELECT("likeitems").innerHTML == "") {
						like_item(keyword);
					} else {
						_SELECT("hotdiv").style.visibility = "hidden";
						_SELECT("history_itemlist").style.visibility = "hidden";
						_SELECT("itempage").style.visibility = "hidden";
						_SELECT("like_item").style.visibility = "visible";
					}
				}
				// 
			},false);
			_H_F('bt_fA');
		}
//历史记录进入详情后返回
		function getItemByName(item_name) {
			
			var url = webset.solo+ 'search/searchResult.json?key=' + encodeURI(item_name) +'&type=video&from=epg&pageNo=1&pageSize=8&videoType=<%=programType_ZH%>';
			$.get(url, function(result) {
				item_itemId = [];
				itemitemId = [];
				item_behavior = [];
				item_item_charge = [];
				item_redirect_url = [];
				if_name = [];
				var json = eval('(' + result + ')');
				var itemlist = json.list;
				var pagenow = json.currentPage;
				pagesum = json.totalPage;
				_SELECT("hotdiv").style.visibility = "hidden";
				_SELECT("history_itemlist").style.visibility = "hidden";
				_SELECT("like_item").style.visibility = "hidden";
				var item_html = '<div style="position: absolute;left:880px;top:103px;"><p style="position:relative; left:0; top:0; width:230px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' + pagenow + '页/共' + pagesum + '页</p></div>';
				_SELECT("item_pages").innerHTML = item_html;
				var totalhtml2 = "";
				var html_1 = "";
				$.each(itemlist, function(i, item) {
					item_itemId.push(item.id);
					item_redirect_url.push(item.redirect_url);
					if_name.push(item.video_name);
					html_1 = create_pageHtml(i, item.seriesCp_id, item.video_image, item.bcharging, item.item_corner, item.video_name); //调用公共拼html方法
					totalhtml2 += html_1;
				});
				var pagesumhtml = '<div style="position:absolute;left:880px;top:103px; width:33px;height:35px;z-index:10;"><p style="position:relative; left:0; top:0; width:300px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' + pagenow + '页/共' + pagesum + '页</p></div>';
				_SELECT("itempage").style.visibility = "visible";
				_SELECT("item_pages").innerHTML = totalhtml2 + pagesumhtml;				
			},false);
		}

		//初始化热门搜索
		var hot_cpcode = new Array();
		function hotitem_AJAX(item_keyword2) {
			
			var totalhtml = "";
			hf_name = [];
			hot_cpcode = [];
			hot_itemId = [];
			hot_code =[];
			var url = webset.apiStatic + 'programType/tag/<%=programType%>_search.json';
			$.get(url, function (result) {
				var json = eval('(' + result + ')');
				var hotlist = json.programTypeHotList;
				$.each(hotlist, function (i, item) {
					hot_itemId.push(item.id);
					hot_cpcode.push(item.cpCode);
					hot_code.push(item.code);
					hot_behavior.push(item.videoType); //根据videoType判断是否是进入播放器或是跳转到详情
					hot_item_charge.push(item.bcharging); //0 免费  1付费
					hf_name.push(item.title);

					var divhtml = '<div style="position: absolute;left:' + (454 + (i - 0) * 189) + 'px;top:102px;">';
					/*封面大图片*/
					var image1 = '<img id="bt_hm' + i + '" src="' + item.imagetv +
						'" style="position: absolute;left:20px;top:18px;;width:180px;height:240px;z-index:1;-webkit-transition-duration:300ms;transition-duration:300ms;">';
					/*背景底部黑色透明图片*/
					var image2 = '<img id="bt_hb' + i +
						'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png" style="position: absolute;left:20px;top:18px;;width:180px;height:240px;z-index:2;">';
					var image3 = '<img id="bt_hf' + i +
						'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:220px;height:278px;"/>';
					/*右上角小图标*/
					//暂时干掉
					var image4 =
						'<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:145px;top:18px;;width:56px;height:29px;z-index:10;"/></div>';
					var div2html = '<div style="position: absolute;left:' + (474 + (i - 0) * 189) + 'px;top:326px;z-index:10;">';
					/*title*/
					var p = '<p id="bt_hh' + i +
						'" style="position:relative; left:0px; top:0px; width:180px; height:30px; line-height:30px; text-align:center; font-size:19px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">' +
						item.title + '</p></div>';
					/*左上角会员or免费判断 :0 免费  1付费*/
					if (item.bcharging == 1) {
						var div3html = '<div style="position:absolute;left:' + (474 + (i - 0) * 189) +
							'px;top:120px; width:61px;height:35px;z-index:10;"><img id="bt_hbg' + i +
							'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png" style="position: absolute;left:0px;top:0px;;width:61px;height:60px;z-index:10;-webkit-transition-duration:300ms;transition-duration:300ms;"/></div>';
					} else if (item.bcharging == 0) {
						var div3html = '<div style="position:absolute;left:' + (474 + (i - 0) * 189) +
							'px;top:120px; width:61px;height:35px;z-index:10;"><img id="bt_hbg' + i +
							'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png" style="position: absolute;left:0px;top:0px;;width:61px;height:60px;z-index:10;-webkit-transition-duration:300ms;transition-duration:300ms;"/></div>';
					} else {
						var div3html = '<div style="position:absolute;left:' + (474 + (i - 0) * 189) +
							'px;top:120px; width:61px;height:35px;z-index:10;"><img id="bt_hbg' + i +
							'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:61px;height:60px;z-index:10;-webkit-transition-duration:300ms;transition-duration:300ms;"/></div>';
					}
					totalhtml += divhtml + image1 + image2 + image3 + image4 + div2html + p + div3html;
				});
				//var hot_p = '<div style="position: absolute;left:474px;top:40px;"><p style="position:relative; left:0px; top:20px; width:371px; height:45px; line-height:45px; text-align:left; font-size:20px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">热门搜索</p><hr style="position:relative; left:0px; top:10px; width:747px;"></div>';
				_SELECT("hotpage").innerHTML = totalhtml;
				if (item_keyword2 == "") {
					_SELECT("hotdiv").style.visibility = "visible";
					_SELECT("history_itemlist").style.visibility = "visible";
				}
			},false);
			FYY();
		}

		/******************************************/

		//热门播放节目进详情
		function F_E_F_HOT() {
			
			var i = parseInt(focus_id.replace('bt_hf', ''));
			var programa_id = _SELECT("bt_content").innerHTML;
//当为动漫的时候进入播放器，否则进入详情
			var _cpcode = hot_cpcode[i],
            _code = hot_code[i],
            _id = hot_itemId[i],
            _programType='<%=programType%>',
            _programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
            switch (_programType) {
                case 'anime':
                    commen_play(_id,_programType,_programType2,_code,_cpcode,'<%=pervUrl%>');
                    break;
                default:
                	window.location.href = '<%=detailpage%>.jsp?id='+hot_itemId[i]+'&programType=<%=programType%>&code='+hot_code[i]+'&cpcode='+hot_cpcode[i]+'&back=search<%=pervUrl2%>&focus_id='+focus_id+'&programa_id=';
            }		
		}

		//搜索历史元素的enter事件
		var historyNameForDetail = "";
		function F_E_NAME_SEARCH() {
			//获取搜索历史中当前焦点所在元素的标题
			var i = parseInt(focus_id.replace('bt_hi', ''));
			var item_name = _SELECT("bt_pi" + i).innerHTML;
			historyNameForDetail = item_name;
			
			var url = webset.solo+ 'search/searchResult.json?key=' + encodeURI(item_name) + '&from=epg&type=video&pageNo=1&pageSize=8&videoType=<%=programType_ZH%>';
			$.get(url, function (result) {
				
				item_itemId = [];
				itemitemId = [];
				item_behavior = [];
				item_item_charge = [];
				item_redirect_url = [];
				if_name = [];
				pf_name = [];

				var json = eval('(' + result + ')');
				var itemlist = json.list;
				var pagenow = 1;//暂时写死
				pagesum = 1;
				p = 1;

				_SELECT("hotdiv").style.visibility = "hidden";
				_SELECT("history_itemlist").style.visibility = "hidden";
				var item_html =
					'<div style="position: absolute;left:880px;top:103px;"><p style="position:relative; left:0; top:0; width:230px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' +
					pagenow + '页/共' + pagesum + '页</p></div>';
				_SELECT("item_pages").innerHTML = item_html;
				var totalhtml2 = "";
				var html_1 = "";
				$.each(itemlist, function (i, item) {

					item_itemId.push(item.id);
					item_redirect_url.push(item.redirect_url);
					if_name.push(item.video_name);
					pf_name.push(item.video_name);

					html_1 = create_pageHtml(i, item.id, item.video_image, item.bcharging, item.item_corner, item.video_name); //调用公共拼html方法
					totalhtml2 += html_1;
				});

				var pagesumhtml =
					'<div style="position:absolute;left:880px;top:103px; width:33px;height:35px;z-index:10;"><p style="position:relative; left:0; top:0; width:300px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' +
					pagenow + '页/共' + pagesum + '页</p></div>';
				_SELECT("itempage").style.visibility = "visible";
				_SELECT("item_pages").innerHTML = totalhtml2 + pagesumhtml;
				_H_F("bt_if0");
				if(!itemlist.length){//如果没有搜到处理
					_H_F("bt_fA");
					like_item();
					_SELECT("hotdiv").style.visibility = "hidden";
					_SELECT("history_itemlist").style.visibility = "hidden";
					_SELECT("itempage").style.visibility = "hidden";
					_SELECT("like_item").style.visibility = "visible";
				}
			},false);
			FYY3();
			_H_F("bt_if0");
		}

		var item_itemId = new Array();
		var itemitemId = new Array();
		var item_behavior = new Array();
		var item_item_charge = new Array();
		var p;
		var pagesum = 0;
		var item_redirect_url = new Array(); 

		//拼接html的公共方法
		function create_pageHtml(i, item_id, item_poster, item_charge, item_corner, item_name) {
			/*	 
			 * item_poster 主题图片
			 * item_name  影视名称
			 * item_charge  左上角会员or免费判断字段
			 * item_corner  右上角小图片
			 * */
			var t_html = "";
			var divhtml = "";
			if (i < 4) {
				divhtml = '<div style="position:absolute;left:' + (449 + (i - 0) * 189) + 'px;top:115px;">';
			} else {
				divhtml = '<div style="position:absolute;left:' + (449 + (i - 4) * 189) + 'px;top:395px;">';
			}
			var imagehtml1 = '<img id="bt_is' + i + '" src="' + item_poster +
				'" style="position: absolute;left:25px;top:25px;;width:180px;height:240px;z-index:1;"/>';
			var imagehtml2 =
				'<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:150px;top:25px;;width:56px;height:29px;z-index:10;"/>';
			var imagehtml5 = '<img id="bt_ibg' + i +
				'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png" style="position: absolute;left:25px;top:25px;;width:180px;height:240px;z-index:10;"/>';
			var imagehtml3 = '<img id="bt_if' + i +
				'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:4px;top:6px;;width:220px;height:278px;"/></div>';
			var divhtml2 = "";
			if (i < 4) {
				divhtml2 = '<div style="position:absolute;left:' + (475 + (i - 0) * 189) +
					'px;top:348px; width:179px;height:30px;z-index:10;"><p id="bt_ip' + i +
					'" style="position:relative; left:0px; top:0px; width:179px; height:30px; line-height:30px; text-align:center; font-size:18px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">' +
					item_name + '</p></div><div style="position:absolute;left:' + (474 + (i - 0) * 189) +
					'px;top:140px; width:61px;height:60px;z-index:10;">';
			} else {
				divhtml2 = '<div style="position:absolute;left:' + (475 + (i - 4) * 189) +
					'px;top:629px; width:179px;height:30px;z-index:10;"><p id="bt_ip' + i +
					'" style="position:relative; left:0px; top:0px; width:179px; height:30px; line-height:30px; text-align:center; font-size:18px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">' +
					item_name + '</p></div><div style="position:absolute;left:' + (474 + (i - 4) * 189) +
					'px;top:420px; width:61px;height:60px;z-index:10;">';
			}
			var imagehtml4 = "";
			if (item_charge == "1") {
				imagehtml4 = '<img id="bt_ijb' + i +
					'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png" style="position: absolute;left:0px;top:0px;;width:61px;height:60px;z-index:10;-webkit-transition-duration:300ms;transition-duration:300ms;"/></div>';
			} else if (item_charge == "0") {
				imagehtml4 = '<img id="bt_ijb' + i +
					'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png" style="position: absolute;left:0px;top:0px;;width:61px;height:60px;z-index:10;-webkit-transition-duration:300ms;transition-duration:300ms;"/></div>';
			} else {
				imagehtml4 = '<img id="bt_ijb' + i +
					'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:61px;height:60px;z-index:10;-webkit-transition-duration:300ms;transition-duration:300ms;"/></div>';
			}
			t_html = divhtml + imagehtml1 + imagehtml2 + imagehtml5 + imagehtml3 + divhtml2 + imagehtml4;
			return t_html;
		}
		//search事件
		var item_video_name = new Array();
		function F_E_SEARCH() {
			
			var item_keyword_f = _SELECT("bt_content").innerHTML;		
			if(item_keyword_f==''){
				return
			};
			item_itemId = [];
			itemitemId = [];
			item_behavior = [];
			item_item_charge = [];
			if_name = [];
			pf_name = [];
			item_redirect_url = [];
			item_video_name = [];						
			var url = webset.solo+ 'search/searchResult.json?key=' + encodeURI(item_keyword_f) +
				'&from=epg&type=video&pageNo=1&pageSize=8&videoType=<%=programType_ZH%>';
			$.get(url, function (result) {
				var json = eval('(' + result + ')');
				var itemlist = json.list;
				var pagenow = json.currentPage;
				pagesum = json.totalPage;
				p = json.currentPage; 
				if (itemlist.length > 0) {
					_SELECT("hotdiv").style.visibility = "hidden";
					_SELECT("history_itemlist").style.visibility = "hidden";
					_SELECT("like_item").style.visibility = "hidden";
					var item_html =
						'<div style="position: absolute;left:880px;top:103px;"><p style="position:relative; left:0; top:0; width:230px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' +
						pagenow + '页/共' + pagesum + '页</p></div>';
					_SELECT("item_pages").innerHTML = item_html;
					var totalhtml2 = "";
					var html_1 = "";
					$.each(itemlist.splice(0, 8), function (i, item) {

						item_itemId.push(item.id);
						item_redirect_url.push(item.redirect_url);
						if_name.push(item.video_name);
						pf_name.push(item.video_name);
						item_video_name.push(item.video_name);

						html_1 = create_pageHtml(i, item.seriesCp_id, item.video_image, item.bcharging, item.item_corner, item.video_name); //调用公共拼html方法
						totalhtml2 += html_1;
					});
					var pagesumhtml =
						'<div style="position:absolute;left:880px;top:103px; width:33px;height:35px;z-index:10;"><p style="position:relative; left:0; top:0; width:300px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' +
						pagenow + '页/共' + pagesum + '页</p></div>';
					_SELECT("itempage").style.visibility = "visible";
					_SELECT("item_pages").innerHTML = totalhtml2 + pagesumhtml;
					//
					_H_F(focus_id);
					FYY3();
				} else {
					if (_SELECT("likeitems").innerHTML == null || _SELECT("likeitems").innerHTML == "") {
						like_item(item_keyword_f);
					} else {
						_SELECT("hotdiv").style.visibility = "hidden";
						_SELECT("history_itemlist").style.visibility = "hidden";
						_SELECT("itempage").style.visibility = "hidden";
						_SELECT("like_item").style.visibility = "visible";
						FYY2();
					}
				}
			},false);
			_H_F(focus_id);
		}

		function F_KEY_G_3() {
			
			if (pagesum > 1) {
				if ((p + 1) <= pagesum) {
					item_itemId = [];
					itemitemId = [];
					item_behavior = [];
					item_item_charge = [];
					if_name = [];
					pf_name = [];
					item_redirect_url = [];
					item_video_name = [];
					var item_keyword = _SELECT("bt_content").innerHTML; //搜索关键词
					var url = webset.solo+ 'search/searchResult.json?key=' + encodeURI(item_keyword) + '&from=epg&type=video&pageNo=' + (p + 1) +
						'&pageSize=8&videoType=<%=programType_ZH%>';
				} else {
					item_itemId = [];
					itemitemId = [];
					item_behavior = [];
					item_item_charge = [];
					if_name = [];
					pf_name = [];
					item_redirect_url = [];
					item_video_name = [];
					var item_keyword = _SELECT("bt_content").innerHTML;
					var url = webset.solo+ 'search/searchResult.json?key=' + encodeURI(item_keyword) +
						'&from=epg&type=video&pageNo=1&pageSize=8&videoType=<%=programType_ZH%>';
				}
				$.get(url, function (result) {
					var json = eval('(' + result + ')');
					var itemlist = json.list;
					var pagenow = json.currentPage;
					pagesum = json.totalPage;
					p = json.currentPage;

					_SELECT("hotdiv").style.visibility = "hidden";
					_SELECT("history_itemlist").style.visibility = "hidden";
					var item_html =
						'<div style="position: absolute;left:880px;top:103px;"><p style="position:relative; left:0; top:0; width:230px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' +
						pagenow + '页/共' + pagesum + '页</p></div>';
					_SELECT("item_pages").innerHTML = item_html;
					var totalhtml2 = "";
					var html_1 = "";
					$.each(itemlist, function (i, item) {
						item_itemId.push(item.id);
						item_redirect_url.push(item.redirect_url);
						if_name.push(item.video_name);
						pf_name.push(item.video_name);
						item_video_name.push(item.video_name);

						html_1 = create_pageHtml(i, item.seriesCp_id, item.video_image, item.bcharging, item.item_corner, item.video_name); //调用公共拼html方法
						totalhtml2 += html_1;
					});
					var pagesumhtml =
						'<div style="position:absolute;left:880px;top:103px; width:33px;height:35px;z-index:10;"><p style="position:relative; left:0; top:0; width:300px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' +
						pagenow + '页/共' + pagesum + '页</p></div>';
					_SELECT("itempage").style.visibility = "visible";
					_SELECT("item_pages").innerHTML = totalhtml2 + pagesumhtml;
				},false);
			}
			_H_F("bt_if0");
			FYY3();
		}

		function F_KEY_G_2() {
			
			if (pagesum > 1) {
				if ((p - 1) > 0) {
					item_itemId = [];
					itemitemId = [];
					item_behavior = [];
					item_item_charge = [];
					if_name = [];
					pf_name = [];
					item_redirect_url = [];
					item_video_name = [];
					var item_keyword = _SELECT("bt_content").innerHTML;
					var url = webset.solo+ 'search/searchResult.json?key=' + encodeURI(item_keyword) + '&from=epg&type=video&pageNo=' + (p - 1) +'&pageSize=8&videoType=<%=programType_ZH%>';
				} else {
					item_itemId = [];
					itemitemId = [];
					item_behavior = [];
					item_item_charge = [];
					if_name = [];
					pf_name = [];
					item_redirect_url = [];
					item_video_name = [];
					var item_keyword = _SELECT("bt_content").innerHTML;
					var url = webset.solo+ 'search/searchResult.json?key=' + encodeURI(item_keyword) +'&from=epg&type=video&pageNo='+pagesum+'&pageSize=8&videoType=<%=programType_ZH%>';
				}
				$.get(url, function (result) {
					var json = eval('(' + result + ')');
					var itemlist = json.list;
					var pagenow = json.currentPage;
					pagesum = json.totalPage;
					p = json.currentPage;

					_SELECT("hotdiv").style.visibility = "hidden";
					_SELECT("history_itemlist").style.visibility = "hidden";
					var item_html =
						'<div style="position: absolute;left:880px;top:103px;"><p style="position:relative; left:0; top:0; width:230px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' +
						pagenow + '页/共' + pagesum + '页</p></div>';
					_SELECT("item_pages").innerHTML = item_html;
					var totalhtml2 = "";
					var html_1 = "";
					$.each(itemlist.splice(0, 8), function (i, item) {
						item_itemId.push(item.id);
						item_redirect_url.push(item.redirect_url);
						like_item_charge.push(item.bcharging);
						if_name.push(item.video_name);
						pf_name.push(item.video_name);
						item_video_name.push(item.video_name);
						html_1 = create_pageHtml(i, item.seriesCp_id, item.video_image, item.bcharging, item.item_corner, item.video_name); //调用公共拼html方法
						totalhtml2 += html_1;
					});
					var pagesumhtml =
						'<div style="position:absolute;left:880px;top:103px; width:33px;height:35px;z-index:10;"><p style="position:relative; left:0; top:0; width:300px; height:35px; line-height:35px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第' +
						pagenow + '页/共' + pagesum + '页</p></div>';
					_SELECT("itempage").style.visibility = "visible";
					_SELECT("item_pages").innerHTML = totalhtml2 + pagesumhtml;
				},false);

			}
			_H_F("bt_if0");
			FYY3();
		}


		//搜索出的8条元素的enter事件,并将对应的影视id传给后台
		function F_E_FPAGE() {
			
			var i = parseInt(focus_id.replace('bt_if', ''));
			var tmp_programa_id = _SELECT("bt_content").innerHTML;
			var perv_num = p?p:'1';		
			var historyName = historyNameForDetail?historyNameForDetail:'';
			//将搜索的名字的id、片名插入接口
			insertHistory(item_itemId[i], if_name[i]);
			//当为动漫的时候进入播放器，否则进入详情
			//注：redirect_url：detail.jsp?id=202730&programType=film&code=44942416&cpcode=voole             
            var aParams = item_redirect_url[i].split('?')[1].split('&');
          	var URLParams = [];
		    for (j=0; j < aParams.length ; j++){   
		        var aParam = aParams[j].split('=');   
		        URLParams[aParam[0]] = aParam[1];   
		    };  
		    var _code = URLParams["code"],
				_cpcode = URLParams["cpcode"],
            	_id = URLParams["id"],
            _programType='<%=programType%>',
            _programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
           	switch (_programType) {
                case 'anime':
                    commen_play(_id,_programType,_programType2,_code,_cpcode,'<%=pervUrl%>');
                    break;
                default:
                    window.location.href = item_redirect_url[i]+'&back=search&perv_num='+perv_num+'&focus_id='+focus_id+'&programa_id='+tmp_programa_id+'<%=pervUrl2%>&pf_focus_id='+historyName;
            }		
		}
		
		function insertHistory(item_id, title) {
			
			var url=webset.api + 'user/usersearch.json?userId=' + userId + '&combineid=' + item_id + '&type=search&title=' +
			encodeURI(title);
			$.get(url, function (result) {
				
			},false);
		}

		//猜你喜欢
		var like_itemId = new Array();
		var like_behavior = new Array();
		var like_item_charge = new Array();

		//当未查询出结果时，触发，显示底部猜你喜欢元素
		function like_item(item_keyword_f) { //likeitems
			var url = webset.apiStatic + 'programType/tag/<%=programType%>_hotsearch.json';
			$.get(url, function (result) {
				like_itemId = [];
				like_behavior = [];
				like_item_charge = [];
				nf_name = [];
				like_cpcode = [];
				like_code = [];
				var json = eval('(' + result + ')');
				var likeitemlist = json.programTypeHotList

				var t_html = "";
				$.each(likeitemlist, function (i, item) {
					like_itemId.push(item.id);
					like_cpcode.push(item.cpCode);
					like_code.push(item.code);
					like_item_charge.push(item.bcharging);
					nf_name.push(item.title);

					var divhtml = '<div style="position: absolute;left:' + (474 + (i - 0) * 189) + 'px;top:396px;">';
					var image1 = '<img id="bt_nm' + i + '" src="' + item.imagetv +
						'" style="position: absolute;left:0px;top:0px;;width:180px;height:240px;z-index:1;">';
					var image2 =
						'<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:125px;top:0px;;width:56px;height:29px;z-index:10;"/>';
					var image4 = '<img id="bt_nb' + i +
						'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png" style="position: absolute;left:0px;top:0px;;width:180px;height:240px;z-index:2;">';
					var imagehtml4 = "";
					if (item.bcharging == 1) {
						imagehtml4 = '<img id="bt_njb' + i +
							'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png" style="position: absolute;left:0px;top:0px;;width:61px;height:60px;z-index:10;-webkit-transition-duration:300ms;transition-duration:300ms;"/>';
					} else if (item.item_charge == 0) {
						imagehtml4 = '<img id="bt_njb' + i +
							'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png" style="position: absolute;left:0px;top:0px;;width:61px;height:60px;z-index:10;-webkit-transition-duration:300ms;transition-duration:300ms;"/>';
					} else {
						imagehtml4 = '<img id="bt_njb' + i +
							'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:61px;height:60px;z-index:10;-webkit-transition-duration:300ms;transition-duration:300ms;"/>';
					}
					var image3 = '<img id="bt_nf' + i +
						'" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-20px;top:-20px;;width:220px;height:278px;"/></div>';
					var divhtml2 = '<div style="position: absolute;left:' + (474 + (i - 0) * 189) +
						'px;top:603px;z-index:10"><p id="bt_nm' + i +
						'" style="position:relative; left:0px; top:0px; width:180px; height:30px; line-height:30px; text-align:center; font-size:19px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">' +
						item.title + '</p></div>';

					t_html += divhtml + image1 + image2 + image4 + imagehtml4 + image3 + divhtml2;

				});
				_SELECT("itempage").style.visibility = "hidden";
				_SELECT("hotdiv").style.visibility = "hidden";
				_SELECT("history_itemlist").style.visibility = "hidden";
				_SELECT("like_item").style.visibility = "visible";
				_SELECT("likeitems").innerHTML = t_html;
				_H_F(focus_id)

			},false);
			FYY2();
		}
		//猜你喜欢节目进详情
		function F_E_F_LIKE() {
			
			var i = parseInt(focus_id.replace('bt_nf', ''));		
			var _cpcode = like_cpcode[i],
            _code = like_code[i],
            _id = like_itemId[i],
            _programType='<%=programType%>',
            _programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
            switch (_programType) {
                case 'anime':
                    commen_play(_id,_programType,_programType2,_code,_cpcode,'<%=pervUrl%>');
                    break;
                default:
                    window.location.href = '<%=detailpage%>.jsp?id='+like_itemId[i]+'&programType=<%=programType%>&code='+like_code[i]+'&cpcode='+like_cpcode[i]+'&back=search<%=pervUrl2%>&focus_id='+focus_id+'&programa_id='+ _SELECT("bt_content").innerHTML;
            }
		}

		//往右边
		function F_H_TG() {
			if (_SELECT("itempage").style.visibility == 'visible') {
				_H_F("bt_if0");
			} else if (_SELECT("like_item").style.visibility == 'visible') {
				_H_F("bt_nf0");
			} else if (_SELECT("hotdiv").style.visibility == 'visible') { //hotdiv
				_H_F("bt_hf0");
			}
		}

		//猜你喜欢节目名称滚动
		var history_items = '';

		function F_F_HM() {
			history_items = _SELECT(focus_id.replace('h', 'p')).innerHTML;
			if (history_items.length > 17) {
				_SELECT(focus_id.replace('h', 'p')).innerHTML = '<marquee direction="left">' + history_items + "</marquee>";
			}
		}

		function F_B_HM0() {
			_SELECT(focus_id.replace('h', 'p')).innerHTML = '' + history_items + "";
		}
		var pf_f_f = '';

		//向下分页的时候控制焦点位置
		function F_F_PFG_F() {
			
			var i = parseInt(pf_f_f.replace('bt_if', ''));
			if (item_itemId.length > i + 4) {
				_H_F("bt_if" + (i + 4));
			} else {
				_H_F("bt_next_f");
			}
		}
		
		function getHistoryList(){
			
			var url = webset.apiStatic + 'user/'+userIdStr+'/'+userId+'_history.json';
			$.get(url, function (result) {
				var json = eval('(' + result + ')');
				var itemlist = json.searchHistoryStateList[0].<%=programType%>List;
				var historyDiv = '';
				var historyChildDiv = '';
				if(!!itemlist){
					for(var i = 0;i<itemlist.length;i++){
						hif_name.push(itemlist[i].title);
						var left = i%2==0?"452px":"831px";
						var top = 406 + Math.floor(i/2)*57;
						historyChildDiv = '<DIV style="left: '+left+'; top: '+top+'px; position: absolute;">'
							    +'<IMG style="left: 20px; top: 20px; width: 371px; height: 45px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search_history_f.png">'
							    +'<IMG id="bt_hi'+i+'" style="left: -3px; top: -6px; width: 421px; height: 95px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">'
							    +'<P id="bt_pi'+i+'" style="margin: 0px; padding: 0px; left: 30px; top: 20px; width: 355px; height: 45px; text-align: left; color: rgb(255, 255, 255); line-height: 45px; overflow: hidden; font-size: 20px; font-weight: 600; position: relative;">'+itemlist[i].title+'</P>'
								+'</DIV>';
						historyDiv += historyChildDiv;		
					}
				};		
//				var listHead = '<DIV style="left: 474px; top: 363px; position: absolute;">'
//							    +'<P style="margin: 0px; padding: 0px; left: 0px; top: 10px; width: 371px; height: 45px; text-align: left; color: rgb(255, 255, 255); line-height: 45px; overflow: hidden; font-size: 20px; font-weight: normal; position: relative;">搜索历史</P>'
//								+'<HR style="left: 0px; top: 0px; width: 747px; position: relative;">'
//						        +'</DIV>'
//				document.getElementById('history_itemlist').innerHTML = historyDiv;		
				document.getElementById('historyItemlist').innerHTML = historyDiv;				
			},false);	
			FYY();
		};
		
		
		/*******语音**********/
		//历史和热门
		var hf_name = new Array();//热门的
		var hif_name = new Array();//历史的
		var callback = function(intent) {
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
						"bt_hi0": [""+hif_name[0]+""],
						"bt_hi1": [""+hif_name[1]+""],
						"bt_hi2": [""+hif_name[2]+""],
						"bt_hi3": [""+hif_name[3]+""],
						"bt_hi4": [""+hif_name[4]+""],
						"bt_hi5": [""+hif_name[5]+""],
						"bt_hi6": [""+hif_name[6]+""],
						"bt_hi7": [""+hif_name[7]+""],
						"bt_hf0": ["" + hf_name[0] + ""],
						"bt_hf1": ["" + hf_name[1] + ""],
						"bt_hf2": ["" + hf_name[2] + ""],
						"bt_hf3": ["" + hf_name[3] + ""],
						"test1": ["测试1"],
						"test2": ["测试2"]
					},
					_feedbacks: {
						"bt_hi0": '打开搜索历史的'+hif_name[0]+'',
						"bt_hi1": '打开搜索历史的'+hif_name[1]+'',
						"bt_hi2": '打开搜索历史的'+hif_name[2]+'',
						"bt_hi3": '打开搜索历史的'+hif_name[3]+'',
						"bt_hi4": '打开搜索历史的'+hif_name[4]+'',
						"bt_hi5": '打开搜索历史的'+hif_name[5]+'',
						"bt_hi6": '打开搜索历史的'+hif_name[6]+'',
						"bt_hi7": '打开搜索历史的'+hif_name[7]+'',
						"bt_hf0": '打开热门搜索的' + hf_name[0] + '',
						"bt_hf1": '打开热门搜索的' + hf_name[1] + '',
						"bt_hf2": '打开热门搜索的' + hf_name[2] + '',
						"bt_hf3": '打开热门搜索的' + hf_name[3] + '',
						"test1": '为你测试1',
						"test2": '为你测试2'
					}
				};
				
				listener.regist(scene);
			}
			
			//猜你喜欢
			var nf_name = new Array();
			function FYY2() {
				var scene = {
					_scene: "com.iflytek.xiri.MGTV",
					_commands: {
						"bt_nf0": ["" + nf_name[0] + ""],
						"bt_nf1": ["" + nf_name[1] + ""],
						"bt_nf2": ["" + nf_name[2] + ""],
						"bt_nf3": ["" + nf_name[3] + ""],
						"test1": ["测试1"],
						"test2": ["测试2"]
					},
					_feedbacks: {
						"bt_nf0": '打开' + nf_name[0] + '',
						"bt_nf1": '打开' + nf_name[1] + '',
						"bt_nf2": '打开' + nf_name[2] + '',
						"bt_nf3": '打开' + nf_name[3] + '',
						"test1": '为你测试1',
						"test2": '为你测试2'
					}
				};
//				var callback = function(intent) {
//					//	document.getElementById("test").innerHTML="333";
//					var _command = intent['_command'];
//					_H_F(_command);
//					DOBUTTONENTERFUN(_command);
//				}
//				var listener = new Xiri.Listener(callback);
				listener.regist(scene);
			}
	        //分页		
			var pf_name = new Array();
			function FYY3() {
				var scene = {
					_scene: "com.iflytek.xiri.MGTV",
					_commands: {
						"bt_if0": ["" + pf_name[0] + ""],
						"bt_if1": ["" + pf_name[1] + ""],
						"bt_if2": ["" + pf_name[2] + ""],
						"bt_if3": ["" + pf_name[3] + ""],
						"bt_if4": ["" + pf_name[4] + ""],
						"bt_if5": ["" + pf_name[5] + ""],
						"bt_if6": ["" + pf_name[6] + ""],
						"bt_if7": ["" + pf_name[7] + ""],
						"_PAGE": ["$P(_PAGE)"],
						"bt_prev_f": ["上一页"],
						"bt_next_f": ["下一页"],
						"test1": ["测试1"],
						"test2": ["测试2"]
					},
					_feedbacks: {
						"bt_if0": '打开' + pf_name[0] + '',
						"bt_if1": '打开' + pf_name[1] + '',
						"bt_if2": '打开' + pf_name[2] + '',
						"bt_if3": '打开' + pf_name[3] + '',
						"bt_if4": '打开' + pf_name[4] + '',
						"bt_if5": '打开' + pf_name[5] + '',
						"bt_if6": '打开' + pf_name[6] + '',
						"bt_if7": '打开' + pf_name[7] + '',
						"bt_prev_f": '上一页',
						"bt_next_f": '下一页',
						"test1": '为你测试1',
						"test2": '为你测试2'
					}
				};
//				var callback = function(intent) {
//					//	document.getElementById("test").innerHTML="333";
//					var _command = intent['_command'];
//					if (_command == '_PAGE') {
//						var action = intent['_action'];
//						if (action == 'NEXT') {
//							_command = "bt_next_f";
//						} else if (action == 'PREV') {
//							_command = "bt_prev_f";
//						} else if (action == 'INDEX') {
//							var index = intent['index'];
//							F_KEY_GO_PAGE(index);
//							return;
//						}
//					}
//					_H_F(_command);
//					DOBUTTONENTERFUN(_command);
//				}
//				var listener = new Xiri.Listener(callback);
				listener.regist(scene);
			}
		
	</SCRIPT>

	<META name="GENERATOR" content="MSHTML 11.00.10570.1001">
</HEAD>

<BODY  onload="init()">
	<IMG style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/error-bg.jpg">
	<DIV style="left: 40px; top: 30px; position: absolute;">
		<IMG style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-logo.png">
	</DIV>
	<DIV id="hotdiv" style="visibility: hidden;">
		<DIV style="left: 474px; top: 40px; position: absolute;">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 20px; width: 371px; height: 45px; text-align: left; color: rgb(255, 255, 255); line-height: 45px; overflow: hidden; font-size: 20px; font-weight: normal; position: relative;">热门搜索</P>
			<HR style="left: 0px; top: 10px; width: 747px; position: relative;">
		</DIV>
		<DIV id="hotpage"></DIV>
	</DIV>


	<DIV id="history_itemlist" style="visibility: hidden;">
		<DIV style="left: 474px; top: 363px; position: absolute;">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 10px; width: 371px; height: 45px; text-align: left; color: rgb(255, 255, 255); line-height: 45px; overflow: hidden; font-size: 20px; font-weight: normal; position: relative;">搜索历史</P>
			<HR style="left: 0px; top: 0px; width: 747px; position: relative;">'
		</DIV>
		<DIV id="historyItemlist">
			
		</DIV>
	</DIV>
	<DIV id="itempage" style="visibility: hidden;">
		<DIV style="left: 474px; top: 40px; position: absolute;">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 20px; width: 371px; height: 45px; text-align: left; color: rgb(255, 255, 255); line-height: 45px; overflow: hidden; font-size: 20px; font-weight: normal; position: relative;">搜索结果</P>
			<HR style="left: 0px; top: 10px; width: 747px; position: relative;">
		</DIV>


		<DIV id="item_pages">
			<!-- 节目内容 -->
		</DIV>
		<DIV style="left: 474px; top: 103px; width: 33px; height: 35px; position: absolute; z-index: 10;">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 0px; width: 300px; height: 35px; text-align: left; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 18px; font-weight: normal; position: relative;">
				注：按遥控器上下翻页键翻页 </P>
		</DIV>
		<DIV style="left: 0px; top: 0px; position: absolute;">
			<IMG id="bt_tf0" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> </DIV>
	</DIV>
	<DIV id="like_item" style="visibility: hidden;">
		<DIV style="left: 780px; top: 144px; position: absolute;">
			<IMG style="left: 0px; top: 0px; width: 120px; height: 85px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-icon-tip.png"> </DIV>
		<DIV style="left: 474px; top: 66px; position: absolute;">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 0px; width: 300px; height: 35px; text-align: left; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 20px; font-weight: normal; position: relative;">
				全部查询结果(共0部) </P>
		</DIV>
		<DIV style="left: 663px; top: 240px; position: absolute;">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 0px; width: 360px; height: 35px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 20px; font-weight: normal; position: relative;">对不起,没有与搜索相符的结果!
			</P>
		</DIV>
		<DIV style="left: 474px; top: 337px; position: absolute;">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 0px; width: 300px; height: 35px; text-align: left; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 20px; font-weight: normal; position: relative;">猜你喜欢
			</P>
			<HR style="left: 0px; top: 0px; width: 747px; position: relative;">
		</DIV>
		<DIV id="likeitems"></DIV>
	</DIV>
	<DIV style="left: 0px; top: 0px; position: absolute;">
		<IMG id="bt_pdg" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> </DIV>
	<DIV style="left: 0px; top: 0px; position: absolute;">
		<IMG id="bt_c_pdg" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> </DIV>
	<DIV style="left: 0px; top: 0px; position: absolute;">
		<IMG id="bt_d_pdg" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> </DIV>
	<DIV style="left: 0px; top: 0px; position: absolute;">
		<IMG id="bt_h_pdg" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> </DIV>
	<DIV style="left: 0px; top: 0px; position: absolute;">
		<IMG id="bt_tg" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> </DIV>
	<DIV style="left: 61px; top: 140px; position: absolute;">
		<P style="margin: 0px; left: 0px; top: 0px; text-align: center; color: rgb(255, 255, 255); line-height: 30px; overflow: hidden; font-family: 微软雅黑; font-size: 20px; font-weight: normal; position: relative;">
			请输入片名的首字母 </P>
	</DIV>
	<DIV style="left: 61px; top: 174px; position: absolute;">
		<IMG id="search_input" style="left: 0px; top: 0px; width: 335px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/input_f2.png">
		<P id="bt_content" style="margin: 0px; left: 0px; top: 10px; width: 335px; height: 35px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative;"><%=programa_id %></P>
	</DIV>
	<DIV style="left: 61px; top: 229px; width: 312px; height: 402px; position: absolute;">
		<DIV style="left: 0px; top: 0px; position: absolute;">
			<IMG id="bt_clear" style="left: 0px; top: 0px; width: 166px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-clear-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 166px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">清空</P>
		</DIV>
		<DIV style="left: 169px; top: 0px; position: absolute;">
			<IMG id="bt_delete" style="left: 0px; top: 0px; width: 166px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-clear-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 166px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">回删</P>
		</DIV>

		<DIV style="left: 0px; top: 55px; position: absolute;">
			<IMG id="bt_fA" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">A</P>
		</DIV>

		<DIV style="left: 56px; top: 55px; position: absolute;">
			<IMG id="bt_fB" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">B</P>
		</DIV>

		<DIV style="left: 112px; top: 55px; position: absolute;">
			<IMG id="bt_fC" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">C</P>
		</DIV>

		<DIV style="left: 168px; top: 55px; position: absolute;">
			<IMG id="bt_fD" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">D</P>
		</DIV>
		<DIV style="left: 224px; top: 55px; position: absolute;">
			<IMG id="bt_fE" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">E</P>
		</DIV>
		<DIV style="left: 280px; top: 55px; position: absolute;">
			<IMG id="bt_fF" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">F</P>
		</DIV>
		<DIV style="left: 0px; top: 110px; position: absolute;">
			<IMG id="bt_fG" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">G</P>
		</DIV>
		<DIV style="left: 56px; top: 110px; position: absolute;">
			<IMG id="bt_fH" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">H</P>
		</DIV>
		<DIV style="left: 112px; top: 110px; position: absolute;">
			<IMG id="bt_fI" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">I</P>
		</DIV>
		<DIV style="left: 168px; top: 110px; position: absolute;">
			<IMG id="bt_fJ" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">J</P>
		</DIV>
		<DIV style="left: 224px; top: 110px; position: absolute;">
			<IMG id="bt_fK" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">K</P>
		</DIV>
		<DIV style="left: 280px; top: 110px; position: absolute;">
			<IMG id="bt_fL" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">L</P>
		</DIV>
		<DIV style="left: 0px; top: 165px; position: absolute;">
			<IMG id="bt_fM" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">M</P>
		</DIV>
		<DIV style="left: 56px; top: 165px; position: absolute;">
			<IMG id="bt_fN" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">N</P>
		</DIV>
		<DIV style="left: 112px; top: 165px; position: absolute;">
			<IMG id="bt_fO" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">O</P>
		</DIV>
		<DIV style="left: 168px; top: 165px; position: absolute;">
			<IMG id="bt_fP" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">P</P>
		</DIV>
		<DIV style="left: 224px; top: 165px; position: absolute;">
			<IMG id="bt_fQ" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">Q</P>
		</DIV>
		<DIV style="left: 280px; top: 165px; position: absolute;">
			<IMG id="bt_fR" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">R</P>
		</DIV>
		<DIV style="left: 0px; top: 220px; position: absolute;">
			<IMG id="bt_fS" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">S</P>
		</DIV>
		<DIV style="left: 56px; top: 220px; position: absolute;">
			<IMG id="bt_fT" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">T</P>
		</DIV>
		<DIV style="left: 112px; top: 220px; position: absolute;">
			<IMG id="bt_fU" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">U</P>
		</DIV>
		<DIV style="left: 168px; top: 220px; position: absolute;">
			<IMG id="bt_fV" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">V</P>
		</DIV>
		<DIV style="left: 224px; top: 220px; position: absolute;">
			<IMG id="bt_fW" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">W</P>
		</DIV>
		<DIV style="left: 280px; top: 220px; position: absolute;">
			<IMG id="bt_fX" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">X</P>
		</DIV>
		<DIV style="left: 0px; top: 275px; position: absolute;">
			<IMG id="bt_fY" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">Y</P>
		</DIV>
		<DIV style="left: 56px; top: 275px; position: absolute;">
			<IMG id="bt_fZ" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">Z</P>
		</DIV>
		<DIV style="left: 112px; top: 275px; position: absolute;">
			<IMG id="bt_f1" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">1</P>
		</DIV>
		<DIV style="left: 168px; top: 275px; position: absolute;">
			<IMG id="bt_f2" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">2</P>
		</DIV>
		<DIV style="left: 224px; top: 275px; position: absolute;">
			<IMG id="bt_f3" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">3</P>
		</DIV>
		<DIV style="left: 280px; top: 275px; position: absolute;">
			<IMG id="bt_f4" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">4</P>
		</DIV>
		<DIV style="left: 0px; top: 330px; position: absolute;">
			<IMG id="bt_f5" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">5</P>
		</DIV>
		<DIV style="left: 56px; top: 330px; position: absolute;">
			<IMG id="bt_f6" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">6</P>
		</DIV>
		<DIV style="left: 112px; top: 330px; position: absolute;">
			<IMG id="bt_f7" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">7</P>
		</DIV>
		<DIV style="left: 168px; top: 330px; position: absolute;">
			<IMG id="bt_f8" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">8</P>
		</DIV>
		<DIV style="left: 224px; top: 330px; position: absolute;">
			<IMG id="bt_f9" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">9</P>
		</DIV>
		<DIV style="left: 280px; top: 330px; position: absolute;">
			<IMG id="bt_f0" style="left: 0px; top: 0px; width: 54px; height: 52px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/search-num-bg.png">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 6px; width: 54px; height: 52px; text-align: center; color: rgb(255, 255, 255); line-height: 35px; overflow: hidden; font-family: 微软雅黑; font-size: 26px; font-weight: normal; position: relative; z-index: 20;">0</P>
		</DIV>
		<DIV style="left: 0px; top: 390px; position: absolute;">
			<P style="margin: 0px; padding: 0px; left: 0px; top: 0px; width: 335px; height: 30px; text-align: left; color: rgb(255, 255, 255); line-height: 30px; overflow: hidden; font-family: 微软雅黑; font-size: 20px; font-weight: normal; position: relative; z-index: 20;">如：“寒战”输入“HZ”
			</P>
		</DIV>
	</DIV>
	<DIV style="left: 810px; top: 0px; position: absolute;">
		<IMG id="bt_prev_f" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
	</DIV>
	<DIV style="left: 810px; top: 668px; position: absolute;">
		<IMG id="bt_next_f" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
	</DIV>
	<DIV style="left: 0px; top: 0px; position: absolute;">
		<IMG id="bt_pdg_f" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
	</DIV>
	<DIV id="DIV_F" style="left: 0px; top: 0px; position: absolute; z-index: 11;">
		<IMG id="IMG_F" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
	</DIV>
	<IMG id="visitRecord" style="left: 1px; top: 1px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">

	<DIV id="test" style="left: 20px; top: 400px; color: rgb(255, 0, 0); font-size: 30px; position: absolute;"></DIV>
	<SCRIPT type="text/javascript">
		// visitRecord();
		// visitUrlRecord();
		// setTimeout('getPrevUrl()', 500);
	</SCRIPT>
</BODY>

</HTML>
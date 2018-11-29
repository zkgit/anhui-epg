<%@page import="java.net.URLEncoder"%>
<%@page import="com.vstartek.epg.utils.HttpLinkUtils"%>
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

	String programType_ZH=HttpLinkUtils.getProgramType_ZH(programType);

	
	if("".equals(perv_num)){
		perv_num="1";
	}
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
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>Welcome</title>
		<jsp:include page="/common/top.jsp">
	        <jsp:param name="t" value="<%=System.currentTimeMillis() %>" />
	    </jsp:include>
		<script type="text/javascript">
			var KEY_G_0 = 0x0008;
			var KEY_G_1 = 0x000D;
			var KEY_G_2 = 0x0021;
			var KEY_G_3 = 0x0022;
			var KEY_G_4 = 0x0025;
			var KEY_G_5 = 0x0026;//向上38
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
			var KEY_N_0 = 0x0030;//0键48
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
			window.document.onkeypress = function(keyEvent) {
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
						_SELECT("DIV_F").style.left = gb.getBoundingClientRect().left + "px";
						_SELECT("DIV_F").style.top = gb.getBoundingClientRect().top + "px";
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
						if (_SELECT(_p_div).style.display == 'none') {
							return;
						}
					}
					if (_id.indexOf('bt_js') >= 0) {
						_TF('DIV_F', 1.0);
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
//向左
			function F_KEY_G_4() {
				if (_BS[focus_id] != undefined && _BS[focus_id]['leftButtonId'] != '') {
					_H_F(_BS[focus_id]['leftButtonId']);
				}
				return;
			}
//向上
			function F_KEY_G_5() {
				if (_BS[focus_id] != undefined && _BS[focus_id]['upButtonId'] != '') {
					_H_F(_BS[focus_id]['upButtonId']);
				}
				return;
			}
//向右
			function F_KEY_G_6() {
				if (_BS[focus_id] != undefined && _BS[focus_id]['rightButtonId'] != '') {
					_H_F(_BS[focus_id]['rightButtonId'])
				};
				return;
			}
//向下
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
			
			
			var backUrl = 'list.jsp?programType=<%=programType%>&focus_id=bt_sx&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>';
			function F_KEY_G_0() {//返回时触发，当焦点处于筛选元素上返回时，执行noneSX();  处于节目列表时返回的是上一级路径（回到二级页面）
				
				if ("Y" == sx_flag && item_id.length > 0) {
					noneSX();
					return
				} else {
					window.location.href = backUrl;
				}
			}
//0键控制筛选模块显示
			function F_KEY_N_0() {
				if ("N" == sx_flag) {
					displaySX();
				} else if ("Y" == sx_flag && item_id.length > 0) {
					noneSX();
				}
			}
//F_KEY_N_1 --F_KEY_N_4  对应的1、2、3、4键enter事件
			function F_KEY_N_1() {
				if ("Y" == sx_flag && item_id.length > 0) {
					noneSX();
				} else {
					window.location.href = backUrl;
				}
			}
			
			function F_KEY_N_2() {
				window.location.href = "http://ando.itvengine.com.lv1.vcache.cn/itv-epg/detail_anime.jsp?id=87129&programType=anime&code=2708991&cpcode=bestv&from=zhuoying";
			}
			
			//控制筛选模块的显示
			function noneSX() {
				_SELECT("sx").style.display = "none";
				sx_flag = "N";
				_H_F("bt_f0");
			}

			function displaySX() {
				_SELECT("sx").style.display = "block";
				sx_flag = "Y";
				_H_F(type_f);
			}

			var buttons = [
				//右边光标
				{
					id: 'bt_f0',
					upButtonId: 'bt_prev_f',
					downButtonId: 'bt_pdg_f',
					leftButtonId: '',
					rightButtonId: 'bt_f1',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f1',
					upButtonId: 'bt_prev_f',
					downButtonId: 'bt_pdg_f',
					leftButtonId: 'bt_f0',
					rightButtonId: 'bt_f2',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f2',
					upButtonId: 'bt_prev_f',
					downButtonId: 'bt_pdg_f',
					leftButtonId: 'bt_f1',
					rightButtonId: 'bt_f3',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f3',
					upButtonId: 'bt_prev_f',
					downButtonId: 'bt_pdg_f',
					leftButtonId: 'bt_f2',
					rightButtonId: 'bt_f4',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f4',
					upButtonId: 'bt_prev_f',
					downButtonId: 'bt_pdg_f',
					leftButtonId: 'bt_f3',
					rightButtonId: 'bt_f5',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f5',
					upButtonId: 'bt_f0',
					downButtonId: 'bt_pdg_f',
					leftButtonId: 'bt_f4',
					rightButtonId: 'bt_f6',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f6',
					upButtonId: 'bt_f0',
					downButtonId: 'bt_next_f',
					leftButtonId: 'bt_f5',
					rightButtonId: 'bt_f7',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f7',
					upButtonId: 'bt_f1',
					downButtonId: 'bt_next_f',
					leftButtonId: 'bt_f6',
					rightButtonId: 'bt_f8',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f8',
					upButtonId: 'bt_f2',
					downButtonId: 'bt_next_f',
					leftButtonId: 'bt_f7',
					rightButtonId: 'bt_f9',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f9',
					upButtonId: 'bt_f3',
					downButtonId: 'bt_next_f',
					leftButtonId: 'bt_f8',
					rightButtonId: 'bt_f10',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f10',
					upButtonId: 'bt_f4',
					downButtonId: 'bt_next_f',
					leftButtonId: 'bt_f9',
					rightButtonId: 'bt_f11',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_f11',
					upButtonId: 'bt_f5',
					downButtonId: 'bt_next_f',
					leftButtonId: 'bt_f10',
					rightButtonId: '',
					blurFun: 'F_B_F0',
					focusFun: 'F_E_RF0',
					enterFun: 'F_E_F0',
					focusImage: 'index-poster-f.png',
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
				}, {
					id: 'bt_jst0',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst100',
					rightButtonId: 'bt_jst1',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst1',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst0',
					rightButtonId: 'bt_jst2',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst2',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst1',
					rightButtonId: 'bt_jst3',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst3',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst2',
					rightButtonId: 'bt_jst4',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst4',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst3',
					rightButtonId: 'bt_jst5',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst5',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst4',
					rightButtonId: 'bt_jst6',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst6',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst5',
					rightButtonId: 'bt_jst7',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst7',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst6',
					rightButtonId: 'p_type_right',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst8',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'p_type_left',
					rightButtonId: 'bt_jst9',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst9',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst8',
					rightButtonId: 'bt_jst10',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst10',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst9',
					rightButtonId: 'bt_jst11',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst11',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst10',
					rightButtonId: 'bt_jst12',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst12',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst11',
					rightButtonId: 'bt_jst13',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst13',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst12',
					rightButtonId: 'bt_jst14',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst14',
					upButtonId: '',
					downButtonId: 'p_d_f',
					leftButtonId: 'bt_jst13',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'F_TYPE_FOCUS',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jst100',
					upButtonId: '',
					downButtonId: 'bt_jsa100',
					leftButtonId: '',
					rightButtonId: 'p_d_h',
					blurFun: '',
					focusFun: '',
					enterFun: 'F_TYPE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'p_type_right',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: '',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'F_TYPE_RIGHT',
					enterFun: '',
					focusImage: 'Pixel.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'p_type_left',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: '',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'F_TYPE_LEFT',
					enterFun: '',
					focusImage: 'Pixel.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa0',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy0',
					leftButtonId: 'bt_jsa100',
					rightButtonId: 'bt_jsa1',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa1',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy1',
					leftButtonId: 'bt_jsa0',
					rightButtonId: 'bt_jsa2',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa2',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy2',
					leftButtonId: 'bt_jsa1',
					rightButtonId: 'bt_jsa3',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa3',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy3',
					leftButtonId: 'bt_jsa2',
					rightButtonId: 'bt_jsa4',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa4',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy4',
					leftButtonId: 'bt_jsa3',
					rightButtonId: 'bt_jsa5',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa5',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy5',
					leftButtonId: 'bt_jsa4',
					rightButtonId: 'bt_jsa6',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa6',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy5',
					leftButtonId: 'bt_jsa5',
					rightButtonId: 'bt_jsa7',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa7',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy6',
					leftButtonId: 'bt_jsa6',
					rightButtonId: 'p_area_right',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa8',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy0',
					leftButtonId: 'p_area_left',
					rightButtonId: 'bt_jsa9',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa9',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy1',
					leftButtonId: 'bt_jsa8',
					rightButtonId: 'bt_jsa10',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa10',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy2',
					leftButtonId: 'bt_jsa9',
					rightButtonId: 'bt_jsa11',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa11',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy3',
					leftButtonId: 'bt_jsa10',
					rightButtonId: 'bt_jsa12',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa12',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy4',
					leftButtonId: 'bt_jsa11',
					rightButtonId: 'bt_jsa13',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa13',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy5',
					leftButtonId: 'bt_jsa12',
					rightButtonId: 'bt_jsa14',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa14',
					upButtonId: 'p_d_g',
					downButtonId: 'bt_jsy5',
					leftButtonId: 'bt_jsa13',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'F_AREA_FOCUS',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'p_area_right',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: '',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'F_AREA_RIGHT',
					enterFun: '',
					focusImage: 'Pixel.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'p_area_left',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: '',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'F_AREA_LEFT',
					enterFun: '',
					focusImage: 'Pixel.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsa100',
					upButtonId: 'bt_jst100',
					downButtonId: 'bt_jsy100',
					leftButtonId: '',
					rightButtonId: 'p_d_i',
					blurFun: '',
					focusFun: '',
					enterFun: 'F_AREA',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsy0',
					upButtonId: 'p_d_j',
					downButtonId: 'bt_jsc1',
					leftButtonId: 'bt_jsy100',
					rightButtonId: 'bt_jsy1',
					blurFun: '',
					focusFun: 'F_YEAR_FOCUS',
					enterFun: 'F_YEAR',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsy1',
					upButtonId: 'p_d_j',
					downButtonId: 'bt_jsc2',
					leftButtonId: 'bt_jsy0',
					rightButtonId: 'bt_jsy2',
					blurFun: '',
					focusFun: 'F_YEAR_FOCUS',
					enterFun: 'F_YEAR',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsy2',
					upButtonId: 'p_d_j',
					downButtonId: 'bt_jsc2',
					leftButtonId: 'bt_jsy1',
					rightButtonId: 'bt_jsy3',
					blurFun: '',
					focusFun: 'F_YEAR_FOCUS',
					enterFun: 'F_YEAR',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsy3',
					upButtonId: 'p_d_j',
					downButtonId: 'bt_jsc2',
					leftButtonId: 'bt_jsy2',
					rightButtonId: 'bt_jsy4',
					blurFun: '',
					focusFun: 'F_YEAR_FOCUS',
					enterFun: 'F_YEAR',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsy4',
					upButtonId: 'p_d_j',
					downButtonId: 'bt_jsc2',
					leftButtonId: 'bt_jsy3',
					rightButtonId: 'bt_jsy5',
					blurFun: '',
					focusFun: 'F_YEAR_FOCUS',
//					enterFun: 'F_RANGE_YEAR',
					enterFun: 'F_YEAR',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsy5',
					upButtonId: 'p_d_j',
					downButtonId: 'bt_jsc2',
					leftButtonId: 'bt_jsy4',
					rightButtonId: 'bt_jsy6',
					blurFun: '',
					focusFun: 'F_YEAR_FOCUS',
//					enterFun: 'F_RANGE_YEAR',
					enterFun: 'F_YEAR',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsy6',
					upButtonId: 'p_d_j',
					downButtonId: 'bt_jsc2',
					leftButtonId: 'bt_jsy5',
					rightButtonId: 'bt_jsy7',
					blurFun: '',
					focusFun: 'F_YEAR_FOCUS',
					enterFun: 'F_YEAR',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsy100',
					upButtonId: 'bt_jsa100',
					downButtonId: 'bt_jsc0',
					leftButtonId: '',
					rightButtonId: 'bt_jsy0',
					blurFun: '',
					focusFun: '',
					enterFun: 'F_YEAR',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsc0',
					upButtonId: 'bt_jsy100',
					downButtonId: 'bt_jss0',
					leftButtonId: '',
					rightButtonId: 'bt_jsc1',
					blurFun: '',
					focusFun: '',
					enterFun: 'F_CHARGE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsc1',
					upButtonId: 'bt_jsy0',
					downButtonId: 'bt_jss1',
					leftButtonId: 'bt_jsc0',
					rightButtonId: 'bt_jsc2',
					blurFun: '',
					focusFun: '',
					enterFun: 'F_CHARGE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jsc2',
					upButtonId: 'bt_jsy1',
					downButtonId: 'bt_jss2',
					leftButtonId: 'bt_jsc1',
					rightButtonId: '',
					blurFun: '',
					focusFun: '',
					enterFun: 'F_CHARGE',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jss0',
					upButtonId: 'bt_jsc0',
					downButtonId: '',
					leftButtonId: '',
					rightButtonId: 'bt_jss1',
					blurFun: '',
					focusFun: '',
					enterFun: 'F_SORT',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jss1',
					upButtonId: 'bt_jsc1',
					downButtonId: '',
					leftButtonId: 'bt_jss0',
					rightButtonId: 'bt_jss2',
					blurFun: '',
					focusFun: '',
					enterFun: 'F_SORT',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'bt_jss2',
					upButtonId: 'bt_jsc2',
					downButtonId: '',
					leftButtonId: 'bt_jss1',
					rightButtonId: '',
					blurFun: '',
					focusFun: '',
					enterFun: 'F_SORT',
					focusImage: 'filter-tag-item-f.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'p_d_f',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: '',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'P_D_F',
					enterFun: '',
					focusImage: 'Pixel.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'p_d_g',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: '',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'P_D_G',
					enterFun: '',
					focusImage: 'Pixel.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'p_d_h',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: '',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'P_D_H',
					enterFun: '',
					focusImage: 'Pixel.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'p_d_i',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: '',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'P_D_I',
					enterFun: '',
					focusImage: 'Pixel.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'p_d_j',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: '',
					rightButtonId: '',
					blurFun: '',
					focusFun: 'P_D_J',
					enterFun: '',
					focusImage: 'Pixel.png',
					blurImage: 'Pixel.png'
				}
			]
			var item_id = new Array();
			var itemid = new Array();
			var p = 1;
			var pageSum;
			var item_redirect_url = new Array(); 
			var item_cpcode = new Array();
			var item_itemId = new Array();
			var item_videoType = new Array();
			var item_name = new Array();
			var typedictname = new Array();
			var areadictname = new Array();
			var yearname = new Array();
			var item_video_type = new Array();
			var pf_focus_id = '';
			var pf_f = 'bt_f0';
			var area_focus = "bt_jsa100";
			var year_focus = "bt_jsy100";
			var type_focus = "bt_jst100";
			var getHotItemsTag = true;
			
			//需要绑定的参数
			var focus_id = "<%=focus_id%>";
			var perv_num = "<%=perv_num%>";		
			var programaId = "<%=programa_id%>";
			var pfFocusId = '<%=pf_focus_id%>';
			if(!focus_id)focus_id='bt_jst100';
			if(focus_id=='bt_jst100'){
				programaId = '';
				pfFocusId = '';
			}
			
			var programType_ZH="<%=programType_ZH%>";
			
			/*以下五个是定位筛选元素的位置 :顺序不能乱  //var paramsStr = type_f+';'+area_f+';'+year_f+';'+charge_f +';'+sort_f; */
			var paramsArr = programaId.split(';');
			var type_f = paramsArr[0]?paramsArr[0]:'bt_jst100'; //类型的focus
			var area_f = paramsArr[1]?paramsArr[1]:'bt_jsa100';//地区
			var year_f = paramsArr[2]?paramsArr[2]:'bt_jsy100';//年份
			var charge_f = paramsArr[3];//收费
			if(charge_f==undefined)charge_f="";
			var sort_f = paramsArr[4];//排序
			if(sort_f==undefined)sort_f="";
			
			/*以下五个是详情返回来请求筛选接口的参数：顺序不能乱 // var paramsTextStr = item_category+';'+item_area+';'+item_year+';'+item_charge +';'+item_sort; */
			var paramsTextArr = pfFocusId.split(';');
			var item_category = paramsTextArr[0]; // tag  ： 类型
			if(item_category==undefined)item_category="";
			var item_area = paramsTextArr[1];  // region ： 地区
			if(item_area==undefined)item_area="";
			var item_year = paramsTextArr[2]; // year ：  年限
			if(item_year==undefined)item_year="";
			var item_charge = paramsTextArr[3];// bcharging ： 资费
			if(item_charge==undefined)item_charge="";
			var item_sort = paramsTextArr[4]; // orderby :  排序
			if(item_sort==undefined)item_sort="";

//初始化数据	
			var sx_flag = "N";

			function initdatas() {
				if (focus_id.indexOf("bt_f") < 0||pfFocusId.length<1) {
					if(focus_id=='bt_jst100'){
						sx_flag = "Y";
						document.getElementById("sx").style.display = "block";
					};
					getTypes();
					getHotItems();
//					init();
				} else {
					getdocumengtData();
					getTypes();
//					init();
				}
				if(focus_id=='bt_jst100')item_charge = '';
				if (item_charge != "") {
					if (item_charge == 0) {
						_SELECT("bt_jsc1").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
						_SELECT("bt_psc1").innerHTML = "免费";
					} else {
						_SELECT("bt_jsc2").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
						_SELECT("bt_psc2").innerHTML = "付费";
					}
				}
				if (item_sort != "") {
					if (item_sort == "0") {
						_SELECT("bt_jss0").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
						_SELECT("bt_pss0").innerHTML = "最热排序";
					} else if (item_sort == "1") {
						_SELECT("bt_jss1").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
						_SELECT("bt_pss1").innerHTML = "最新排序";
					} else if (item_sort == "2") {
						_SELECT("bt_jss2").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
						_SELECT("bt_pss2").innerHTML = "评分排序";
					}
				}
			}

			function getYears() {
				var year = new Date().getFullYear();
				_SELECT("bt_divy0").style.display = "block";
				_SELECT("bt_psy0").innerHTML = year;
				_SELECT("bt_divy1").style.display = "block";
				_SELECT("bt_psy1").innerHTML = year - 1;
				_SELECT("bt_divy2").style.display = "block";
				_SELECT("bt_psy2").innerHTML = year - 2;
				_SELECT("bt_divy3").style.display = "block";
				_SELECT("bt_psy3").innerHTML = year - 3;
				_SELECT("bt_divy4").style.display = "block";
				_SELECT("bt_psy4").innerHTML = (year - 4) + "-" + (year - 7);
				_SELECT("bt_divy5").style.display = "block";
				_SELECT("bt_psy5").innerHTML = (year - 8) + "-" + (year - 17);
				_SELECT("bt_divy6").style.display = "block";
				_SELECT("bt_psy6").innerHTML = "其它";
				if (year_f != "") {
					var i = parseInt(year_f.replace("bt_jsy", ""));
					if (i != 100) {
						if (i < 4) {
							_SELECT(year_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
						} else {
							_SELECT(year_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item2-ok.png";
						}
					}
				}
			}
			
//筛选类型接口：剧情、地区
			var regionlistLen = ''; 
			var taglistLen = '';
			function getTypes(){
				var url = webset.apiStatic + 'tag_epg.json';
				$.get(url, function(result) {
					var json = eval('(' + result + ')');
					for(var m=0;m<json.length;m++){
						if(programType_ZH == json[m].title){
							var jsonData = json[m].data;
							var taglistInfo = jsonData.taglist;
							var taglist = taglistInfo.splice(1,taglistInfo.length);
							areadictname = [];
							typedictname = [];
							if(!!taglist){	
								taglistLen = taglist.length;
								if(taglist.length<=8){
									var oneChildType = '';
									var oneDivType = '';
									for(var l = 0;l<taglist.length;l++){
										var left = 195 + l*120;
										var oneChildType1 = '<div id="bt_divt'+l+'" style="position: absolute; left: '+left+'px; top: 19px; display: block;">'
										+'<img id="bt_jst'+l+'" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">' 
										+'<p id="bt_pst'+l+'" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;">'+taglist[l]+'</p>'
										+'</div>';
										oneDivType += oneChildType;
									}
									document.getElementById('category_1').innerHTML = oneDivType;
								}else{
									var oneChildType = '';
									var oneDivType = '';
									for(var l = 0;l<8;l++){
										var left = 195 + l*120;
										var oneChildType = '<div id="bt_divt'+l+'" style="position: absolute; left: '+left+'px; top: 19px; display: block;">'
										+'<img id="bt_jst'+l+'" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">' 
										+'<p id="bt_pst'+l+'" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;">'+taglist[l]+'</p>'
										+'</div>';
										oneDivType += oneChildType;
									}
									var filterTagMore = '<div id="filter-tag-more" style="position: absolute; left: 1120px; top: 19px; display: block;">'
						                           +'<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-more.png" style="position: absolute;left:0px;top:0px;;width:121px;height:47px;z-index:10;">'
					                               +'</div>';
									document.getElementById('category_1').innerHTML = oneDivType+filterTagMore;
									var twoChild = '';
									var twoDiv = '';
									var a=0;
									for(var q=8;q<taglist.length;q++){
										var left = 195 + (a++)*120;
										var twoChild = '<div id="bt_divt'+q+'" style="position: absolute; left: '+left+'px; top: 19px; display: block;">'
						                +'<img id="bt_jst'+q+'" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">' 
						                +'<p id="bt_pst'+q+'" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;">'+taglist[q]+'</p>'
					                    +'</div>';
					                    twoDiv += twoChild;
									}
				                    document.getElementById('category_2').innerHTML = twoDiv;
								}
								for(var j= 0;j<taglist.length;j++){
									typedictname.push(taglist[j]);
									var i = parseInt(type_f.replace("bt_jst", ""));
									if (i <= 7 || i == 100) {
										_SELECT("category_1").style.display = "block";
										_SELECT("category_2").style.display = "none";
									} else {
										_SELECT("category_2").style.display = "block";
										_SELECT("category_1").style.display = "none";
									}
									if (type_f != "bt_jst100") {
										_SELECT(type_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
									}
									if (taglist.length > 8) {
										_SELECT("filter-tag-more").style.display = "block";
									}
									
								};
							};
							
							var regionlistInfo = jsonData.regionlist;
							var regionlist = regionlistInfo.splice(1,regionlistInfo.length);
							if(!!regionlist){
								regionlistLen = regionlist.length;
								if(regionlist.length<=8){
									var oneChild2 = '';
									var oneDiv2 = '';
									for(var t = 0;t<regionlist.length;t++){
										var left = 195 + t*120;
										var oneChild2 = '<div id="bt_diva'+t+'" style="position: absolute; left: '+left+'px; top: 77px; display: block;">'
										+'<img id="bt_jsa'+t+'" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">' 
										+'<p id="bt_psa'+t+'" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;">'+regionlist[t]+'</p>'
										+'</div>';
										oneDiv2 += oneChild2;
									}
									document.getElementById('area_1').innerHTML = oneDiv2;
								}else{
									var oneChild2 = '';
									var oneDiv2 = '';
									for(var s = 0;s<8;s++){
										var left = 195 + s*120;
										var oneChild2 = '<div id="bt_diva'+s+'" style="position: absolute; left: '+left+'px; top: 77px; display: block;">'
										+'<img id="bt_jsa'+s+'" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">' 
										+'<p id="bt_psa'+s+'" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;">'+regionlist[s]+'</p>'
										+'</div>';
										oneDiv2 += oneChild2;
									}
									var xj_arrow2 = '<div id="xj_arrow2" style="position: absolute; left: 1120px; top: 77px; display: block;">'
						                           +'<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-more.png" style="position: absolute;left:0px;top:0px;;width:121px;height:47px;z-index:10;">'
					                               +'</div>';
									document.getElementById('area_1').innerHTML = oneDiv2+xj_arrow2;
									var twoChild2 = '';
									var twoDiv2 = '';
									var a=0;
									for(var p=8;p<regionlist.length;p++){
										var left = 195 + (a++)*120;
										var twoChild2 = '<div id="bt_diva'+p+'" style="position: absolute; left: '+left+'px; top: 77px; display: block;">'
						                +'<img id="bt_jsa'+p+'" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">' 
						                +'<p id="bt_psa'+p+'" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;">'+regionlist[p]+'</p>'
					                    +'</div>';
					                    twoDiv2 += twoChild2;
									}
				                    document.getElementById('area_2').innerHTML = twoDiv2;
								}
								for(var r = 0;r<regionlist.length;r++){	
									areadictname.push(regionlist[r]);
									var i = parseInt(area_f.replace("bt_jsa", ""));
									if (i <= 7 || i == 100) {
										_SELECT("area_1").style.display = "block";
										_SELECT("area_2").style.display = "none";
									} else {
										_SELECT("area_2").style.display = "block";
										_SELECT("area_1").style.display = "none";
									}
									if (area_f != "bt_jsa100") {
										_SELECT(area_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
									}
									if (regionlist.length > 8) {
										_SELECT("xj_arrow2").style.display = "block";
									}
								};
							};
							var yearlist = jsonData.yearlist.splice(1,7);
							if(!!yearlist){
								for(var n = 0;n<yearlist.length;n++){
									_SELECT("bt_divy" + n).style.display = "block";
									_SELECT("bt_psy" + n).innerHTML = yearlist[n];
									yearname.push(yearlist[n]);
									if (year_f != "") {
										var i = parseInt(year_f.replace("bt_jsy", ""));
										if (i != 100) {
											if (i < 4) {
												_SELECT(year_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
											} else {
												_SELECT(year_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item2-ok.png";
											}
										}
									}
								};
							}			
						}
					};
				});
			};
			
			function getHotItems() {
				
				var url = webset.apiStatic + 'programType/tag/<%=programType%>_hot.json';
				$.get(url, function(result) {
					var json = eval('(' + result + ')');
					var hotlist = json.programTypeHotList;
					item_name = [];
					item_cpcode = [];
					item_id = [];
					item_code = [];
					item_videoType = [];
					$.each(hotlist, function(i, item) {
						blockDiv("div_f" + i);
						_SELECT("bt_s" + i).src = item.imagetv;
						_SELECT("bt_p" + i).innerHTML = item.title;
						if (item.bcharging == 1) {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
						}
						_SELECT("bt_p" + i).style.display = "block";
						item_id.push(item.id);
						item_cpcode.push(item.cpCode);
						item_code.push(item.code);
						item_videoType.push(item.videoType);
					});
				},false);
				init();
			}

			function SETFOCUS() {
				_H_F(focus_id);
			}

//enter 进入详情
			function F_E_F0() {
				var paramsFocusStr = type_f+';'+area_f+';'+year_f+';'+charge_f +';'+sort_f; //焦点参数				
				var paramsTextStr = item_category+';'+item_area+';'+item_year+';'+item_charge +';'+item_sort; //文字参数
				var i = parseInt(focus_id.replace('bt_f', ''));
				if(!!item_redirect_url[i]){//查询的 接口是这种格式  
					//注：redirect_url：detail.jsp?id=202730&programType=film&code=44942416&cpcode=voole     		                
		                var aParams = item_redirect_url[i].split('?')[1].split('&');
		              	var URLParams = [];
					    for (j=0; j < aParams.length; j++){   
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
			                   window.location.href = item_redirect_url[i] + '&back=filter&perv_num='+p+'&focus_id='+focus_id+'&programa_id='+paramsFocusStr+'<%=pervUrl2%>&pf_focus_id='+paramsTextStr;
			            }
				}
				if(getHotItemsTag == true){//热门搜索接口的逻辑					
					var _code = item_code[i],
					_cpcode = item_cpcode[i],
	                _id = item_id[i], 
	                _programType='<%=programType%>',
	                _programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
		           switch (_programType) {
		                case 'anime':
		                    commen_play(_id,_programType,_programType2,_code,_cpcode,'<%=pervUrl%>');
		                    break;
		                default:
		                    window.location.href = '<%=detailpage%>.jsp?id='+item_id[i]+'&programType='+_programType+'&code='+item_code[i]+'&cpcode='+item_cpcode[i]+'<%=pervUrl2%>&back=filter&focus_id='+focus_id;
		            }
				}
			}
			
			function F_KEY_G_2() {
				if ((p - 1) > 0) {
					p = p - 1;
					item_id = [];
					itemid = [];
					item_redirect_url = [];
					item_name = [];
					item_video_type = [];
					var url = webset.solo+ 'search/choose.json?pageNo='+p+'&from=epg&pageSize=12&videoType='+programType_ZH+'&region='+encodeURI(item_area)+'&year='
							+item_year+'&tag='+encodeURI(item_category)+'&bcharging='+item_charge+'&orderby='+item_sort;
					$.get(url, function(result) {
						getHotItemsTag = false;
						var json = eval('(' + result + ')');
						p = json.currentPage;
						pageSum = json.totalPage;
						F_NONEAllDIV();
						if (json.list.length > 0) {
							_SELECT("noItem").style.display = "none";
						} else {
							_SELECT("noItem").style.display = "block";
						}
						$.each(json.list, function(i, item) {
							blockDiv("div_f" + i);
							_SELECT("bt_s" + i).src = item.video_image;
							_SELECT("bt_p" + i).innerHTML = item.video_name;
							if (item.bcharging == 1) {
								_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
							} else {
								_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
							}
							_SELECT("bt_p" + i).style.display = "block";
							_SELECT("bt_p" + i).innerHTML = item.video_name;
							
							item_id.push(item.id);
							item_redirect_url.push(item.redirect_url);
						    item_name.push(item.title);
						    item_video_type.push(item.video_type);
							_SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
					});
					_SELECT("itemcounts").innerHTML = "全部资源:" + json.totalrecords + "部";
					_SELECT("n_s").innerHTML = "当前第" + json.currentPage + "页/共" + json.totalPage + "页";
				},false);
					var i = parseInt(pf_f.replace('bt_f', ''));
					if (item_id.length > i) {
						_H_F("bt_f" + i);
					} else {
						_H_F("bt_f" + (item_id.length - 1));
					}
				} else {
					_H_F(pf_f);
				}
			}

			function F_KEY_G_3() {
				if ((p + 1) <= pageSum) {
					p = p + 1;
				} else {
					p = 1;
				}
				item_id = [];
				itemid = [];
				item_redirect_url = [];
				item_video_type = [];
				var url = webset.solo+ 'search/choose.json?pageNo='+p+'&from=epg&pageSize=12&videoType='+programType_ZH+'&region='+encodeURI(item_area)+'&year='
							+item_year+'&tag='+encodeURI(item_category)+'&bcharging='+item_charge+'&orderby='+item_sort;
				$.get(url, function(result) {
					getHotItemsTag = false;
					var json = eval('(' + result + ')');
					p = json.currentPage;
					pageSum = json.totalPage;
					F_NONEAllDIV();
					if (json.list.length > 0) {
						_SELECT("noItem").style.display = "none";
					} else {
						_SELECT("noItem").style.display = "block";
					}
					$.each(json.list, function(i, item) {
						blockDiv("div_f" + i);
						_SELECT("bt_s" + i).src = item.video_image;
						_SELECT("bt_p" + i).innerHTML = item.video_name;
						if (item.bcharging == 1) {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
						}
						_SELECT("bt_p" + i).style.display = "block";
						_SELECT("bt_p" + i).innerHTML = item.video_name;
						item_id.push(item.id);
						item_redirect_url.push(item.redirect_url);
						item_video_type.push(item.video_type);
						_SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
					});
					_SELECT("itemcounts").innerHTML = "全部资源:" + json.totalrecords + "部";
					_SELECT("n_s").innerHTML = "当前第" + json.currentPage + "页/共" + json.totalPage + "页";
				},false);
				//向下分页时的焦点判断
				var i = parseInt(pf_f.replace('bt_f', ''));
				if (i < 6) {
					_H_F("bt_f" + i);
				} else if (item_id.length > (i - 6)) {
					_H_F("bt_f" + (i - 6));
				} else {
					_H_F("bt_f" + (item_id.length - 1));
				};				
			}

			function F_F_PFGD() {
				_H_F(pf_focus_id);
			}

			function F_F_PFG() {
				_H_F(pf_f);
			}
			var item_names = "";

			function F_E_RF0() {
				pf_f = focus_id;
				item_names = _SELECT(focus_id.replace('f', 'p')).innerHTML;
				if (item_names.length > 8) {
					_SELECT(focus_id.replace('f', 'p')).innerHTML = '<marquee direction="left">' + item_names + "</marquee>";
				}
			}

			function F_B_F0() {
				_SELECT(focus_id.replace('f', 'p')).innerHTML = '' + item_names + "";
			}
			function F_KEY_G_1() {
				DOBUTTONENTERFUN(focus_id);
			}

			function F_F_PFG_F() {
				var i = parseInt(pf_f.replace('bt_f', ''));
				if (item_id.length > i + 6) {
					_H_F("bt_f" + (i + 6));
				} else if (item_id.length > 6) {
					_H_F("bt_f" + (item_id.length - 1));
				} else {
					_H_F("bt_next_f");
				}
			}

			function F_NONEAllDIV() { //隐藏所有节目
				for (var i = 0; i < 12; i++) {
					noneDiv("div_f" + i);
				}
			}

			function F_threeDIV() { //隐藏第三行
				for (var i = 0; i < 5; i++) {
					noneDiv("div_b" + i);
				}
			}

			function getItemCounts() {
				
			}
			
//bt_jst100不限类型以及第一行的子元素的enter事件
			function F_TYPE() {
				
				_SELECT(type_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png";
				if (type_f == "bt_jst100") {
					_SELECT("bt_pst100").innerHTML = "";
				}
				var i = parseInt(focus_id.replace("bt_jst", ""));
				_SELECT("bt_jst" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
				type_f = focus_id;
				if (i == 100) {
					_SELECT("bt_pst100").innerHTML = "不限类型";
					item_category = "";
				} else {
					item_category = _SELECT("bt_pst" + i).innerHTML;
				}
				var url = webset.solo+ 'search/choose.json?pageNo=1&from=epg&pageSize=12&videoType='+programType_ZH+'&region='+encodeURI(item_area)+'&year='
							+item_year+'&tag='+encodeURI(item_category)+'&bcharging='+item_charge+'&orderby='+item_sort;
				$.get(url, function(result) {
					getHotItemsTag = false;
					item_id = [];
					itemid = [];
					item_redirect_url = [];
					item_video_type = [];
					var json = eval('(' + result + ')');
					p = json.currentPage;
					pageSum = json.totalPage;
					F_NONEAllDIV();
					if (json.list.length > 0) {
						_SELECT("noItem").style.display = "none";
					} else {
						_SELECT("noItem").style.display = "block";
					}
					$.each(json.list, function(i, item) {
						blockDiv("div_f" + i);
						//判断是否免费小图标字段：暂缺！
						if (item.bcharging == 1) {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
						}
						_SELECT("bt_p" + i).style.display = "block";
						_SELECT("bt_s" + i).src = item.video_image;
						_SELECT("bt_p" + i).innerHTML = item.video_name;
						item_id.push(item.id);
						item_redirect_url.push(item.redirect_url);		
						item_video_type.push(item.video_type);
						_SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
					});
					_SELECT("itemcounts").innerHTML = "全部资源:" + json.totalrecords + "部";
					_SELECT("n_s").innerHTML = "当前第" + json.currentPage + "页/共" + json.totalPage + "页";
					var new_type_f = focus_id;
					type_f = new_type_f;
				},false);
			}
			
//bt_jsa100不限地区以及后面子元素的enter事件
			function F_AREA() {
				_SELECT(area_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png";
				if (area_f == "bt_jsa100") {
					_SELECT("bt_psa100").innerHTML = "";
				}
				var i = parseInt(focus_id.replace("bt_jsa", ""));
				_SELECT("bt_jsa" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
				area_f = focus_id;
				if (i == 100) {
					_SELECT("bt_psa100").innerHTML = "不限地区";
					item_area = "";
				} else {
					item_area = _SELECT("bt_psa" + i).innerHTML;
				}
				var url = webset.solo+ 'search/choose.json?pageNo=1&from=epg&pageSize=12&videoType='+programType_ZH+'&region='+encodeURI(item_area)+'&year='+item_year+'&tag='
							+encodeURI(item_category)+'&bcharging='+item_charge+'&orderby='+item_sort;
				$.get(url, function(result) {
					getHotItemsTag = false;
					item_id = [];
					itemid = [];
					item_redirect_url = [];
					item_video_type = [];
					var json = eval('(' + result + ')');
					p = json.currentPage;
					pageSum = json.totalPage;
					F_NONEAllDIV();
					if (json.list.length > 0) {
						_SELECT("noItem").style.display = "none";
					} else {
						_SELECT("noItem").style.display = "block";
					}
					$.each(json.list, function(i, item) {
						blockDiv("div_f" + i);
						if (item.bcharging == 1) {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
						}
						_SELECT("bt_p" + i).style.display = "block";
						_SELECT("bt_s" + i).src = item.video_image;
						_SELECT("bt_p" + i).innerHTML = item.video_name;
						
						item_id.push(item.id);
						item_redirect_url.push(item.redirect_url);			
						item_video_type.push(item.video_type);
						_SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
					});
					_SELECT("itemcounts").innerHTML = "全部资源:" + json.totalrecords + "部";
					_SELECT("n_s").innerHTML = "当前第" + json.currentPage + "页/共" + json.totalPage + "页";
					var new_area_f = focus_id;
					area_f = new_area_f;
				},false);
			}
//bt_jsy100不限年代以及后面子元素的enter事件		
			function F_YEAR() {
				
				_SELECT(year_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png";
				if (year_f == "bt_jsy100") {
					_SELECT("bt_psy100").innerHTML = "";
				}
				var i = parseInt(focus_id.replace("bt_jsy", ""));
				_SELECT("bt_jsy" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
				year_f = focus_id;
				if (i == 100) {
					_SELECT("bt_psy100").innerHTML = "不限年代";
					item_year = "";
				} else {
					item_year = _SELECT("bt_psy" + i).innerHTML;
				}
				var url = webset.solo+ 'search/choose.json?pageNo=1&from=epg&pageSize=12&videoType='+programType_ZH+'&region='+encodeURI(item_area)+'&year='+item_year+'&tag='
							+encodeURI(item_category)+'&bcharging='+item_charge+'&orderby='+item_sort;
				$.get(url, function(result) {
					getHotItemsTag = false;
					item_id = [];
					itemid = [];
					item_redirect_url = [];
					item_video_type = [];
					var json = eval('(' + result + ')');
					p = json.currentPage;
					pageSum = json.totalPage;
					F_NONEAllDIV();
					if (json.list.length > 0) {
						_SELECT("noItem").style.display = "none";
					} else {
						_SELECT("noItem").style.display = "block";
					}
					$.each(json.list, function(i, item) {
						blockDiv("div_f" + i);
						_SELECT("bt_s" + i).src = item.video_image;
						_SELECT("bt_p" + i).innerHTML = item.video_name;
						
						if (item.bcharging == 1) {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
						}
						_SELECT("bt_p" + i).style.display = "block";
						item_id.push(item.id);
						item_redirect_url.push(item.redirect_url);	
						item_video_type.push(item.video_type);
						_SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
					});
					_SELECT("itemcounts").innerHTML = "全部资源:" + json.totalrecords + "部";
					_SELECT("n_s").innerHTML = "当前第" + json.currentPage + "页/共" + json.totalPage + "页";
					var new_year_f = focus_id;
					year_f = new_year_f;
				},false);
			}
			
//当年代是时间段的时候enter事件,现在不需要这套计算逻辑，直接取接口数据
			/*function F_RANGE_YEAR() {}*/
			
//bt_jsc0不限资费以及后面子元素的enter事件		
			function F_CHARGE() {
				_SELECT(charge_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
				if ("bt_jsc0" == charge_f) {
					_SELECT("bt_psc0").innerHTML = "";
					_SELECT("bt_ft3").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png";
				} else if ("bt_jsc1" == charge_f) {
					_SELECT("bt_psc1").innerHTML = "";
				} else {
					_SELECT("bt_psc2").innerHTML = "";
				}
				var i = parseInt(focus_id.replace("bt_jsc", ""));
				if (i == 0) {
					_SELECT("bt_psc0").innerHTML = "不限资费";
					_SELECT("bt_ft3").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
				} else if (i == 1) {
					_SELECT("bt_psc1").innerHTML = "免费";
				} else {
					_SELECT("bt_psc2").innerHTML = "付费";
				}
				_SELECT("bt_jsc" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
				charge_f = focus_id;
				if ("bt_jsc0" == focus_id) {
					item_charge = "";
				} else if ("bt_jsc1" == focus_id) {
					item_charge = "0";
				} else {
					item_charge = "1";
				}
				var url = webset.solo+ 'search/choose.json?pageNo=1&from=epg&pageSize=12&videoType='+programType_ZH+'&region='+encodeURI(item_area)+'&year='+item_year+'&tag='
							+encodeURI(item_category)+'&bcharging='+item_charge+'&orderby='+item_sort;
				$.get(url, function(result) {
					getHotItemsTag = false;
					item_id = [];
					itemid = [];
					item_redirect_url = [];
					item_video_type = [];
					var json = eval('(' + result + ')');
					p = json.currentPage;
					pageSum = json.totalPage;
					F_NONEAllDIV();
					if (json.list.length > 0) {
						_SELECT("noItem").style.display = "none";
					} else {
						_SELECT("noItem").style.display = "block";
					}
					$.each(json.list, function(i, item) {
						blockDiv("div_f" + i);
						if (item.bcharging == 1) {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
						}
						_SELECT("bt_p" + i).style.display = "block";
						_SELECT("bt_s" + i).src = item.video_image;
						_SELECT("bt_p" + i).innerHTML = item.video_name;
						item_id.push(item.id);
						item_redirect_url.push(item.redirect_url);	
						item_video_type.push(item.video_type);
						_SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
					});
					_SELECT("itemcounts").innerHTML = "全部资源:" + json.totalrecords + "部";
					_SELECT("n_s").innerHTML = "当前第" + json.currentPage + "页/共" + json.totalPage + "页";
					var new_charge_f = focus_id;
					charge_f = new_charge_f;
				});
			}

//三个排序的enter事件:bt_jss0\bt_jss1\bt_jss2
			function F_SORT() {
				
				if (sort_f != "") {
					_SELECT(sort_f).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
				}
				if ("bt_jss0" == sort_f) {
					_SELECT("bt_pss0").innerHTML = "";
				} else if ("bt_jss1" == sort_f) {
					_SELECT("bt_pss1").innerHTML = "";
				} else {
					_SELECT("bt_pss2").innerHTML = "";
				}
				var i = parseInt(focus_id.replace("bt_jss", ""));
				if (i == 0) {
					_SELECT("bt_pss0").innerHTML = "最热排序";
				} else if (i == 1) {
					_SELECT("bt_pss1").innerHTML = "最新排序";
				} else {
					_SELECT("bt_pss2").innerHTML = "评分排序";
				}
				_SELECT("bt_jss" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-ok.png";
				sort_f = focus_id;
				if ("bt_jss0" == focus_id) {
					item_sort = "1"; //最re
				} else if ("bt_jss1" == focus_id) {
					item_sort = "0"; //最xin
				} else {
					item_sort = "2";//评分
				}
				var url = webset.solo+ 'search/choose.json?pageNo=1&from=epg&pageSize=12&videoType='+programType_ZH+'&region='+encodeURI(item_area)+'&year='+item_year+'&tag='
							+encodeURI(item_category)+'&bcharging='+item_charge+'&orderby='+item_sort;
				$.get(url, function(result) {
					getHotItemsTag = false;
					item_id = [];
					itemid = [];
					item_redirect_url = [];
					item_video_type = [];
					var json = eval('(' + result + ')');
					p = json.currentPage;
					pageSum = json.totalPage;
					F_NONEAllDIV();
					if (json.list.length > 0) {
						_SELECT("noItem").style.display = "none";
					} else {
						_SELECT("noItem").style.display = "block";
					}
					$.each(json.list, function(i, item) {
						blockDiv("div_f" + i);
						if (item.bcharging == 1) {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
						}
						_SELECT("bt_p" + i).style.display = "block";
						_SELECT("bt_s" + i).src = item.video_image;
						_SELECT("bt_p" + i).innerHTML = item.video_name;
						item_id.push(item.id);
						item_redirect_url.push(item.redirect_url);		
						item_video_type.push(item.video_type);
						_SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
					});
					_SELECT("itemcounts").innerHTML = "全部资源:" + json.totalrecords + "部";
					_SELECT("n_s").innerHTML = "当前第" + json.currentPage + "页/共" + json.totalPage + "页";
					var new_sort_f = focus_id;
					sort_f = new_sort_f;
				});
			}

			function getdocumengtData() {				
				var url = webset.solo+ 'search/choose.json?pageNo='+perv_num+'&from=epg&pageSize=12&videoType='+programType_ZH+'&region='+encodeURI(item_area)+'&year='
							+item_year+'&tag='+encodeURI(item_category)+'&bcharging='+item_charge+'&orderby='+item_sort;
				$.get(url, function(result) {
					getHotItemsTag = false;
					item_id = [];
					itemid = [];
					item_name = [];
					item_video_type = [];
					var json = eval('(' + result + ')');
					p = json.currentPage;
					pageSum = json.totalPage;
					F_NONEAllDIV();
					if (json.list.length > 0) {
						_SELECT("sx").style.display = "none";
						_SELECT("noItem").style.display = "none";
					} else {
						_SELECT("noItem").style.display = "block";
					}
					$.each(json.list, function(i, item) {
						blockDiv("div_f" + i);
						_SELECT("bt_s" + i).src = item.video_image;
						_SELECT("bt_p" + i).innerHTML = item.video_name;
						if (item.bcharging == 1) {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
						} else {
							_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
						}
						_SELECT("bt_p" + i).style.display = "block";
						item_id.push(item.id);
						item_redirect_url.push(item.redirect_url);
						item_video_type.push(item.video_type);
						_SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
					});
					_SELECT("itemcounts").innerHTML = "全部资源:" + json.totalrecords + "部";
					_SELECT("n_s").innerHTML = "当前第" + json.currentPage + "页/共" + json.totalPage + "页";
				},false);
				init();
			}

//第一行跳到末尾时：category_1向category_2
			function F_TYPE_RIGHT() {
				if(taglistLen<9){_H_F("bt_jst7");return};
				_SELECT("category_1").style.display = "none";
				_SELECT("category_2").style.display = "block";
				_H_F("bt_jst8");
			}
//第一行的category_2向category_1
			function F_TYPE_LEFT() {
				_SELECT("category_2").style.display = "none";
				_SELECT("category_1").style.display = "block";
				_H_F("bt_jst7");
			}
//下面区域模块的两个方法原理同上
			function F_AREA_RIGHT() {
				if(regionlistLen<9){_H_F("bt_jsa7");return};
				_SELECT("area_1").style.display = "none";
				_SELECT("area_2").style.display = "block";
				_H_F("bt_jsa8");
			}
			function F_AREA_LEFT() {
				_SELECT("area_2").style.display = "none";
				_SELECT("area_1").style.display = "block";
				_H_F("bt_jsa7");
			}


//第一行bt_jst子元素向下焦点处理
			function P_D_F() {
				var i = parseInt(type_focus.replace("bt_jst", ""));
				if (i > 7) {
					if (_SELECT("area_1").style.display == "block") {
						if (_SELECT("bt_diva" + (i - 8)).style.display == "block") {
							_H_F("bt_jsa" + (i - 8));
						} else {
							_H_F("bt_jsa" + (areadictname.length - 1));
						}
					} else {
						if (_SELECT("bt_diva" + i).style.display == "block") {
							_H_F("bt_jsa" + i);
						} else {
							_H_F("bt_jsa" + (areadictname.length - 1));
						}
					}
				} else {
					if (_SELECT("area_1").style.display == "block") {
						if (!!_SELECT("bt_diva" + i)&&_SELECT("bt_diva" + i).style.display == "block") {
							_H_F("bt_jsa" + i);
						} else {
							_H_F("bt_jsa" + (areadictname.length - 1));
						}
					} else {
						if ((i + 8) > 14) {
							if (_SELECT("bt_diva" + (i + 7)).style.display == "block") {
								_H_F("bt_jsa" + (i + 7));
							} else {
								_H_F("bt_jsa" + (areadictname.length - 1));
							}
						} else if (_SELECT("bt_diva" + (i + 8)).style.display == "block") {
							_H_F("bt_jsa" + (i + 8));
						} else {
							_H_F("bt_jsa" + (areadictname.length - 1));
						}
					}
				}
			}
			
			function F_TYPE_FOCUS() {
				type_focus = focus_id;
			}
			
			function F_AREA_FOCUS() {
				area_focus = focus_id;
			}
			
			function F_YEAR_FOCUS() {
				year_focus = focus_id;
			}


//第二行最后一个向上时焦点所在位置处理(bt_jst:第一行；bt_jsa:第二行)
			function P_D_G() {
				
				var i = parseInt(area_focus.replace("bt_jsa", ""));
				if (i > 7) {
					if (_SELECT("category_1").style.display == "block") {
						if (_SELECT("bt_divt" + (i - 8)).style.display == "block") {
							_H_F("bt_jst" + (i - 8));
						} else {
							_H_F("bt_jst" + (typedictname.length - 1));
						}
					} else {
						if (_SELECT("bt_divt" + i).style.display == "block") {
							_H_F("bt_jst" + i);
						} else {
							_H_F("bt_jst" + (typedictname.length - 1));
//							_H_F("bt_jst10" );
						}
					}
				} else {
					if (_SELECT("category_1").style.display == "block") {
						if (!!(_SELECT("bt_divt" + i))&&_SELECT("bt_divt" + i).style.display == "block") {
							_H_F("bt_jst" + i);
						} else {
							_H_F("bt_jst" + (typedictname.length - 1));
						}
					} else {
						if ((i + 8) > 14) {
							if (_SELECT("bt_divt" + (i + 7)).style.display == "block") {
								_H_F("bt_jst" + (i + 7));
							} else {
								_H_F("bt_jst" + (typedictname.length - 1));
							}
						} else if (_SELECT("bt_divt" + (i + 8)).style.display == "block") {
							_H_F("bt_jst" + (i + 8));
						} else {
							_H_F("bt_jst" + (typedictname.length - 1));
						}
					}
				}
			}

//不限类型向右
			function P_D_H() {
				
				if (_SELECT("category_1").style.display == "block") {
					_H_F("bt_jst0");
				} else if (_SELECT("category_2").style.display == "block") {
					_H_F("bt_jst8");
				} else {
					_H_F("bt_jst100");
				}
			}
//不限地区向右
			function P_D_I() {
				
				if (_SELECT("area_1").style.display == "block") {
					_H_F("bt_jsa0");
				} else if (_SELECT("area_2").style.display == "block") {
					_H_F("bt_jsa8");
				} else {
					_H_F("bt_jsa100");
				}
			}
//不限年代子元素向上焦点处理
			function P_D_J() {
				
				var i = parseInt(year_focus.replace("bt_jsy", ""));
				if (_SELECT("area_1").style.display == "block") {
					if (i < 6) {
						if (areadictname.length - 1 < 6) {
							_H_F("bt_jsa" + (areadictname.length - 1));
						} else {
							_H_F("bt_jsa" + i);
						}
					} else {
						if (areadictname.length - 1 < 7) {
							_H_F("bt_jsa" + (areadictname.length - 1));
						} else {
							_H_F("bt_jsa" + (i + 1));
						}
					}
				} else {
					if (areadictname.length - 1 < (i + 8)) {
						_H_F("bt_jsa" + (areadictname.length - 1));
					} else {
						_H_F("bt_jsa" + (i + 8));
					}
				}
			}
		</script>

		<style type="text/css">
			.p0 {
				font-size: 20px
			}
			
			.p1 {
				font-size: 20px
			}
			
			.p2 {
				font-size: 18px;
				color: #FF9224;
			}
		</style>

	</head>

	<body  onload="initdatas()">
		<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-bg.jpg" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;">
		<div style="position:absolute;left:400px;top:45px; z-index:1;">
			<div style="position:relative; left:0px; margin-top:6px; width:570px; text-align:center; font-size:23px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">温馨提示:按0键可呼出或隐藏筛选框,选取节目观看</div>
		</div>
		<div style="position:absolute;left:75px;top:70px; z-index:1;">
			<div id="itemcounts" style="position:relative; left:0px; margin-top:10px; width:180px; text-align:left; font-size:18px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;"></div>
		</div>
		<div id="DIV_F" style="position: absolute; left: 74px; top: 384px; z-index: 11;">
			<img id="IMG_F" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-f.png">
		</div>
		<div style="position:absolute;left:0px;top:0px;">
			<img id="bt_pdgd" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
		</div>

		<div id="itempage" style="position:absolute;left:0px;top:0px; width:1280px;height:720px;">
			<div id="div_f0" style="position: absolute; left: 79px; top: 113px; display: block;">
				<img id="bt_s0" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb0" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png">
				<img id="bt_f0" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg0" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr0" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p0" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx0" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc0" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f1" style="position: absolute; left: 269px; top: 113px; display: block;">
				<img id="bt_s1" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb1" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png">
				<img id="bt_f1" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg1" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr1" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p1" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx1" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc1" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f2" style="position: absolute; left: 459px; top: 113px; display: block;">
				<img id="bt_s2" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb2" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png">
				<img id="bt_f2" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg2" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr2" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p2" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx2" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc2" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f3" style="position: absolute; left: 650px; top: 113px; display: block;">
				<img id="bt_s3" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb3" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png">
				<img id="bt_f3" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg3" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr3" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-db.png">
				<p id="bt_p3" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx3" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc3" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f4" style="position: absolute; left: 843px; top: 113px; display: block;">
				<img id="bt_s4" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb4" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png">
				<img id="bt_f4" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg4" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr4" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p4" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx4" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc4" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f5" style="position: absolute; left: 1038px; top: 113px; display: block;">
				<img id="bt_s5" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb5" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png">
				<img id="bt_f5" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg5" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr5" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p5" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx5" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc5" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f6" style="position: absolute; left: 79px; top: 401px; display: block;">
				<img id="bt_s6" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb6" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png">
				<img id="bt_f6" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg6" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr6" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p6" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx6" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc6" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f7" style="position: absolute; left: 269px; top: 401px; display: block;">
				<img id="bt_s7" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb7" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png">
				<img id="bt_f7" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg7" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr7" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p7" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx7" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc7" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f8" style="position: absolute; left: 459px; top: 401px; display: block;">
				<img id="bt_s8" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb8" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png">
				<img id="bt_f8" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg8" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr8" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p8" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx8" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc8" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f9" style="position: absolute; left: 650px; top: 401px; display: block;">
				<img id="bt_s9" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb9" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png">
				<img id="bt_f9" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg9" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr9" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p9" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx9" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc9" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f10" style="position: absolute; left: 843px; top: 401px; display: block;">
				<img id="bt_s10" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb10" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png">
				<img id="bt_f10" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg10" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr10" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p10" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx10" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc10" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>
			<div id="div_f11" style="position: absolute; left: 1038px; top: 401px; display: block;">
				<img id="bt_s11" style="position: absolute;left:0px;top:0px;width:174px;height:239px;z-index:1;" src="">
				<img id="bt_jb11" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png">
				<img id="bt_f11" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<img id="bt_bg11" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-poster-bg.png">
				<img id="bt_jbr11" style="position:absolute;left:120px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_p11" class="p1" style="position: absolute; left: 5px; top: 229px; width: 170px; height: 23px; line-height: 25px; text-align: center; font-family: 微软雅黑; font-weight: normal; color: rgb(255, 255, 255); overflow: hidden; margin: 0px; padding: 0px; display: block; z-index: 10;"></p>
				<p id="bt_pgx11" class="p1" style="position:absolute; left:5px; top:229px; width:170px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal;color:#ffffff; overflow:hidden; margin:0; padding:0;display:none;z-index:10"></p>
				<p id="bt_sc11" class="p1" style="position:absolute; left:138px; top:229px; width:37px; height:23px; line-height:23px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:10"></p>
			</div>

			<div style="position: absolute;left:995px;top:43px;">
				<div id="n_s" style="position:absolute; left:0px; top:0px; width:220px; height:35px; line-height:35px; text-align:right; font-size:23px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;"></div>
			</div>

			<div id="noItem" style="position: absolute;left:430px;top:180px;display: none;">
				<div style="position:absolute; left:0px; top:0px; width:520px; height:35px; line-height:35px; text-align:center; font-size:30px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">暂无筛选结果,请重新选择筛选条件!</div>
			</div>
		</div>

		<div id="sx" style="position: absolute; left: 0px; top: 366px; display: none;">
			<img id="" style="position: absolute;left:0px;top:0px;width:1280px;height:354px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-bg.png">
			<div id="" style="position: absolute;left:74px;top:19px;display: block;">
				<img id="bt_ft0" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			</div>
			<div id="" style="position: absolute;left:74px;top:77px;display: block;">
				<img id="bt_ft1" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			</div>
			<div id="" style="position: absolute;left:74px;top:139px;display: block;">
				<img id="bt_ft2" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			</div>
			<div id="" style="position: absolute;left:74px;top:199px;display: block;">
				<img id="bt_ft3" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			</div>
			<div id="category_1" style="display: block;"></div>
			<div id="category_2" style="display: none;"></div>
			<div id="bt_divt100" style="position: absolute;left:76px;top:19px;display: block;">
				<img id="bt_jst100" style="position: absolute;left:-2px;top:-1px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">
				<p id="bt_pst100" class="p1" style="position:absolute; left:-3px; margin-top:13px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<!-- 地区 -->
			<div id="area_1" style="display: block;"></div>
			<div id="area_2" style="display: none;"></div>
			<div id="bt_diva100" style="position: absolute;left:75px;top:77px;display: block;">
				<img id="bt_jsa100" style="position: absolute;left:-1px;top:-1px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">
				<p id="bt_psa100" class="p1" style="position:absolute; left:-2px; margin-top:13px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<!-- 年代 -->
			<div id="bt_divy0" style="position: absolute; left: 195px; top: 139px; display: block;">
				<img id="bt_jsy0" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">
				<p id="bt_psy0" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<div id="bt_divy1" style="position: absolute; left: 315px; top: 139px; display: block;">
				<img id="bt_jsy1" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">
				<p id="bt_psy1" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<div id="bt_divy2" style="position: absolute; left: 435px; top: 139px; display: block;">
				<img id="bt_jsy2" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">
				<p id="bt_psy2" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<div id="bt_divy3" style="position: absolute; left: 555px; top: 139px; display: block;">
				<img id="bt_jsy3" style="position: absolute;left:0px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">
				<p id="bt_psy3" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<div id="bt_divy4" style="position: absolute; left: 674px; top: 139px; display: block;">
				<img id="bt_jsy4" style="position: absolute;left:0px;top:0px;width:168px;height:58px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item2-bg.png">
				<p id="bt_psy4" class="p1" style="position:absolute; left:0px; margin-top:15px; width:168px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"><>
			</div>
			<div id="bt_divy5" style="position: absolute; left: 842px; top: 139px; display: block;">
				<img id="bt_jsy5" style="position: absolute;left:0px;top:0px;width:168px;height:58px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item2-bg.png">
				<p id="bt_psy5" class="p1" style="position:absolute; left:0px; margin-top:15px; width:168px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<div id="bt_divy6" style="position: absolute; left: 1010px; top: 139px; display: block;">
				<img id="bt_jsy6" style="position: absolute;left:0px;top:0px;width:168px;height:58px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item2-bg.png">
				<p id="bt_psy6" class="p1" style="position:absolute; left:0px; margin-top:15px; width:168px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<div id="bt_divy100" style="position: absolute;left:75px;top:139px;display: block;">
				<img id="bt_jsy100" style="position: absolute;left:-1px;top:-2px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">
				<p id="bt_psy100" class="p1" style="position:absolute; left:-2px; margin-top:13px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<!-- 免付费 -->
			<div id="bt_divc0" style="position: absolute;left:75px;top:200px;display: block;">
				<img id="bt_jsc0" style="position: absolute;left:-2px;top:-2px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-item-bg.png">
				<p id="bt_psc0" class="p1" style="position:absolute; left:-2px; margin-top:13px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<div id="bt_divc1" style="position: absolute;left:195px;top:200px;display: block;">
				<img id="bt_jsc1" style="position: absolute;left:-1px;top:-3px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_psc1" class="p1" style="position:absolute; left:-2px; margin-top:13px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<div id="bt_divc2" style="position: absolute;left:319px;top:200px;display: block;">
				<img id="bt_jsc2" style="position: absolute;left:-1px;top:-3px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_psc2" class="p1" style="position:absolute; left:-2px; margin-top:13px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>

			<div id="bt_divs0" style="position: absolute;left:75px;top:255px;display: block;">
				<img id="bt_jss0" style="position: absolute;left:-3px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_pss0" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<div id="bt_divs1" style="position: absolute;left:195px;top:255px;display: block;">
				<img id="bt_jss1" style="position: absolute;left:-3px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_pss1" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
			<div id="bt_divs2" style="position: absolute;left:319px;top:255px;display: block;">
				<img id="bt_jss2" style="position: absolute;left:-3px;top:0px;width:121px;height:57px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
				<p id="bt_pss2" class="p1" style="position:absolute; left:0px; margin-top:15px; width:121px; height:23px; line-height:25px; text-align:center; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; padding:0;z-index:10;"></p>
			</div>
		</div>
		<img id="p_type_right" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
		<img id="p_type_left" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
		<img id="p_area_right" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
		<img id="p_area_left" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
		<img id="p_d_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
		<img id="p_d_g" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
		<img id="p_d_h" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
		<img id="p_d_i" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
		<img id="p_d_j" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">

		<img id="bt_prev_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px; width:1px;height:1px">
		<img id="bt_next_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px; width:1px;height:1px">
		<div style="position:absolute;left:290px;top:12px; width:33px;height:45px;z-index:10;"></div>
		<div style="position:absolute;left:0px;top:0px;">
			<img id="bt_pdg_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;width:0px;height:0px;width:230px;height:310px;">
		</div>
		<img id="visitRecord" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/record.png" style="position: absolute;left:1px;top:1px" width="0" height="0">
		<div id="test" style="position: absolute;left:20px;top:300px;font-size:30px;color:#FF0000;"></div>
		<script type="text/javascript">
		
		</script>

	</body>

</html>
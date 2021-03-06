<%@page import="java.net.URLEncoder"%>
<%@page import="com.vstartek.epg.utils.HttpLinkUtils"%>	
<%@page import="com.vstartek.epg.action.TopicAction"%>
<%@page import="com.vstartek.epg.pojo.TopicSeries"%>
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
	
	String pervUrl="&back=special_05&focus_id="+focus_id+"&programa_id="+programa_id+"&perv_num="+perv_num+"&perv_count="+(perv_count+1)+"&pf_focus_id="+pf_focus_id+"&home_focus_id="+home_focus_id+"&home_from="+home_from+"&backUrl="+backUrl_encode;
	
	String from=RequestUtil.getString("from", request);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
	<meta content="IE=5.0000" http-equiv="X-UA-Compatible">
    <meta name="page-view-size" content="1280*720">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<title>专题05</title>
	<script src="config/config.js"></script>	
    <script type="text/javascript" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/ajax.min.js"></script>
	<script type="text/javascript" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/public.js"></script>
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

		var back='<%=back%>';
		var from='<%=from%>';
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
			if(from==''){
				if(back.indexOf("animation_")){
					window.location.href = back+".jsp?programType=<%=programType+pervUrl%>"; //区分列表和首页
				}else{
					window.location.href = "list.jsp?programType=<%=programType+pervUrl%>"; //jsp修改返回列表参数
				}
        	}else{
        		Utility.setValueByName("exitIptvApp");
        	}
		}



		var array = new Array();
		var photo = new Array();
		var cp = new Array();
		var items =new Array();
		var zt_id=<%=id%> ;//jsp修改参数id
		var titles = new Array;
		
		function itemInfo() {
			var url = webset.apiStatic + "topic/<%=programType%>/"+zt_id%10+"/"+zt_id+".json"
			var focus = focus_id.replace("bt_zf", "");
			$.get(url, function (result) {
				var json = eval(result);
				$.each(json.topicDetailList, function (i, item) {
					if(i<5){
						document.getElementById("bt_img" + i).src = item.posterUrl1;
						if (focus == i) {
							document.getElementById("Bg_img").src = item.posterUrl2;
						}
						photo[i] = item.posterUrl2;
						array[i] = item.code;
						cp[i] = item.cpCode;
						items[i] = item.id;
						titles[i] = item.title;
					}
				});
			});
			init();
		};


		var buttons = [{
				id: 'bt_zf0',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: 'bt_zf4',
				rightButtonId: 'bt_zf1',
				blurFun: '',
				focusFun: 'F_FOCUS',
				enterFun: 'F_E_F',
				focusImage: 'special-05-f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_zf1',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: 'bt_zf0',
				rightButtonId: 'bt_zf2',
				blurFun: '',
				focusFun: 'F_FOCUS',
				enterFun: 'F_E_F',
				focusImage: 'special-05-f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_zf2',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: 'bt_zf1',
				rightButtonId: 'bt_zf3',
				blurFun: '',
				focusFun: 'F_FOCUS',
				enterFun: 'F_E_F',
				focusImage: 'special-05-f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_zf3',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: 'bt_zf2',
				rightButtonId: 'bt_zf4',
				blurFun: '',
				focusFun: 'F_FOCUS',
				enterFun: 'F_E_F',
				focusImage: 'special-05-f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_zf4',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: 'bt_zf3',
				rightButtonId: 'bt_zf0',
				blurFun: '',
				focusFun: 'F_FOCUS',
				enterFun: 'F_E_F',
				focusImage: 'special-05-f.png',
				blurImage: 'Pixel.png'
			}
		]


		function F_E_F() {
			var i = focus_id.replace("bt_zf", "");

			var _cpcode = cp[i];
            var _code = array[i];
            var _id = items[i];
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
	    	var _stat="<%=_stat %>"+titles[i];
	    	setTimeout("_STAT('"+_stat+"')", 1);
	    	
            commen_play(_id,_programType,_programType2,_code,_cpcode,'<%=pervUrl%>');
           
		}

		function F_FOCUS() {
			var i = focus_id.replace("bt_zf", "");
			document.getElementById("Bg_img").src = photo[i];
		}
		var focus_id = 'bt_zf0';

		function F_KEY_G_1() {
			DOBUTTONENTERFUN(focus_id);
		}
		
		$.ajaxSetup({
            async: false
        });
	</script>
</head>

<body  onload="itemInfo()">
	<img id="Bg_img" src="" style=" position:absolute;left:0px;top:0px;width:1280px;height:720px;">

	<div id="DIV_F" style="position: absolute; left: 45px; top: 490px; z-index: 11;">
		<img id="IMG_F" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/special-05-f.png">
	</div>
	<div style="position:absolute;left:51px;top:544px;">
		<img id="bt_img0" src="" style="position: absolute;left:0px;top:0px;width:222px;height:145px;;z-index:1;">
	</div>
	<div style="position:absolute;left:45px;top:490px;">
		<img id="bt_zf0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left: 0px; top:0px;width:232px;height:204px;;z-index:10;">
	</div>

	<div style="position:absolute;left:292px;top:544px;">
		<img id="bt_img1" src="" style="position: absolute;left:0px;top:0px;width:222px;height:145px;;z-index:1;">
	</div>
	<div style="position:absolute;left:284px;top:490px;">
		<img id="bt_zf1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left: 0px; top:0px;width:232px;height:204px;;z-index:10;">
	</div>

	<div style="position:absolute;left:532px;top:544px;">
		<img id="bt_img2" src="" style="position: absolute;left:0px;top:0px;width:222px;height:145px;;z-index:1;">
	</div>
	<div style="position:absolute;left:523px;top:490px;">
		<img id="bt_zf2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left: 0px; top:0px;width:232px;height:204px;;z-index:10;">
	</div>

	<div style="position:absolute;left:770px;top:544px;">
		<img id="bt_img3" src="" style="position: absolute;left:0px;top:0px;width:222px;height:145px;;z-index:1;">
	</div>
	<div style="position:absolute;left:762px;top:490px;">
		<img id="bt_zf3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left: 0px; top:0px;width:232px;height:204px;;z-index:10;">
	</div>

	<div style="position:absolute;left:1009px;top:544px;">
		<img id="bt_img4" src="" style="position: absolute;left:0px;top:0px;width:222px;height:145px;;z-index:1;">
	</div>
	<div style="position:absolute;left:1008px;top:490px;">
		<img id="bt_zf4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left: 0px; top:0px;width:232px;height:204px;;z-index:10;">
	</div>

	<img id="visitRecord" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/record.png" style="position: absolute;left:1px;top:1px;" width="0" height="0">
	<div id="test" style="position: absolute;left:20px;top:400px;font-size:30px;color:#FF0000;"><img id="stat" style="left: 1px; top: 1px; position: absolute;" src=""> </div>
	<script type="text/javascript">
		
	</script>

	<div class="saladict-container">
	</div>
</body>
<script type="text/javascript">
   function _STAT(_stat) { //用户点击行为上报
    _stat = encodeURI(encodeURI(_stat));
    var _url = 'http://sta.jisu8.cn/stat?category=' + _stat +'&contid=&style=&label=&id=6955&action=click&account='+userId+'&plat=&vlauncher=&vterminal=';
    _SELECT('stat').src = _url;
   }
</script>
</html>
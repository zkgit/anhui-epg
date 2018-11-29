<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@page import="com.vstartek.epg.utils.HttpLinkUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String programType=RequestUtil.getString("programType", request);
	programType="".equals(programType)?"anime":programType;

	String focus_id=RequestUtil.getString("focus_id", request);
	String programa_id=RequestUtil.getString("programa_id", request);
	String perv_num=RequestUtil.getString("home_perv_num", request);
	int perv_count=RequestUtil.getInt("perv_count", request);
	String pf_focus_id=RequestUtil.getString("pf_focus_id", request);
	String model_plugin_id=RequestUtil.getString("model_plugin_id", request);
	String tradeInfo=RequestUtil.getString("tradeInfo", request);
	String home_focus_id=RequestUtil.getString("home_focus_id", request);
	String home_from=RequestUtil.getString("home_from", request);
	if("".equals(focus_id)){
		focus_id="bt_af0";
	}
	
	String backUrl=RequestUtil.getString("backUrl", request);//接受backUrl
	String backUrl_encode=URLEncoder.encode(backUrl,"UTF-8");
	
	String pervUrl="&home_focus_id="+home_focus_id+"&home_from="+home_from+"&backUrl="+backUrl_encode;
	String programType_ZH=HttpLinkUtils.getProgramType_ZH(programType);
%>
<html>

<head>
	<meta content="IE=5.0000" http-equiv="X-UA-Compatible">
    <meta name="page-view-size" content="1280*720">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>动画</title>
	<jsp:include page="/common/anime_top.jsp" >
		<jsp:param name="t" value="<%=System.currentTimeMillis() %>"/>
	</jsp:include>
	<script> 
		;(function (window, document) {
			var _global;
			//计算函数
			function _bs_filter(e) {
				var _c = {};
				for (i in e) {
					var _b = e[i];
					_c[_b.id] = _b;
				}
				return _c
			}
		
			function getTampTime(start, end) {
				var startDate = parseInt(start),
					endDate = parseInt(new Date(end.replace(/-/g, "/")).getTime());
				return ((endDate - startDate) / (1000 * 60 * 60 * 24) <= 2)
			}
		
			function argsAsArray(fn, arr1, arr2) {
				return fn.call(null, arr1, arr2);
			}
		
			// 构造函数
			function Options() {
				//初始化定义焦点
				this._buttons = [{
					id: 'md_f1',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: 'md_f3',
					rightButtonId: 'md_f2',
					blurFun: 'F_E_BLUR0',
					focusFun: 'F_E_PF0',
					enterFun: '',
					focusImage: 'index-mode-f2.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'md_f2',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: 'md_f1',
					rightButtonId: 'md_f3',
					blurFun: 'F_E_BLUR0',
					focusFun: 'F_E_PF0',
					enterFun: '',
					focusImage: 'index-mode-f2.png',
					blurImage: 'Pixel.png'
				}, {
					id: 'md_f3',
					upButtonId: '',
					downButtonId: '',
					leftButtonId: 'md_f2',
					rightButtonId: 'md_f1',
					blurFun: 'F_E_BLUR0',
					focusFun: 'F_E_PF0',
					enterFun: '',
					focusImage: 'index-mode-f2.png',
					blurImage: 'Pixel.png'
				}];
				this._BS = _bs_filter(this._buttons);
			}
			Options.prototype = {
				iskey: false, //切换键盘
				ordered: "", //是否是会员
				vip_element: false, //挽留页面是否是显示
				focus_id: '<%=model_plugin_id%>' ? '<%=model_plugin_id%>' : 'md_f1', //默认焦点
				coupon_element: false, //会员即将到期选购弹窗页面
				tradeInfo: '<%=tradeInfo%>', //订购回调成功页面参数，成功有返回参数，失败为空
				initHandle: function () {
					var that = this;
					that.vip_element = _SELECT("vipCard").style.display == "block" ? true : false
					if (!that.vip_element) {
						if (<%="".equals(programa_id)?false:true%>) {
							var res = HAS_ORDER(userId, '185385', 'film', '<%=programType_ZH %>挽留页面', false);
							that.ordered = res.ordered
						}
						var code = that.get_info_code()
						if (that.ordered == 0 && code == 1) {
							_SELECT("vipCard").style.display = "block";
							that.iskey = true;
							USER_UPDATA_LOG('1',"EPG_TONGJI",0,'<%=programType_ZH %>新手礼包')
							return false;
						}else{
							F_KEY_G_0();
						}
					} else {
						_SELECT("vipCard").style.display = "none";
					}
				},
				modeHandle: function () {
					_SELECT("vipCard").style.display = "none";
					_SELECT("couponCard").style.display = "none";
					this.iskey = false;
					return false;
				},
				initOrder: function () {
					var that = this;
					that._H_F(that.focus_id)
					var res = HAS_ORDER(userId, '185385', 'film', '<%=programType_ZH %>挽留页面', false)
					that.ordered = res.ordered;
					if (res.ordered == 1 && !that.tradeInfo) {
						var startT = new Date().getTime(),
							endT = res.endDate,
							isTwoDay = getTampTime(startT, endT),
							validDays = res.validDays
						that.endDate = endT; //增加订单接口参数
						if (isTwoDay && validDays == 7 ) {
							var recentOrder = that.recent_order(); //处理订购延迟，接口返回订购状态
							if(recentOrder == 0){
								_SELECT("couponCard").style.display = "block";
								that.iskey = true;
								USER_UPDATA_LOG('2',"EPG_TONGJI",0,'<%=programType_ZH %>挽留页面')
								return false;
							}                  
               			 }
						once = false;
					}
				},
				get_info_code: function () { //获取是否已经领取优惠券
					var _INFO
					$.get(webset.api + 'ad/noviceGiftBagFilm.json?iptvAccount=' + userId,
						function (e) {
							_INFO = eval("(" + e + ")")
						}, false);
					return _INFO.code
				},
				recent_order: function () { //区分到期会员已经续订购会员
					var _INFO
					$.get(webset.authentication + 'order/recentOrder.json?itvAccount=' + userId,
						function (e) {
							_INFO = eval("(" + e + ")")
						}, false);
					return _INFO.response.responseBody.hasOrder
				},
				// 生成订单,跳转订购页面
				create_new_order: function () {
					var orderType = arguments[0],
						endDate = arguments[1]
					$.get(webset.authentication + 'order/createorder4H5New.json?itvAccount=' + userId +
						'&combineId=364013&type=film&title=<%=programType_ZH %>挽留页面&cpCode=bstv&remark=&orderType=' + orderType + '&endDate=' + endDate,
						function (res) {
							var res = eval("(" + res + ")");
							var autoRenew = orderType == 1 ? 1 : 0;
							if (res && res.response.responseHeader && res.response.responseHeader.code == '200') {
								var CO_DATA = res.response.responseBody,
									pervUrl = window.location.href;
								if ('<%=model_plugin_id%>') {
									pervUrl = pervUrl.replace('<%=model_plugin_id%>', 'md_f' + orderType)
								} else {
									pervUrl = pervUrl + '&model_plugin_id=md_f' + orderType;
								}
								window.location.href = 'http://61.191.45.118:7002/itv-api/order?returnUrl=' +
									encodeURIComponent(pervUrl) + '&providerId=' + CO_DATA.providerId +
									'&orderInfo=' + CO_DATA.orderInfo + '&notifyUrl=' + CO_DATA.notifyUrl + '&auto_renew=' + autoRenew;
							}
						}, false);
				},
				_login: function () { //跳转领券页面；
					var _url = window.location.href;
					window.location.href = "http://117.71.47.120:9090/epg/login.jsp?backURL=" + encodeURIComponent(_url)
				},
				_H_F: function (_id) {
					var that = this;
					if (that._BS[that.focus_id] != undefined && that._BS[_id] != undefined) {
						_SELECT(that.focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + that._BS[that.focus_id]['blurImage'];
						_SELECT(_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + that._BS[_id]['focusImage'];
						that.focus_id = _id;
					}
				},
				F_KEY_G_1: function () { //进入
					var that = this
					that.coupon_element = _SELECT("couponCard").style.display == "block" ? true : false
					that.vip_element = _SELECT("vipCard").style.display == "block" ? true : false
					if (that.vip_element) {
						that._login();
						return false
					} else if (that.coupon_element) {
						try{
						var ID = parseInt(that.focus_id.replace(/[^0-9]/ig, ""))
						argsAsArray(that.create_new_order, ID, that.endDate)
						}catch(e){}
					}
				},
				//向左触发事件,并改变移入位置的样式，that._BS[that.focus_id]['leftButtonId']为新选中元素的id，下边三个方法同理
				F_KEY_G_4: function () {
					var that = this;
					if (that._BS[that.focus_id] != undefined && that._BS[that.focus_id]['leftButtonId'] != '') {
						that._H_F(that._BS[that.focus_id]['leftButtonId']);
					}
					return;
				},
				//向上触发事件
				F_KEY_G_5: function () {
					var that = this;
					if (that._BS[that.focus_id] != undefined && that._BS[that.focus_id]['upButtonId'] != '') {
						that._H_F(that._BS[that.focus_id]['upButtonId']);
					}
					return;
				},
				//向右触发事件
				F_KEY_G_6: function () {
					var that = this;
					if (that._BS[that.focus_id] != undefined && that._BS[that.focus_id]['rightButtonId'] != '') {
						that._H_F(that._BS[that.focus_id]['rightButtonId'])
					};
					return;
				},
				//向下触发事件
				F_KEY_G_7: function () {
					var that = this;
					if (that._BS[that.focus_id] != undefined && that._BS[that.focus_id]['downButtonId'] != '') {
						that._H_F(that._BS[that.focus_id]['downButtonId'])
					};
					return;
				},
				//blurFun
				DOBUTTONBLURFUN: function (_id) { //dobuttonblurfun
					var that = this;
					if (that._BS[_id] != undefined && that._BS[_id]['blurFun'] != undefined && that._BS[_id]['blurFun'] != '') {
						var _b = that._BS[_id];
						var fun = _b['blurFun'];
						eval("(" + fun + ")")();
					}
				},
				//focusFun
				DOBUTTONFOCUSFUN: function (_id) { //dobuttonfocusfun
					var that = this;
					if (that._BS[_id] != undefined && that._BS[_id]['focusFun'] != undefined && that._BS[_id]['focusFun'] != '') {
						var _b = that._BS[_id];
						var fun = _b['focusFun'];
						eval("(that." + fun + ")")();
					}
				},
				//enterFun
				DOBUTTONENTERFUN: function (_id) { //dobuttonenterfun
					var that = this;
					if (that._BS[_id] != undefined && that._BS[_id]['enterFun'] != undefined && that._BS[_id]['enterFun'] != '') {
						var _b = that._BS[_id];
						var fun = _b['enterFun'];
						eval("(" + fun + ")")();
					}
				},
			}
		
			//插件的名称------暴露接口
			_global = (function () {
				return this || (0, eval)('this');
			}());
			if (typeof module !== "undefined" && module.exports) {
				module.exports = ModelPlugin;
			} else if (typeof define === "function" && define.amd) {
				define(function () {
					return ModelPlugin;
				});
			} else {
				!('ModelPlugin' in _global) && (_global.ModelPlugin = Options);
			}
		})(window, document);
		</script>
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
	
   var ModelPlugin = new ModelPlugin()//*弹窗*,创建插件实例
   var once=true,currentCount=0;//*弹窗*,控制返回是否弹出挽留
    //键值
    function keyStill(KV){
        if ('F_SHOW' in window) {
            F_SHOW(KV);
        }
        if ('F_KEY_G_0' in window) {
            currentCount++
            if(currentCount>=2){F_KEY_G_0();}
            if(once&&'<%=programType%>'=='arts'?true:false){//*弹窗*,返回键监听，弹窗挽留
                ModelPlugin.initHandle() 
                once=false;
                return false
            }
			F_KEY_G_0();
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
        }
    }
 
    //挽留页面隔离键值
    function keyDetain(KV){
            if ('F_SHOW' in window) {
                 F_SHOW(KV);
            }
            if (KV == KEY_G_0) {
                console.info(KEY_G_0, '+++++++返回')
                ModelPlugin.modeHandle()
            } else if (KV == KEY_G_1) {
                console.info(KEY_G_1, '+++++++进入')
                ModelPlugin.F_KEY_G_1();
            }  else if (KV == KEY_G_4) {
                console.info(KEY_G_4, '+++++++左键')
                ModelPlugin.F_KEY_G_4();
            } else if (KV == KEY_G_5) {
                console.info(KEY_G_5, '+++++++上键')
                ModelPlugin.F_KEY_G_5();
            } else if (KV == KEY_G_6) {
                console.info(KEY_G_6, '+++++++右键')
                ModelPlugin.F_KEY_G_6();
            } else if (KV == KEY_G_7) {           
                console.info(KEY_G_7, '+++++++下键')
                ModelPlugin.F_KEY_G_7();
        } 
    }
   
    window.document.onkeypress = function (keyEvent) {
        keyEvent = keyEvent ? keyEvent : window.event;
        var KV = keyEvent.which ? keyEvent.which : keyEvent.keyCode;
        if(ModelPlugin.iskey){
            keyDetain(KV)
        }else(
            keyStill(KV)
        )
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
					var gb = _SELECT(focus_id);
					_SELECT("DIV_F").style.left = gb.getBoundingClientRect().left + 'px';
					_SELECT("DIV_F").style.top = gb.getBoundingClientRect().top + 'px';
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
			//*弹窗*,显示推荐会员弹窗入口
			if(<%="".equals(programa_id)?true:false%>&&'<%=programType%>'=='arts'?true:false){
            	ModelPlugin.initOrder()
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
					_SELECT("DIV_F").style.left = gb.getBoundingClientRect().left + 'px';
					_SELECT("DIV_F").style.top = gb.getBoundingClientRect().top + 'px';
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
		var home_focus_id='<%=home_focus_id%>';
		var home_from='<%=home_from%>';

		function F_KEY_G_0() {
			if(home_focus_id!=""){
	    		window.location.href = "index.jsp?home_focus_id="+home_focus_id+"&backUrl=<%=backUrl_encode%>";
	    	}else if("ceshi"==home_from){
	    		window.location.href = "TEST_F_T_A_C_D_E.html";
	    	}else{
	    		<%
					String txt="";
					if(backUrl.equals("")){
						txt="Utility.setValueByName(\"exitIptvApp\");";
					}else{
						txt="window.location.href = \""+URLDecoder.decode(backUrl,"UTF-8")+"\"";
					}
				%>
				<%=txt%>	    		
	    	}
		}

		function F_KEY_N_0() {//数字返回
			if(home_focus_id!=""){
	    		window.location.href = "index.jsp?home_focus_id="+home_focus_id;
	    	}else if("ceshi"==home_from){
	    		window.location.href = "TEST_F_T_A_C_D_E.html";
	    	}else{
	    		Utility.setValueByName("exitIptvApp");
	    	}
		}


		var buttons = [{
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
			},
			{
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
			},
			{
				id: 'bt_af0',
				upButtonId: '',
				downButtonId: 'bt_af3',
				leftButtonId: '',
				rightButtonId: 'bt_af1',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_LOOKANIME', //F_LOOKANIME看动画
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_af1',
				upButtonId: '',
				downButtonId: 'bt_af2',
				leftButtonId: 'bt_af0',
				rightButtonId: 'bt_pdg_a',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_LOOKCOMIC', //动漫
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_af2',
				upButtonId: 'bt_af1',
				downButtonId: 'bt_af7',
				leftButtonId: 'bt_af3',
				rightButtonId: 'bt_pdg_b',
				blurFun: '',
				focusFun: 'F_AF2_F',
				enterFun: 'F_CARTOONMAN', //卡通人物
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_af3',
				upButtonId: 'bt_af0',
				downButtonId: 'bt_bf4',
				leftButtonId: '',
				rightButtonId: 'bt_af2',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_QUIZ', //益智
				focusImage: 'anime-index-f02.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_bf4',
				upButtonId: 'bt_af3',
				downButtonId: 'bt_pdg_g',
				leftButtonId: '',
				rightButtonId: 'bt_af2',
				blurFun: '',
				focusFun: 'F_AF2_F',
				enterFun: 'F_WHISTORY', //F_WHISTORY观看历史
				focusImage: 'anime-index-ls.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_bf5',
				upButtonId: 'bt_bf4',
				downButtonId: 'bt_pdg_g',
				leftButtonId: '',
				rightButtonId: 'bt_af2',
				blurFun: 'F_RF_HB', //
				focusFun: 'F_RF_HF', //
				enterFun: 'F_HIS_AF5', //历史记录1/2
				focusImage: 'anime-index-ls.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_bf6',
				upButtonId: 'bt_bf5',
				downButtonId: 'bt_af7',
				leftButtonId: '',
				rightButtonId: 'bt_af2',
				blurFun: 'F_RF_HB',
				focusFun: 'F_RF_HF',
				enterFun: 'F_HIS_AF6', //历史记录1/2
				focusImage: 'anime-index-ls.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_af7',
				upButtonId: 'bt_af2',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: 'bt_pdg_b',
				blurFun: '',
				focusFun: '',
				enterFun: 'F_TO_ZTHD', //F_LOOKANIME专题/活动
				focusImage: 'anime-index-zt-f.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f0',
				upButtonId: 'bt_lmf0',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_af2',
				rightButtonId: 'bt_f1',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0', //播放
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f1',
				upButtonId: 'bt_lmf1',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_f0',
				rightButtonId: 'bt_f2',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f2',
				upButtonId: 'bt_lmf1',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_f1',
				rightButtonId: 'bt_f3',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f3',
				upButtonId: 'bt_lmf2',
				downButtonId: 'bt_pdg_f',
				leftButtonId: 'bt_f2',
				rightButtonId: '',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f4',
				upButtonId: 'bt_pdg_r',
				downButtonId: 'bt_f8',
				leftButtonId: 'bt_af1',
				rightButtonId: 'bt_f5',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f5',
				upButtonId: 'bt_pdg_r',
				downButtonId: 'bt_f9',
				leftButtonId: 'bt_f4',
				rightButtonId: 'bt_f6',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f6',
				upButtonId: 'bt_pdg_r',
				downButtonId: 'bt_f10',
				leftButtonId: 'bt_f5',
				rightButtonId: 'bt_f7',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f7',
				upButtonId: 'bt_pdg_r',
				downButtonId: 'bt_f11',
				leftButtonId: 'bt_f6',
				rightButtonId: 'bt_f8',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f8',
				upButtonId: 'bt_f4',
				downButtonId: 'bt_pdg_c',
				leftButtonId: 'bt_af2',
				rightButtonId: 'bt_f9',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f9',
				upButtonId: 'bt_f5',
				downButtonId: 'bt_pdg_c',
				leftButtonId: 'bt_f8',
				rightButtonId: 'bt_f10',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f10',
				upButtonId: 'bt_f6',
				downButtonId: 'bt_pdg_c',
				leftButtonId: 'bt_f9',
				rightButtonId: 'bt_f11',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f11',
				upButtonId: 'bt_f7',
				downButtonId: 'bt_pdg_c',
				leftButtonId: 'bt_f10',
				rightButtonId: '',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f12',
				upButtonId: 'bt_pdg_d',
				downButtonId: 'bt_f16',
				leftButtonId: 'bt_af1',
				rightButtonId: 'bt_f13',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f13',
				upButtonId: 'bt_pdg_d',
				downButtonId: 'bt_f17',
				leftButtonId: 'bt_f12',
				rightButtonId: 'bt_f14',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f14',
				upButtonId: 'bt_pdg_d',
				downButtonId: 'bt_f18',
				leftButtonId: 'bt_f13',
				rightButtonId: 'bt_f15',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f15',
				upButtonId: 'bt_pdg_d',
				downButtonId: 'bt_f19',
				leftButtonId: 'bt_f14',
				rightButtonId: 'bt_f16',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f16',
				upButtonId: 'bt_f12',
				downButtonId: 'bt_pdg_e',
				leftButtonId: 'bt_af2',
				rightButtonId: 'bt_f17',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f17',
				upButtonId: 'bt_f13',
				downButtonId: 'bt_pdg_e',
				leftButtonId: 'bt_f16',
				rightButtonId: 'bt_f18',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f18',
				upButtonId: 'bt_f14',
				downButtonId: 'bt_pdg_e',
				leftButtonId: 'bt_f17',
				rightButtonId: 'bt_f19',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f19',
				upButtonId: 'bt_f15',
				downButtonId: 'bt_pdg_e',
				leftButtonId: 'bt_f18',
				rightButtonId: '',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f20',
				upButtonId: 'bt_pdg_h',
				downButtonId: 'bt_f24',
				leftButtonId: 'bt_af1',
				rightButtonId: 'bt_f21',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f21',
				upButtonId: 'bt_pdg_h',
				downButtonId: 'bt_f25',
				leftButtonId: 'bt_f20',
				rightButtonId: 'bt_f22',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f22',
				upButtonId: 'bt_pdg_h',
				downButtonId: 'bt_f26',
				leftButtonId: 'bt_f21',
				rightButtonId: 'bt_f23',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f23',
				upButtonId: 'bt_pdg_h',
				downButtonId: 'bt_f27',
				leftButtonId: 'bt_f22',
				rightButtonId: 'bt_f24',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f24',
				upButtonId: 'bt_f20',
				downButtonId: '',
				leftButtonId: 'bt_af2',
				rightButtonId: 'bt_f25',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f25',
				upButtonId: 'bt_f21',
				downButtonId: '',
				leftButtonId: 'bt_f24',
				rightButtonId: 'bt_f26',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f26',
				upButtonId: 'bt_f22',
				downButtonId: '',
				leftButtonId: 'bt_f25',
				rightButtonId: 'bt_f27',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_f27',
				upButtonId: 'bt_f23',
				downButtonId: '',
				leftButtonId: 'bt_f26',
				rightButtonId: '',
				blurFun: 'F_B_F0',
				focusFun: 'F_E_RF',
				enterFun: 'F_E_F0',
				focusImage: 'anime-index-f01.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_lmf0', //专题1/2/3
				upButtonId: '',
				downButtonId: 'bt_f0',
				leftButtonId: 'bt_af1',
				rightButtonId: 'bt_lmf1',
				blurFun: 'F_E_LMB',
				focusFun: 'F_E_LMF',
				enterFun: 'F_TOHOT_ZT',
				focusImage: 'anime-index-f03.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_lmf1',
				upButtonId: '',
				downButtonId: 'bt_f1',
				leftButtonId: 'bt_lmf0',
				rightButtonId: 'bt_lmf2',
				blurFun: 'F_E_LMB',
				focusFun: 'F_E_LMF',
				enterFun: 'F_TOHOT_ZT',
				focusImage: 'anime-index-f03.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_lmf2',
				upButtonId: '',
				downButtonId: 'bt_f3',
				leftButtonId: 'bt_lmf1',
				rightButtonId: '',
				blurFun: 'F_E_LMB',
				focusFun: 'F_E_LMF',
				enterFun: 'F_TOHOT_ZT',
				focusImage: 'anime-index-f03.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pdg_f',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_PFG_F',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pdg_r',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_PFG_R',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pdg_g',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_PFG_G',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pdg_a',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_PFG_A',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pdg_b',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_PFG_B',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pdg_c',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_PFG_C',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pdg_d',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_PFG_D',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pdg_e',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_PFG_E',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			},
			{
				id: 'bt_pdg_h',
				upButtonId: '',
				downButtonId: '',
				leftButtonId: '',
				rightButtonId: '',
				blurFun: '',
				focusFun: 'F_PFG_H',
				enterFun: '',
				focusImage: 'Pixel.png',
				blurImage: 'Pixel.png'
			}

		]

		//第一页往下
		function F_PFG_F() {
			_SELECT("partone").style.display = "none";
			_SELECT("parttwo").style.display = "block";
			se_p = "2";
			//focus_id="bt_f4";
			var focus_id_f = "";
			if (focus_flag == 'bt_f0') {
				focus_id_f = "bt_f4";
			} else if (focus_flag == 'bt_f1') {
				focus_id_f = "bt_f5";
			} else if (focus_flag == 'bt_f2') {
				focus_id_f = "bt_f6";
			} else if (focus_flag == 'bt_f3') {
				focus_id_f = "bt_f7";
			}
			_H_F(focus_id_f);
		}
		//第二页往上
		function F_PFG_R() {
			_SELECT("parttwo").style.display = "none";
			_SELECT("partone").style.display = "block";
			var i = parseInt(focus_flag.replace('bt_f', ''));
			var focus_id_f = "";
			if ('4' == i) {
				focus_id_f = "bt_f0";
			} else if ('5' == i) {
				focus_id_f = "bt_f1";
			} else if ('6' == i) {
				focus_id_f = "bt_f2";
			} else if ('7' == i) {
				focus_id_f = "bt_f3";
			}
			_H_F(focus_id_f);
		}

		var item_id = new Array();
		var programa_id = new Array();
		var programa_url = new Array();
		var seriesCp_cpCode = new Array();
		var item_code = new Array();
		var history_item_id = new Array();
		var history_seriesCp_cpCode = new Array();
		var se_p = "<%="".equals(perv_num)?"1":perv_num%>";//jsp绑定当前页数(链接参数perv_num)，默认为1
		//热门推荐
		//$(document).ready(function(){
		function initdatas() {
			if (focus_id.indexOf("bt_f") >= 0) {
				var i = parseInt(focus_id.replace('bt_f', ''));
				if (i < 4) {
					_SELECT("partone").style.display = "block";
				} else if (i >= 4 && i < 12) {
					_SELECT("parttwo").style.display = "block";
				} else if (i >= 12 && i < 20) {
					_SELECT("partthree").style.display = "block";
				} else if (i >= 20 && i < 28) {
					_SELECT("partfour").style.display = "block";
				}
			} else {
				if (se_p == "1") {
					_SELECT("partone").style.display = "block";
				} else if (se_p == "2") {
					_SELECT("parttwo").style.display = "block";
				} else if (se_p == "3") {
					_SELECT("partthree").style.display = "block";
				} else if (se_p == "4") {
					_SELECT("partfour").style.display = "block";
				}
			}
			getHotprograma();
			getHotitems();
			gethistory();
			init();
			FYY();
		}
		//});

		function F_LOOKANIME() {//看动画
			window.location.href = "animation_kdh_list.jsp?back=animation_index<%=pervUrl%>&home_perv_num="+se_p
		}

		function F_CARTOONMAN() {//卡通人物
			window.location.href = "animation_cartoon.jsp?back=animation_index<%=pervUrl%>&home_perv_num="+se_p
		}

		function F_LOOKCOMIC() {////动漫
			window.location.href = "animation_dm_list.jsp?back=animation_index<%=pervUrl%>&home_perv_num="+se_p
		}

		function F_QUIZ() {//益智
			window.location.href = "animation_yz_list.jsp?back=animation_index<%=pervUrl%>&home_perv_num="+se_p
		}

		function F_WHISTORY() {//历史
			window.location.href = "animation_history.jsp?back=animation_index<%=pervUrl%>&home_perv_num="+se_p
		}

		function F_TO_ZTHD() {//专题、活动
			window.location.href = "animation_special_list.jsp?back=animation_index<%=pervUrl%>&home_perv_num="+se_p
		}

		function getHotprograma() { //热门专题
			var url = webset.apiStatic + "topic/anime/hottopic.json";
			$.get(url, function (result) {
				var json = eval('(' + result + ')');
            	$.each(json.hotTopicList, function (i, item) {
					//if(i != 0){
					programa_id.push(item.id);
					programa_url.push(item.topictemplate);
					_SELECT("bt_lms" + i).src = item.posterUrl1;
					_SELECT("bt_lmp" + i).innerHTML = item.title;
					lmf_name.push(item.title);
					//}
				});
			}, false);
		}

		// var item_poster = new Array();
		var seriesCp_name = new Array();
		// var item_charge = new Array();

		function getHotitems() { //热门推荐
			var url = webset.apiStatic + "programType/<%=programType%>_new/00/9decsdg6g7h8j9j5h4g3hfb5h6j7n100_1.json";
			$.get(url, function (result) {
           		 var json = eval('(' + result + ')');
				$.each(json.res.currentPageList, function (i, item) {
					_SELECT("div_f" + i).style.display = "block";
					_SELECT("bt_s" + i).src = item.imagetv;
					_SELECT("bt_p" + i).innerHTML = item.title;
					if (item.bcharging == '1') {
						_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
					} else {
						_SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
					}
					// _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +".png";
					if ((i >= 4 && i < 8) || (i >= 12 && i < 16) || (i >= 20 && i < 24)) {
						_SELECT("bt_s0" + i).style.backgroundImage = "url('" + item.imagetv + "')";
						if (item.bcharging == '1') {
							_SELECT("bt_jb0" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png";
						} else {
							_SELECT("bt_jb0" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png";
						}
						// _SELECT("im_jb0" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
						// 	".png";
					}
					item_id.push(item.id);
					seriesCp_cpCode.push(item.cpCode);
					item_code.push(item.code);
					// item_poster.push(item.item_poster);
					seriesCp_name.push(item.title);
					// item_charge.push(item.item_charge);

				});
			}, false);
		}

		var history_item_id1 = "";
		var history_item_id2 = "";
		var history_seriesCp_cpCode1 = "";
		var history_seriesCp_cpCode2 = "";

		function gethistory() {
			history_item_id = [];
			history_seriesCp_cpCode = [];
			var url = webset.api+"history/<%=programType%>.json?userid="+userId+"&pageNo=1";
			$.get(url, function (result) {
				var json = eval('(' + result + ')');
				
				$.each(json.currentPageList, function (i, item) {
					if(i==0){
						blockDiv("div_bf5");
						_SELECT("bt_bp5").innerHTML = json.currentPageList[0].title;
						history_item_id1 = json.currentPageList[0].id;
						history_seriesCp_cpCode1 = json.currentPageList[0].cpCode;
						history_code1 = json.currentPageList[0].code;
					}else if(i==1) {
						blockDiv("div_bf6");
						_SELECT("bt_bp6").innerHTML = json.currentPageList[1].title;
						history_seriesCp_cpCode2 = json.currentPageList[1].cpCode;
						history_code2 = json.currentPageList[1].code;
					}
				});
				
			}, false);

		}

		function F_HIS_AF5() {
			var _cpcode = history_seriesCp_cpCode1,
                _code = history_code1,
                _id = history_item_id1,
                _programType='<%=programType%>',
				_programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
			commen_play(_id,_programType,_programType2,_code,_cpcode,"&back=animation_index&focus_id="+focus_id+"&home_perv_num="+se_p);			
		}

		function F_HIS_AF6() {
			var _cpcode = history_seriesCp_cpCode2,
                _code = history_code2,
                _id = history_item_id2,
                _programType='<%=programType%>',
				_programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
			commen_play(_id,_programType,_programType2,_code,_cpcode,"&back=animation_index&focus_id="+focus_id+"&home_perv_num="+se_p);			
		}

		function F_TOHOT_ZT() {
			var i = parseInt(focus_id.replace('bt_lmf', ''));
			//专题JSP修改
			window.location.href = "special_" + programa_url[i] + ".jsp?back=animation_index&programType=<%=programType%>&id=" +
				programa_id[i] +"&focus_id=" + focus_id + "&perv_num=1<%=pervUrl%>";
		}

		var focus_flag = "";
		var item_name = "";

		function F_E_RF() {
			focus_flag = focus_id;
			item_name = _SELECT(focus_id.replace('f', 'p')).innerHTML;
			if (item_name.length > 8) {
				_SELECT(focus_id.replace('f', 'p')).innerHTML = '<marquee direction="left">' + item_name + "</marquee>";
			}
		}

		function F_B_F0() {
			_SELECT(focus_id.replace('f', 'p')).innerHTML = '' + item_name + "";
		}

		var lm_name = "";

		function F_E_LMF() {
			lm_name = _SELECT(focus_id.replace('f', 'p')).innerHTML;
			if (lm_name.length > 8) {
				_SELECT(focus_id.replace('f', 'p')).innerHTML = '<marquee direction="left">' + lm_name + "</marquee>";
			}
		}

		function F_E_LMB() {
			_SELECT(focus_id.replace('f', 'p')).innerHTML = '' + lm_name + "";
		}

		var history_name = "";

		function F_RF_HF() {
			focus_flag = focus_id;
			history_name = _SELECT(focus_id.replace('f', 'p')).innerHTML;
			if (history_name.length > 7) {
				_SELECT(focus_id.replace('f', 'p')).innerHTML = '<marquee direction="left">' + history_name + "</marquee>";
			}
		}

		function F_RF_HB() {
			_SELECT(focus_id.replace('f', 'p')).innerHTML = '' + history_name + "";
		}

		function F_E_F0() {
			//播放
			var i = parseInt(focus_id.replace('bt_f', ''));
			var _cpcode = seriesCp_cpCode[i],
                _code = item_code[i],
                _id = item_id[i],
                _programType='<%=programType%>',
				_programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
			commen_play(_id,_programType,_programType2,_code,_cpcode,"&back=animation_index&focus_id="+focus_id+"&home_perv_num="+se_p);			
		}

	

		function F_AF2_F() {
			focus_flag = focus_id;
		}

		function F_PFG_G() {
			var i = parseInt(focus_flag.replace('bt_bf', ''));
			if (_SELECT("div_bf" + (i + 1)).style.display == 'none') {
				//focus_id="bt_af7";
				_H_F("bt_af7");
			} else {
				//focus_id="bt_bf"+(i+1);
				_H_F("bt_bf" + (i + 1));
			}
		}

		function F_PFG_A() {
			if (_SELECT("partone").style.display == "block") {
				_H_F("bt_lmf0");
			} else if (_SELECT("parttwo").style.display == "block") {
				_H_F("bt_f4");
			} else if (_SELECT("partthree").style.display == "block") {
				_H_F("bt_f12");
			} else if (_SELECT("partfour").style.display == "block") {
				_H_F("bt_f20");
			}
		}

		function F_PFG_B() {
			if (_SELECT("partone").style.display == "block") {
				_H_F("bt_f0");
			} else if (_SELECT("parttwo").style.display == "block") {
				_H_F("bt_f8");
			} else if (_SELECT("partthree").style.display == "block") {
				_H_F("bt_f16");
			} else if (_SELECT("partfour").style.display == "block") {
				_H_F("bt_f24");
			}
		}
		//第二页往下翻页
		function F_PFG_C() {
			_SELECT("parttwo").style.display = "none";
			_SELECT("partthree").style.display = "block";
			se_p = "3";
			var focus_id_f = "";
			if (focus_flag == 'bt_f8') {
				focus_id_f = "bt_f12";
			} else if (focus_flag == 'bt_f9') {
				focus_id_f = "bt_f13";
			} else if (focus_flag == 'bt_f10') {
				focus_id_f = "bt_f14";
			} else if (focus_flag == 'bt_f11') {
				focus_id_f = "bt_f15";
			}
			_H_F(focus_id_f);
		}
		//第三页往上翻页
		function F_PFG_D() {
			_SELECT("partthree").style.display = "none";
			_SELECT("parttwo").style.display = "block";
			se_p = "2";
			var focus_id_f = "";
			if (focus_flag == 'bt_f12') {
				focus_id_f = "bt_f8";
			} else if (focus_flag == 'bt_f13') {
				focus_id_f = "bt_f9";
			} else if (focus_flag == 'bt_f14') {
				focus_id_f = "bt_f10";
			} else if (focus_flag == 'bt_f15') {
				focus_id_f = "bt_f11";
			}
			_H_F(focus_id_f);
		}
		//第三页往下翻页
		function F_PFG_E() {
			_SELECT("partthree").style.display = "none";
			_SELECT("partfour").style.display = "block";
			se_p = "4";
			var focus_id_f = "";
			if (focus_flag == 'bt_f16') {
				focus_id_f = "bt_f20";
			} else if (focus_flag == 'bt_f17') {
				focus_id_f = "bt_f21";
			} else if (focus_flag == 'bt_f18') {
				focus_id_f = "bt_f22";
			} else if (focus_flag == 'bt_f19') {
				focus_id_f = "bt_f23";
			}
			_H_F(focus_id_f);
		}
		//第四页往上翻页
		function F_PFG_H() {
			_SELECT("partfour").style.display = "none";
			_SELECT("partthree").style.display = "block";
			se_p = "3";
			var focus_id_f = "";
			if (focus_flag == 'bt_f20') {
				focus_id_f = "bt_f16";
			} else if (focus_flag == 'bt_f21') {
				focus_id_f = "bt_f17";
			} else if (focus_flag == 'bt_f22') {
				focus_id_f = "bt_f18";
			} else if (focus_flag == 'bt_f23') {
				focus_id_f = "bt_f19";
			}
			_H_F(focus_id_f);
		}


		// var pf_focus_id = 'bt_af0';
		var focus_id = '<%=focus_id%>';
		// var pf_f = 'bt_f0';

		function F_KEY_G_1() {
			DOBUTTONENTERFUN(focus_id);
		}

		//var seriesCp_name=new Array(); 
		var lmf_name = new Array();

		function FYY() {
			var scene = {
				_scene: "com.iflytek.xiri.MGTV",
				_commands: {

					"bt_af0": ["看动画"],
					"bt_af1": ["动漫"],
					"bt_af2": ["卡通人物"],
					"bt_af3": ["益智"],
					"bt_bf4": ["观看历史"],
					"bt_af7": ["专题活动"],
					"bt_lmf0": ["" + lmf_name[0] + ""],
					"bt_lmf1": ["" + lmf_name[1] + ""],
					"bt_lmf2": ["" + lmf_name[2] + ""],
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
					"bt_f10": ["" + seriesCp_name[10] + ""],
					"bt_f11": ["" + seriesCp_name[11] + ""],
					"bt_f12": ["" + seriesCp_name[12] + ""],
					"bt_f13": ["" + seriesCp_name[13] + ""],
					"bt_f14": ["" + seriesCp_name[14] + ""],
					"bt_f15": ["" + seriesCp_name[15] + ""],
					"bt_f16": ["" + seriesCp_name[16] + ""],
					"bt_f17": ["" + seriesCp_name[17] + ""],
					"bt_f18": ["" + seriesCp_name[18] + ""],
					"bt_f19": ["" + seriesCp_name[19] + ""],
					"bt_f20": ["" + seriesCp_name[20] + ""],
					"bt_f21": ["" + seriesCp_name[21] + ""],
					"bt_f22": ["" + seriesCp_name[22] + ""],
					"bt_f23": ["" + seriesCp_name[23] + ""],
					"bt_f24": ["" + seriesCp_name[24] + ""],
					"bt_f25": ["" + seriesCp_name[25] + ""],
					"bt_f26": ["" + seriesCp_name[26] + ""],
					"bt_f27": ["" + seriesCp_name[27] + ""],
					"_PAGE": ["$P(_PAGE)"],
					"test1": ["测试1"],
					"test2": ["测试2"]
				},
				_feedbacks: {

					"bt_af0": '打开看动画',
					"bt_af1": '打开动漫',
					"bt_af2": '打开卡通人物',
					"bt_af3": '打开益智',
					"bt_bf4": '打开观看历史',
					"bt_af7": '打开专题活动',
					"bt_lmf0": '打开' + lmf_name[0] + '',
					"bt_lmf1": '打开' + lmf_name[1] + '',
					"bt_lmf2": '打开' + lmf_name[2] + '',
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
					"bt_f10": '打开' + seriesCp_name[10] + '',
					"bt_f11": '打开' + seriesCp_name[11] + '',
					"bt_f12": '打开' + seriesCp_name[12] + '',
					"bt_f13": '打开' + seriesCp_name[13] + '',
					"bt_f14": '打开' + seriesCp_name[14] + '',
					"bt_f15": '打开' + seriesCp_name[15] + '',
					"bt_f16": '打开' + seriesCp_name[16] + '',
					"bt_f17": '打开' + seriesCp_name[17] + '',
					"bt_f18": '打开' + seriesCp_name[18] + '',
					"bt_f19": '打开' + seriesCp_name[19] + '',
					"bt_f20": '打开' + seriesCp_name[20] + '',
					"bt_f21": '打开' + seriesCp_name[21] + '',
					"bt_f22": '打开' + seriesCp_name[22] + '',
					"bt_f23": '打开' + seriesCp_name[23] + '',
					"bt_f24": '打开' + seriesCp_name[24] + '',
					"bt_f25": '打开' + seriesCp_name[25] + '',
					"bt_f26": '打开' + seriesCp_name[26] + '',
					"bt_f27": '打开' + seriesCp_name[27] + '',
					"test1": '为你测试1',
					"test2": '为你测试2'
				}
			};
			var callback = function (intent) {
				var _command = intent['_command'];
				if (_command == '_PAGE') {
					var action = intent['_action'];
					if (action == 'NEXT') {
						if (se_p == "1") {
							F_PFG_F();
							return;
						} else if (se_p == "2") {
							F_PFG_C();
							return;
						} else if (se_p == "3") {
							F_PFG_E();
							return;
						} else if (se_p == "4") {
							return;
						}
					} else if (action == 'PREV') {
						if (se_p == "1") {
							return;
						} else if (se_p == "2") {
							F_PFG_R();
							return;
						} else if (se_p == "3") {
							F_PFG_D();
							return;
						} else if (se_p == "4") {
							F_PFG_H();
							return;
						}
					} else if (action == 'INDEX') {
						var index = intent['index'];
						_SELECT("partone").style.display = "none";
						_SELECT("parttwo").style.display = "none";
						_SELECT("partthree").style.display = "none";
						_SELECT("partfour").style.display = "none";
						if (index == 1) {
							_SELECT("partone").style.display = "block";
						} else if (index == 2) {
							_SELECT("parttwo").style.display = "block";
						} else if (index == 3) {
							_SELECT("partthree").style.display = "block";
						} else if (index == 4) {
							_SELECT("partfour").style.display = "block";
						}
						return;
					}
				}
				_H_F(_command);
				DOBUTTONENTERFUN(_command);
			}
			var listener = new Xiri.Listener(callback);
			listener.regist(scene);
		}
	</script>



	<style type="text/css">
		.p0 {
			font-size: 20px
		}

		.p1 {
			font-size: 20px
		}
	</style>


	<style type="text/css">
		.velocity-animating {
			transition: all 300ms ease-in-out 0s;
			-webkit-transition: all 300ms ease-in-out 0s;
		}

		.im1 {
			left: 0px;
			top: 0px;
			width: 239px;
			height: 203px;
		}

		.im2 {
			left: -13px;
			top: -13px;
			width: 276px;
			height: 235px;
		}
	</style>
</head>

<body onload="initdatas()" bgcolor="transparent">
	<!--挽留弹窗 -->
    <img id="vipCard" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-toast1.png" style="display:none;position:absolute;left:0px;top:0px;width:1280px;height:720px;z-index: 120">
    <!--订购弹窗 -->
    <div id="couponCard" style="display:none;">
        <img id="md_f1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"  style="position:absolute;left:328px;top:486px;width:auto;height:auto;z-index: 121">
        <img id="md_f2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"  style="position:absolute;left:553px;top:486px;width:auto;height:auto;z-index: 121">
        <img id="md_f3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"  style="position:absolute;left:769px;top:486px;width:auto;height:auto;z-index: 121">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-couponCard2.png" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;z-index: 120">    
    </div>
	<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-bg07.jpg" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;">
	<div id="DIV_F" style="position: absolute; left: 61px; top: 54px; z-index: 10; transform: scale(1.05);">
		<img id="IMG_F" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
	</div>

	<div style="position:absolute;left:81px;top:30px;">
		<p style="position:relative; left:0; top:0; text-align:left; font-size:30px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">动画</p>
	</div>
	<div style="position:absolute;left:61px;top:54px;">
		<img id="bt_ad0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-index-dh.jpg" style="position: absolute; left: 20px; top: 20px; width: 170px; height: 238px; z-index: 10; transform: scale(1.05);">
		<img id="bt_af0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:210px;height:278px;">
	</div>
	<div style="position:absolute;left:242px;top:54px;">
		<img id="bt_ad1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-index-dm.jpg" style="position: absolute;left:20px;top:20px;;width:170px;height:238px;z-index:1">
		<img id="bt_af1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:210px;height:278px;">
	</div>
	<div style="position:absolute;left:241px;top:309px;">
		<img id="bt_ad2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-index-cartoon.jpg" style="position: absolute;left:20px;top:20px;width:170px;height:239px;">
		<img id="bt_af2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:210px;height:278px;">
	</div>
	<div style="position:absolute;left:62px;top:308px;">
		<img id="bt_ad3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-index-yz.jpg" style="position: absolute;left:20px;top:20px;width:170px;height:114px;">
		<img id="bt_af3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:210px;height:154px;">
	</div>
	<div style="position:absolute;left:62px;top:432px;">
		<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-index-ls.jpg" style="position: absolute;left:20px;top:20px;width:170px;height:114px;">
		<img id="bt_bf4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:3px;top:10px;width:205px;height:69px;;">
		<div id="div_bf5" style="position:absolute;left:0px;top:50px;display: none;">
			<img id="bt_bf5" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:3px;top:0px;width:205px;height:69px;;">
			<p id="bt_bp5" style="position:absolute; left:25px; top:23px;width:160px;height:23px;line-height:25px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;"></p>
		</div>
		<div id="div_bf6" style="position:absolute;left:0px;top:80px;display: none;">
			<img id="bt_bf6" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:3px;top:2px;width:205px;height:69px;;">
			<p id="bt_bp6" style="position:absolute; left:25px; top:23px;width:160px;height:23px;line-height:25px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#000000; overflow:hidden; margin:0; padding:0;"></p>
		</div>
	</div>
	<div style="position:absolute;left:83px;top:571px;">
		<img id="bt_ad7" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-index-zthd.jpg" style="position: absolute;left:0px;top:19px;width:347px;height:118px;">
		<img id="bt_af7" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:-16px;top:4px;;width:379px;height:144px;">
	</div>
	<div id="partone" style="display: none;">
		<div style="position:absolute;left:458px;top:30px;">
			<p style="position:absolute; left:0px; top:0px;width:160px;height:45px; text-align:left; font-size:30px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">热门专题</p>
		</div>
		<div style="position:absolute;left:438px;top:54px;">
			<img id="bt_lms0" src="" style="position: absolute;left:20px;top:20px;;width:239px;height:203px;">
			<img id="bt_lmf0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:279px;height:243px;">
			<img id="bt_lmm0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-down-bg.png" style="position: absolute;left:20px;top:20px;;width:239px;height:203px;z-index:11">
			<p id="bt_lmp0" class="p1" style="position:absolute; left:22px; top:200px; width:180px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11">拥抱快乐，放飞童心</p>
		</div>
		<div style="position:absolute;left:689px;top:54px;">
			<img id="bt_lms1" src="" style="position: absolute;left:20px;top:20px;;width:239px;height:203px;">
			<img id="bt_lmf1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:279px;height:243px;">
			<img id="bt_lmm1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-down-bg.png" style="position: absolute;left:20px;top:20px;;width:239px;height:203px;z-index:11">
			<p id="bt_lmp1" class="p1" style="position:absolute; left:22px; top:200px; width:180px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11">看动画学纯正英语</p>
		</div>

		<div style="position:absolute;left:941px;top:54px;">
			<img id="bt_lms2" src="" style="position: absolute;left:20px;top:20px;;width:239px;height:203px;">
			<img id="bt_lmf2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:279px;height:243px;">
			<img id="bt_lmm2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-down-bg.png" style="position: absolute;left:20px;top:20px;;width:239px;height:203px;z-index:11">
			<p id="bt_lmp2" class="p1" style="position:absolute; left:22px; top:200px; width:180px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11">英雄如河 磅礴东流</p>
		</div>

		<div style="position:absolute;left:460px;top:285px;">
			<p style="position:relative; left:0px; top:0px; text-align:left; font-size:29px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">热门推荐</p>
		</div>
		<div style="position:absolute;left:1045px;top:290px;">
			<p style="position:absolute; left:0px; top:0px;width:160px;height:25px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第1页/共4页</p>
		</div>
		<div id="div_f0" style="position: absolute; left: 437px; top: 309px; display: block;">
			<img id="bt_s0" src="" style="position: absolute;left:20px;top:20px;width:174px;height:240px;">
			<img id="bt_f0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:214px;height:278px;">
			<img id="bt_b0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:20px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:20px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr0" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p0" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f1" style="position: absolute; left: 628px; top: 309px; display: block;">
			<img id="bt_s1" src="" style="position: absolute;left:20px;top:20px;width:174px;height:240px;">
			<img id="bt_f1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:214px;height:278px;">
			<img id="bt_b1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:20px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:20px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr1" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p1" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f2" style="position: absolute; left: 818px; top: 309px; display: block;">
			<img id="bt_s2" src="" style="position: absolute;left:20px;top:20px;width:174px;height:240px;">
			<img id="bt_f2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:214px;height:278px;">
			<img id="bt_b2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:20px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:20px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr2" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p2" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f3" style="position: absolute; left: 1010px; top: 309px; display: block;">
			<img id="bt_s3" src="" style="position: absolute;left:20px;top:20px;width:174px;height:240px;">
			<img id="bt_f3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:214px;height:278px;">
			<img id="bt_b3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:20px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:20px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr3" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p3" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>

		<div style="position:absolute;left:457px;top:479px;">
			<div id="bt_s04" style=" background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb04" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb04" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div style="position:absolute;left:648px;top:479px;">
			<div id="bt_s05" style=" background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb05" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb05" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div style="position:absolute;left:838px;top:479px;">
			<div id="bt_s06" style=" background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb06" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb06" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div style="position:absolute;left:1030px;top:479px;">
			<div id="bt_s07" style=" background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb07" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb07" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>

	</div>
	<div id="parttwo" style="display: none;">
		<div style="position:absolute;left:458px;top:26px;">
			<p style="position:absolute; left:0px; top:0px;width:160px;height:45px; text-align:left; font-size:30px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">热门推荐</p>
		</div>
		<div style="position:absolute;left:1045px;top:35px;">
			<p style="position:absolute; left:0px; top:0px;width:160px;height:25px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第2页/共4页</p>
		</div>
		<div id="div_f4" style="position: absolute; left: 441px; top: 54px; display: block;">
			<img id="bt_s4" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr4" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p4" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f5" style="position: absolute; left: 629px; top: 54px; display: block;">
			<img id="bt_s5" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f5" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b5" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb5" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr5" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p5" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f6" style="position: absolute; left: 817px; top: 54px; display: block;">
			<img id="bt_s6" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f6" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b6" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb6" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr6" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p6" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f7" style="position: absolute; left: 1005px; top: 54px; display: block;">
			<img id="bt_s7" src="" style="position: absolute;left:20px;top:20px;width:174px;height:240px;">
			<img id="bt_f7" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b7" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:20px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb7" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:20px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr7" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p7" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>


		<div id="div_f8" style="position: absolute; left: 441px; top: 309px; display: block;">
			<img id="bt_s8" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f8" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b8" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb8" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr8" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p8" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f9" style="position: absolute; left: 629px; top: 309px; display: block;">
			<img id="bt_s9" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f9" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b9" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb9" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr9" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p9" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f10" style="position: absolute; left: 817px; top: 309px; display: block;">
			<img id="bt_s10" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f10" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b10" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb10" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr10" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p10" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f11" style="position: absolute; left: 1005px; top: 309px; display: block;">
			<img id="bt_s11" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f11" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b11" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb11" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr11" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p11" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>

		<div style="position:absolute;left:457px;top:479px;">
			<div id="bt_s012" style="background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png'); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb012" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb012" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div style="position:absolute;left:648px;top:479px;">
			<div id="bt_s013" style="background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png'); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb013" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb013" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div style="position:absolute;left:838px;top:479px;">
			<div id="bt_s014" style="background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png'); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb014" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb014" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div style="position:absolute;left:1030px;top:479px;">
			<div id="bt_s015" style="background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png'); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb015" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb015" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
	</div>

	<div id="partthree" style="display: none;">
		<div style="position:absolute;left:458px;top:26px;">
			<p style="position:absolute; left:0px; top:0px;width:160px;height:45px; text-align:left; font-size:30px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">热门推荐</p>
		</div>
		<div style="position:absolute;left:1045px;top:35px;">
			<p style="position:absolute; left:0px; top:0px;width:160px;height:25px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第3页/共4页</p>
		</div>
		<div id="div_f12" style="position: absolute; left: 441px; top: 54px; display: block;">
			<img id="bt_s12" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f12" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b12" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb12" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr12" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p12" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f13" style="position: absolute; left: 629px; top: 54px; display: block;">
			<img id="bt_s13" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f13" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b13" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb13" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr13" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p13" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f14" style="position: absolute; left: 817px; top: 54px; display: block;">
			<img id="bt_s14" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f14" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b14" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb14" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr14" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p14" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f15" style="position: absolute; left: 1005px; top: 54px; display: block;">
			<img id="bt_s15" src="" style="position: absolute;left:20px;top:20px;width:174px;height:240px;">
			<img id="bt_f15" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b15" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:20px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb15" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:20px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr15" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p15" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>


		<div id="div_f16" style="position: absolute; left: 441px; top: 309px; display: block;">
			<img id="bt_s16" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f16" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b16" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb16" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr16" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p16" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f17" style="position: absolute; left: 629px; top: 309px; display: block;">
			<img id="bt_s17" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f17" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b17" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb17" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr17" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p17" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f18" style="position: absolute; left: 817px; top: 309px; display: block;">
			<img id="bt_s18" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f18" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b18" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb18" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr18" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p18" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f19" style="position: absolute; left: 1005px; top: 309px; display: block;">
			<img id="bt_s19" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f19" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b19" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb19" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr19" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p19" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>

		<div style="position:absolute;left:457px;top:479px;">
			<div id="bt_s020" style="background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png'); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb020" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb020" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div style="position:absolute;left:648px;top:479px;">
			<div id="bt_s021" style="background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png'); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb021" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb021" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div style="position:absolute;left:838px;top:479px;">
			<div id="bt_s022" style="background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png'); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb022" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb022" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
		<div style="position:absolute;left:1030px;top:479px;">
			<div id="bt_s023" style="background-image: url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png'); background-repeat: no-repeat; background-size: 100% auto; background-position: 0px 113px; width: 174px; height: 240px; position: absolute; left: 0px; top: 0px;">
			</div>
			<img id="bt_jb023" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:0px;top:113px;;width:61px;height:60px;z-index:11">
			<img id="im_jb023" style="position: absolute;left:120px;top:115px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
		</div>
	</div>

	<div id="partfour" style="display: none;">
		<div style="position:absolute;left:458px;top:26px;">
			<p style="position:absolute; left:0px; top:0px;width:160px;height:45px; text-align:left; font-size:30px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">热门推荐</p>
		</div>
		<div style="position:absolute;left:1045px;top:35px;">
			<p style="position:absolute; left:0px; top:0px;width:160px;height:25px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">当前第4页/共4页</p>
		</div>
		<div id="div_f20" style="position: absolute; left: 441px; top: 54px; display: block;">
			<img id="bt_s20" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f20" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b20" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb20" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr20" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p20" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f21" style="position: absolute; left: 629px; top: 54px; display: block;">
			<img id="bt_s21" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f21" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b21" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb21" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr21" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p21" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f22" style="position: absolute; left: 817px; top: 54px; display: block;">
			<img id="bt_s22" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f22" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b22" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb22" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr22" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p22" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f23" style="position: absolute; left: 1005px; top: 54px; display: block;">
			<img id="bt_s23" src="" style="position: absolute;left:20px;top:20px;width:174px;height:240px;">
			<img id="bt_f23" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b23" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:20px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb23" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:20px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr23" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p23" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>


		<div id="div_f24" style="position: absolute; left: 441px; top: 309px; display: block;">
			<img id="bt_s24" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f24" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b24" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb24" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-mf.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr24" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p24" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f25" style="position: absolute; left: 629px; top: 309px; display: block;">
			<img id="bt_s25" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f25" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b25" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb25" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr25" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p25" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f26" style="position: absolute; left: 817px; top: 309px; display: block;">
			<img id="bt_s26" src="" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f26" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b26" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb26" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-poster-hy.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr26" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p26" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
		<div id="div_f27" style="position:absolute;left:1005px;top:309px;display: none;">
			<img id="bt_s27" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:19px;top:20px;width:174px;height:240px;">
			<img id="bt_f27" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:213px;height:278px;">
			<img id="bt_b27" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/anime-item-bg.png" style="position: absolute;left:19px;top:21px;;width:174px;height:240px;z-index:11">
			<img id="bt_jb27" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:19px;top:20px;;width:61px;height:60px;z-index:11">
			<img id="bt_jbr27" style="position: absolute;left:140px;top:20px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
			<p id="bt_p27" class="p1" style="position:absolute; left:22px; top:235px; width:170px; height:22px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
		</div>
	</div>

	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdg_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>
	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdg_r" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>
	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdg_g" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>
	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdg_a" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>
	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdg_b" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>
	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdg_c" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>
	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdg_d" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>
	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdg_e" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>
	<div style="position:absolute;left:0px;top:0px;">
		<img id="bt_pdg_h" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;">
	</div>
	<img id="bt_prev_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px; width:1px;height:1px">
	<img id="bt_next_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px; width:1px;height:1px">
	<img id="visitRecord" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/record.png" style="position: absolute;left:1px;top:1px" height="0" width="0">
	<div id="test" style="position: absolute;left:20px;top:300px;font-size:30px;color:#FF0000;z-index:99"></div>
	<div id="test2" style="position: absolute;left:20px;top:350px;font-size:30px;color:#FF0000;z-index:99"></div>
	<div id="test3" style="position: absolute;left:20px;top:400px;font-size:30px;color:#FF0000;z-index:99"></div>
</body>

</html>
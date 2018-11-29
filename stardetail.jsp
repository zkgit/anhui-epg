<%@page import="java.net.URLEncoder"%>
<%@page import="com.vstartek.epg.utils.HttpLinkUtils"%>
<%@page import="com.vstartek.epg.pojo.Video"%>
<%@page import="com.vstartek.epg.action.StarAction"%>
<%@page import="com.vstartek.epg.pojo.Star"%>
<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
 	long starId= RequestUtil.getLong("starId", request);
    String programType=RequestUtil.getString("programType", request);
	Star star=StarAction.getStarById(starId, programType);
	if(star==null){
		response.sendRedirect("error404.jsp");
		return;
	}
	int size=star.getList().size();
	List<Video> vlist=star.getList();
	
	long id=RequestUtil.getLong("id", request);
	String cpcode=RequestUtil.getString("cpcode", request);
	String code=RequestUtil.getString("code", request);
	
	String focus_id=RequestUtil.getString("focus_id", request);
	String back=RequestUtil.getString("back", request);
	String programa_id=RequestUtil.getString("programa_id", request);
	String perv_num=RequestUtil.getString("perv_num", request);
	int perv_count=RequestUtil.getInt("perv_count", request);
	String pf_focus_id=RequestUtil.getString("pf_focus_id", request);
	
	String home_focus_id=RequestUtil.getString("home_focus_id", request);
	String home_from=RequestUtil.getString("home_from", request);
	
	String backUrl=RequestUtil.getString("backUrl", request);//接受backUrl
	String backUrl_encode=URLEncoder.encode(backUrl,"UTF-8");
	
	String pervUrl="&back="+back+"&focus_id="+focus_id+"&programa_id="+programa_id+"&perv_num="+perv_num+"&perv_count="+(perv_count+1)+"&pf_focus_id="+pf_focus_id+"&home_focus_id="+home_focus_id+"&home_from="+home_from+"&backUrl="+backUrl_encode;
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
    <meta content="IE=5.0000" http-equiv="X-UA-Compatible">

    <meta name="page-view-size" content="1280*720">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>明星详情<%=size %></title>
    <jsp:include page="/common/top.jsp" >
		<jsp:param name="t" value="<%=System.currentTimeMillis() %>"/>
	</jsp:include>
    <script type="text/javascript">
        var _BS = {};
        var backUrl = '';
        var focus_id = 'bt_f0';
    var KEY_G_0 = 0x0008;var KEY_G_1 = 0x000D;var KEY_G_2 = 0x0021;var KEY_G_3 = 0x0022;var KEY_G_4 = 0x0025;var KEY_G_5 = 0x0026;var KEY_G_6 = 0x0027;var KEY_G_7 = 0x0028;var KEY_M_0 = 0x0103;var KEY_M_1 = 0x0104;var KEY_M_2 = 0x0105;var KEY_M_3 = 0x0106;var KEY_M_4 = 0x0107;var KEY_M_5 = 0x0108;var KEY_M_6 = 0x0109;var KEY_M_7 = 0x0300;var KEY_N_0 = 0x0030;var KEY_N_1 = 0x0031;var KEY_N_2 = 0x0032;var KEY_N_3 = 0x0033;var KEY_N_4 = 0x0034;var KEY_N_5 = 0x0035;var KEY_N_6 = 0x0036;var KEY_N_7 = 0x0037;var KEY_N_8 = 0x0038;var KEY_N_9 = 0x0039;var KEY_O_0 = 0x0072;var KEY_O_1 = 0x01A6;var KEY_O_2 = 0x0206;
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
    } //back
    else if (KV == KEY_G_1) {
    if ('F_KEY_G_1' in window) {
    F_KEY_G_1();
    }
    } //确定
    else if (KV == KEY_G_2) {
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


    function init() {
    for (var i = 0; i < buttons.length; ++i) {
    var _b = buttons[i];
    this._BS[_b.id] = _b;
    }
    if (_BS[focus_id] != undefined && _SELECT(focus_id) != undefined) {
    if (_BS[focus_id]['focusImage'] != 'Pixel.png') {
    var gb = _SELECT(focus_id);
    _SELECT("DIV_F").style.left = gb.getBoundingClientRect().left + 'px';
    _SELECT("DIV_F").style.top = gb.getBoundingClientRect().top + 'px';
    _SELECT("IMG_F").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
    }
    DOBUTTONFOCUSFUN(focus_id);
    }
    }

    function _FD(_t, _s, y) { //推荐列表标志图动画
    var _f = _SELECT(_t);
    if (_s && _f) {
    _f.style.zIndex = 10;
    _f.style.transform = "scale(" + _s + "," + y + ")";
    _f.style.webkitTransform = "scale(" + _s + "," + y + ")";
    }
    }

    function _TF(_t, _s) { //推荐列表图动画
    var _f = _SELECT(_t);
    if (_s && _f) {
    _f.style.zIndex = 10;
    _f.style.transform = "scale(" + _s + ")";
    _f.style.webkitTransform = "scale(" + _s + ")";
    }
    }

    function F_KEY_G_4() { //left
    if (_BS[focus_id] != undefined && _BS[focus_id]['leftButtonId'] != '') {
    _H_F(_BS[focus_id]['leftButtonId']);
    }
    return;
    }

    function F_KEY_G_5() { //up
    if (_BS[focus_id] != undefined && _BS[focus_id]['upButtonId'] != '') {
    _H_F(_BS[focus_id]['upButtonId']);
    }
    return;
    }

    function F_KEY_G_6() { //right
    if (_BS[focus_id] != undefined && _BS[focus_id]['rightButtonId'] != '') {
    _H_F(_BS[focus_id]['rightButtonId'])
    }
    return;
    }

    function F_KEY_G_7() { //down
    if (_BS[focus_id] != undefined && _BS[focus_id]['downButtonId'] != '') {
    _H_F(_BS[focus_id]['downButtonId'])
    }
    return;
    }

    function DOBUTTONBLURFUN(_id) { //blurfun
    if (_BS[_id] != undefined && _BS[_id]['blurFun'] != undefined && _BS[_id]['blurFun'] != '') {
    var _b = _BS[_id];
    var fun = _b['blurFun'];
    eval("(" + fun + ")")();
    }
    }

    function DOBUTTONFOCUSFUN(_id) { //focusfun
    if (_BS[_id] != undefined && _BS[_id]['focusFun'] != undefined && _BS[_id]['focusFun'] != '') {
    var fun = _BS[_id]['focusFun'];
    eval("(" + fun + ")")();
    }
    }

    function DOBUTTONENTERFUN(_id) { //enterfun
    if (_BS[_id] != undefined && _BS[_id]['enterFun'] != undefined && _BS[_id]['enterFun'] != '') {
    var fun = _BS[_id]['enterFun'];
    eval("(" + fun + ")")();
    }
    }
    
    function getUrl() {

    }

    function getPrevUrl(){
   
    }

    function F_KEY_G_0(){ //back
    window.frames["smallWidow"].updateWatchRecord();
    if ('Q' == go_order_div){//全文
    QW_BACK();
    } else if ('XX' == go_order_div){//星星评分
    F_E_CANEL_F();
    }else if ('dx' == 'dx'){ //电信推荐位进来按返回，弹出挽留
    	window.history.go(-1)
   
    }
    }

    function F_KEY_G_1() { //确定键 enter
    DOBUTTONENTERFUN(focus_id);
    }

    function F_KEY_N_0() {
    if ('Q' == go_order_div) {
    QW_BACK();
    } else if ('XX' == go_order_div) {
    F_E_CANEL_F();
    } else if ('ty' == '') {
    window.location.href = '';
    } else if ('dx' == 'dx') { //电信推荐位进来按返回，弹出挽留
    if ('' != "" && '' != "null") {
    var url = decodeURIComponent(decodeURIComponent(''));
    window.location.href = url;
    } else {
    getUrl();
    window.location.href = backUrl;
    }
    } else {
    getUrl();
    window.location.href = backUrl;
    }
    }




    /***************相关推荐***************/
    //推荐节目文字滚动
    var item_name = '';

    function F_E_IFOCUS() { //推荐列表focusfun
    item_name = _SELECT(focus_id.replace('f', 'p')).innerHTML;
    hd_index = focus_id;
    if (item_name.length > 12) {
    _SELECT(focus_id.replace('f', 'p')).innerHTML = '<marquee direction="left">' + item_name + "</marquee>";
    }
    }

    function F_E_IVBLUR() { //推荐列表blur
    _SELECT(focus_id.replace('f', 'p')).innerHTML = '' + item_name + "";
    }

    function F_TOLEFTPAGE() { //bt_f6向左跳到bt_f5  //bt_f12向左跳到bt_f11
    var i = parseInt(focus_id.replace('toleftpage', '')); //6 12
    var b = 0;
    for (var j = i - 6; j <= i; j++) {
    _SELECT('div_f' + j).style.left = 44 + b * 198;
    _SELECT("div_f" + j).style.display = ""; //显示前边6个
    if (_SELECT('div_f' + (i + b))) {
    _SELECT("div_f" + (i + b)).style.display = "none"; //隐藏后边6个
    }
    b++
    }
    _H_F("bt_f" + (i - 1));
    }

    function F_TOLEFTPAGEEND() { //bt_f0向左bt_f17 focusfun
    var i = parseInt(focus_id.replace('toleftpageend', '')); //17 9
    var c = i % 6; //5 3
    for (var v = 0; v <= 5; v++) {
    //隐藏0-5
    _SELECT("div_f" + v).style.display = "none"; //隐藏
    }
    for (var j = 0; j <= c; j++) {
    //显示12-17
    _SELECT('div_f' + (i - j)).style.left = 44 + (c - j) * 198;
    _SELECT("div_f" + (i - j)).style.display = ""; //显示

    }
    _H_F("bt_f" + i);
    }

    function F_TORIGHTPAGE() { //bt_05向右边点击跳到bt_06/  11向12跳 focusfun
    var i = parseInt(focus_id.replace('torightpage', '')); //5,11
    if (i >= 5) {
    var b = 0;
    for (var j = i - 5; j <= i; j++) {
    _SELECT("div_f" + j).style.display = "none"; //隐藏前边的6个
    if (_SELECT('div_f' + (i + b + 1))) {
    _SELECT("div_f" + (i + b + 1)).style.display = ""; //显示后边的6个
    _SELECT('div_f' + (i + b + 1)).style.left = 44 + b * 198;
    }
    b++;
    }

    }
    _H_F("bt_f" + (i + 1));
    }

    function F_TORIGHTPAGEEND() { //bt_17像右边点击跳到bt_f0 focusfun
    var i = parseInt(focus_id.replace('torightpageend', '')); //17 9
    var c = i % 6; //5 3
    for (var j = 0; j <= c; j++) {
    //隐藏12-17
    _SELECT("div_f" + (i - j)).style.display = "none"; //隐藏
    }
    for (var v = 0; v <= 5; v++) {
    //显示0-5
    _SELECT('div_f' + v).style.left = 44 + v * 198;
    _SELECT("div_f" + v).style.display = ""; //显示
    }
    _H_F("bt_f0");
    }

    function _H_F(_id) { //旧的焦点去除选中样式，新的焦点添加选中样式
    if (_BS[focus_id] != undefined && _BS[_id] != undefined && _SELECT(focus_id) != undefined && _SELECT(_id) != undefined) {
    if (_id.indexOf('bt_f') >= 0) { //推荐的列表
    var _p_div = _id.replace('bt', 'div');
    if (_SELECT(_p_div).style.display == 'none') {
    return;
    }
    } else if (_id.indexOf('bt_js') >= 0) { //不清楚
    var _p_div = _id.replace('js', 'div');
    if (_SELECT(_p_div).style.visibility == 'hidden') {
    return;
    }
    }

    _SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['blurImage'];
    next_id = _id;
    DOBUTTONBLURFUN(focus_id);

    if (focus_id.indexOf('bt_f') >= 0) {
    var show_id = focus_id.replace('f', 's'); //推荐的列表图
    //                var black_id = focus_id.replace('f', 'bg');//不清楚
    var jb_id = focus_id.replace('f', 'jb'); //免费或者会员标志
    _TF(show_id, 1.0);
    //                _TF(black_id,1.0);
    _FD(jb_id, 1.0, 1.0);
    }
    _TF('DIV_F', 1.0);

    focus_id = _id;
    var _F_I_SR = _SELECT("IMG_F").src;
    _F_I_SR = _F_I_SR.substring(_F_I_SR.indexOf('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'));
    var _F_I_SR2 = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
    if (_F_I_SR != _F_I_SR2) {
    _SELECT("IMG_F").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png';
    }
    //给focusImage的宽高设置为当前焦点位置div的大小
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
    }
    if (focus_id.indexOf('bt_f') >= 0) {
    _TF('DIV_F', 1.1);
    var show_id = focus_id.replace('f', 's');
    //               
    var jb_id = focus_id.replace('f', 'jb');
    //                  
    _TF(show_id, 1.1);
    //                   
    _FD(jb_id, 1.3, 1.4);
    //                  
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
    <%
    String buttons="";
	for(int i=0;i<size;i++){
		buttons+="{id: 'bt_f"+i+"',upButtonId: '',downButtonId: '',";
		if(i==0 &&size==1){
			buttons+="leftButtonId: '',rightButtonId: '',";
		}
		if(i==0 &&size>1){
			buttons+="leftButtonId: 'toleftpageend"+(size-1)+"',";
		}else if(i>0&&(i%6==0)){
			buttons+="leftButtonId: 'toleftpage"+i+"',";
		}else if(i>0){
			buttons+="leftButtonId: 'bt_f"+(i-1)+"',";
		}

		if((i+1<size)&&((i+1)%6==0)){
			buttons+="rightButtonId: 'torightpage"+i+"',";
		}else if((i+1<size)&&((i+1)%6!=0)){
			buttons+="rightButtonId: 'bt_f"+(i+1)+"',";
		}else if(i+1==size){
			buttons+="rightButtonId: 'torightpageend"+i +"',";
		}
		
		buttons+="blurFun: 'F_E_IVBLUR',";
		buttons+="focusFun: 'F_E_IFOCUS',";
		buttons+="enterFun: 'F_TODETAIL"+i +"',";
		buttons+="focusImage: 'detail-iti-f.png',";
		buttons+="blurImage: 'Pixel.png'},";
		
		if(i==0 &&size>1){ 
			buttons+="{id: 'toleftpageend"+(size-1)+"',upButtonId: '',downButtonId: '',leftButtonId: 'bt_f"+(size-1)+"',rightButtonId: '',blurFun: '',focusFun: 'F_TOLEFTPAGEEND',enterFun: '',focusImage: 'Pixel.png',blurImage: 'Pixel.png'},";
		}else if((i+1<size)&&((i+1)%6==0)){
			buttons+="{id: 'torightpage"+i+"',upButtonId: '',downButtonId: '',leftButtonId: '',rightButtonId: 'bt_f"+(i+1)+"',blurFun: '',focusFun: 'F_TORIGHTPAGE',enterFun: '',focusImage: 'Pixel.png',blurImage: 'Pixel.png'},";
		}else if(i>0&&(i%6==0)){
			buttons+="{id: 'toleftpage"+i+"',upButtonId: '',downButtonId: '',leftButtonId: 'bt_f"+(i-1)+"',rightButtonId: '',blurFun: '',focusFun: 'F_TOLEFTPAGE',enterFun: '',focusImage: 'Pixel.png',blurImage: 'Pixel.png'},";
		}

		if(i+1==size){
			buttons+="{id: 'torightpageend"+i+"',upButtonId: '',downButtonId: '',leftButtonId: '',rightButtonId: 'bt_f0',blurFun: '',focusFun: 'F_TORIGHTPAGEEND',enterFun: '',focusImage: 'Pixel.png',blurImage: 'Pixel.png'}";
		}
	}
	%>
    var buttons=[
        <%=buttons%>  
	];

    <%
        String fun="";
		for(int i=0;i<size;i++) {
			 Video video=vlist.get(i);
			 String videotype2="";
			 if("arts".equals(video.getVideoType())){
				 videotype2="_arts";
			 }else if(!"film".equals(video.getVideoType())){
				 videotype2="_tv";
			 }
	         fun+="function F_TODETAIL"+i+"(){USER_UPDATA_LOG("+video.getId()+",\"EPG_STAR\","+i+",\""+starId+"\");window.location.href=\"detail"+(videotype2)+".jsp?id="+video.getId()+"&star=1&programType="+video.getVideoType()+"&code="+video.getCode()+"&cpcode="+video.getCpcode()+pervUrl+"\";}";
	  	}
    %>
   <%=fun%>
        var buttons2 = [{
                id: 'bt_f0',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'toleftpageend9',
                rightButtonId: 'bt_f1',
                blurFun: 'F_E_IVBLUR',
                focusFun: 'F_E_IFOCUS',
                enterFun: 'F_TODETAIL0',
                focusImage: 'detail-iti-f.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'toleftpageend9',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f9',
                rightButtonId: '',
                blurFun: '',
                focusFun: 'F_TOLEFTPAGEEND',
                enterFun: '',
                focusImage: 'Pixel.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'bt_f1',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f0',
                rightButtonId: 'bt_f2',
                blurFun: 'F_E_IVBLUR',
                focusFun: 'F_E_IFOCUS',
                enterFun: 'F_TODETAIL1',
                focusImage: 'detail-iti-f.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'bt_f2',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f1',
                rightButtonId: 'bt_f3',
                blurFun: 'F_E_IVBLUR',
                focusFun: 'F_E_IFOCUS',
                enterFun: 'F_TODETAIL2',
                focusImage: 'detail-iti-f.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'bt_f3',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f2',
                rightButtonId: 'bt_f4',
                blurFun: 'F_E_IVBLUR',
                focusFun: 'F_E_IFOCUS',
                enterFun: 'F_TODETAIL3',
                focusImage: 'detail-iti-f.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'bt_f4',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f3',
                rightButtonId: 'bt_f5',
                blurFun: 'F_E_IVBLUR',
                focusFun: 'F_E_IFOCUS',
                enterFun: 'F_TODETAIL4',
                focusImage: 'detail-iti-f.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'bt_f5',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f4',
                rightButtonId: 'torightpage5',
                blurFun: 'F_E_IVBLUR',
                focusFun: 'F_E_IFOCUS',
                enterFun: 'F_TODETAIL5',
                focusImage: 'detail-iti-f.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'torightpage5',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: '',
                rightButtonId: 'bt_f6',
                blurFun: '',
                focusFun: 'F_TORIGHTPAGE',
                enterFun: '',
                focusImage: 'Pixel.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'bt_f6',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'toleftpage6',
                rightButtonId: 'bt_f7',
                blurFun: 'F_E_IVBLUR',
                focusFun: 'F_E_IFOCUS',
                enterFun: 'F_TODETAIL6',
                focusImage: 'detail-iti-f.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'toleftpage6',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f5',
                rightButtonId: '',
                blurFun: '',
                focusFun: 'F_TOLEFTPAGE',
                enterFun: '',
                focusImage: 'Pixel.png',
                blurImage: 'Pixel.png'
            },

            {
                id: 'bt_f7',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f6',
                rightButtonId: 'bt_f8',
                blurFun: 'F_E_IVBLUR',
                focusFun: 'F_E_IFOCUS',
                enterFun: 'F_TODETAIL7',
                focusImage: 'detail-iti-f.png',
                blurImage: 'Pixel.png'
            },
            {
                id: 'bt_f8',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f7',
                rightButtonId: 'bt_f9',
                blurFun: 'F_E_IVBLUR',
                focusFun: 'F_E_IFOCUS',
                enterFun: 'F_TODETAIL8',
                focusImage: 'detail-iti-f.png',
                blurImage: 'Pixel.png'
            },

            {
                id: 'bt_f9',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: 'bt_f8',
                rightButtonId: 'torightpageend9',
                blurFun: 'F_E_IVBLUR',
                focusFun: 'F_E_IFOCUS',
                enterFun: 'F_TODETAIL9',
                focusImage: 'detail-iti-f.png',
                blurImage: 'Pixel.png'
            },

            {
                id: 'torightpageend9',
                upButtonId: '',
                downButtonId: '',
                leftButtonId: '',
                rightButtonId: 'bt_f0',
                blurFun: '',
                focusFun: 'F_TORIGHTPAGEEND',
                enterFun: '',
                focusImage: 'Pixel.png',
                blurImage: 'Pixel.png'
            },
            {
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
            },
        ]
        var go_order_div = "N";


        function GOORDER() {
            var _item_name = '';
            _item_name = encodeURIComponent(encodeURIComponent(_item_name));
            GO_ORDERJSP('', '', _item_name);
        }
        var order_setime;

        function initdatas() {
            init();
        }
        var tj_item_id = new Array();
    /***************相关推荐***************/
        function getTJList(){ //相关推荐
            $.get(webset.apiStatic + 'starWorks/<%=starId%50%>/<%=starId%>.json', function (result) {
                var json = eval("(" + result + ")");
                $.each(json.list, function (i, item) {
                    _SELECT("bt_s" + i).src = item.imagetv;
                    _SELECT("bt_p" + i).innerHTML = item.title;
                    if (item.bcharging == "1") {
                        _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                    } else {
                        _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                    }
                    tj_item_id.push(item.id);
                    seriesCp_name.push(item.title);
                });
            }, false);
        }

        function F_TODETAIL(){ //推荐列表enter
          
        }

        var seriesCp_name = new Array();

        initdatas()
    </script>

    <meta name="GENERATOR" content="MSHTML 11.00.10570.1001">
</head>

<body  onload="initdatas()">
    <img style="left: 0px; top: 0px; width: 1280px; height: 720px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/stardetail-bg.jpg">
    <div id="DIV_F" style="left: 52px; top: 436px; position: absolute; z-index: 11;"><img id="IMG_F" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-iti-f.png"> </div>
    <!-- 姓名 -->
    <div style="left: 406px; top: 46px; position: absolute;">
        <div style="left: 0px; top: 0px; width: 438px; height: 30px; position: absolute;">
            <h2 style="margin: 0px; padding: 0px; left: 0px; top: 0px; width: 430px; text-align: left; color: rgb(255, 255, 255); overflow: hidden; font-family: 微软雅黑; font-size: 35.05px; font-weight: normal; position: absolute;"><%=star.getName() %></h2>
        </div>
    </div>
    <!-- 生日 地区 -->

    <div style="left: 0px; top: 0px; position: absolute;">
        <h2 style="margin: 0px; padding: 0px; left: 406px; top: 110px; width: 260px; text-align: left; color: rgb(255, 255, 255); overflow: hidden; font-family: 微软雅黑; font-size: 25px; font-weight: normal; position: absolute;">生日: <%=star.getDate() %>
        </h2>
        <h2 style="margin: 0px; padding: 0px; left: 750px; top: 110px; width: 260px; text-align: left; color: rgb(255, 255, 255); overflow: hidden; font-family: 微软雅黑; font-size: 25px; font-weight: normal; position: absolute;">地区: <%=star.getStarArea() %>
        </h2>
    </div>

    <!-- 演员简介 -->
    <div style="left: 388px; top: 160px; width: 830px; height: 180px; position: absolute;overflow:hidden;">
        <p style="margin: 0px; padding: 0px; left: 0px; top: 0px; text-align: left; color: rgb(255, 255, 255); line-height: 30px; overflow: hidden; font-family: 微软雅黑; font-size: 18px; font-weight: normal; position: absolute;">
			<%=star.getIntroduction() %>
           
        </p>
    </div>
    <!-- 小视频  海报-->
    <div style="left: 71px; top: 58px; position: absolute;">
        <img style="left: 0px; top: 0px; width: 300px; height: 300px; position: absolute;" src="<%=star.getImage()%>"> </div>
    <div id="scrollid" style="top: 425px; width: 1250px; height: 295px; overflow: hidden; position: absolute; z-index: 9;">
		<%
		for(int i=0;i<size;i++) {
			 Video video=vlist.get(i);
			 if(i==0 && size>1){
		%>
        <img id="toleftpageend<%=size-1 %>" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        <%} %>
        <div id="div_f<%=i %>" style="left: <%=(44+i*198)%>px; display: block; position: absolute;">
            <img id="bt_s<%=i %>" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="<%=video.getImagetv() %>">
            <img id="bt_jb<%=i %>" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-<%="1".equals(video.getBcharging())?"hy":"mf" %>.png">
            <img id="bt_f<%=i %>" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p class="p0" id="bt_p<%=i %>" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 25px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"><%=video.getTitle() %></p>
        </div>
        <% 
        if((i>0)&&(i%6==0)){
       
        %>
       <img id="toleftpage<%=i %>" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        <% }
        if((i+1<size)&&((i+1)%6==0)){
        %>
        <img id="torightpage<%=i %>" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        <% 
        }
        if(i+1==size){
        %>
        <img id="torightpageend<%=size-1 %>" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        <%}
		} %>
        
         
       
    }
        
    </div>
    <!-- 返回按钮 -->
    <div style="left: 0px; top: 0px; position: absolute;">
        <img id="bt_pdg" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> </div>
    <img id="collect" style="left: 680px; top: 260px; position: absolute; z-index: 99;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    
    <div id="test" style="left: 20px; top: 400px; color: rgb(255, 0, 0); font-size: 30px; position: absolute;">
    	<img id="stat" style="left: 1px; top: 1px; position: absolute;" src=""> 
    </div>
    <script type="text/javascript">
    
	    <%
			String _stat="影视聚合-"+HttpLinkUtils.getProgramType_ZH(programType)+"-明星-"+star.getName();
		%>
		function _STAT(_stat) { //用户点击行为上报
		    _stat = encodeURI(encodeURI(_stat));
		    var _url = 'http://sta.jisu8.cn/stat?category=' + _stat +'&contid=&style=&label=&id=6955&action=click&account='+userId+'&plat=&vlauncher=&vterminal=';
		    _SELECT('stat').src = _url;
		}

        setTimeout("window.focus()", 5000);
        
        setTimeout("_STAT('<%=_stat%>')", 2000);
    </script>

</body>

</html>
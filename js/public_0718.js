function MM_swapImage() {
    var i, j = 0,
        x, a = MM_swapImage.arguments;
    document.MM_sr = new Array;
    for (i = 0; i < (a.length - 2); i += 3)
        if ((x = MM_findObj(a[i])) != null) {
            document.MM_sr[j++] = x;
            if (!x.oSrc) x.oSrc = x.src;
            x.src = a[i + 2];
        }
}

function MM_swapImgRestore() {
    var i, x, a = document.MM_sr;
    for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
}

function MM_findObj(n, d) {
    var p, i, x;
    if (!d) d = document;
    if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
        d = parent.frames[n.substring(p + 1)].document;
        n = n.substring(0, p);
    }
    if (!(x = d[n]) && d.all) x = d.all[n];
    for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
    for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
    if (!x && d.getElementById) x = d.getElementById(n);
    return x;
}

function MM_preloadImages() {
    var d = document;
    if (d.images) {
        if (!d.MM_p) d.MM_p = new Array();
        var i, j = d.MM_p.length,
            a = MM_preloadImages.arguments;
        for (i = 0; i < a.length; i++)
            if (a[i].indexOf("#") != 0) {
                d.MM_p[j] = new Image;
                d.MM_p[j++].src = a[i];
            }
    }
}

try {
    iPanel.defaultFocusColor = '#FFFF6F';
    iPanel.focusWidth = "0";
} catch (ex) {}

//公共userid和stb
function getItvAccount(){
    if(typeof(Authentication) != "undefined"){
        if(Authentication.CTCGetConfig("STBType").substr(0,2) == "E8"||Authentication.CTCGetConfig("STBType").substr(0,2) == "E9"){
            /*创维的盒子都是E开头的，创维的盒子用username来获取用户id*/
            return Authentication.CTCGetConfig("username");
        }else{
            return Authentication.CTCGetConfig("UserID");
        }
    }
}
var userId = "engine";
var stbModel = "";
try {
    // userId = getItvAccount();
    stbModel = Authentication.CTCGetConfig("STBType");
} catch (ex) {}

function _SELECT(id) {
    if (id == '' || id == null) {
        return false;
    } else {
        return document.getElementById(id);
    }
}

function blockDiv(b) {
    if (_SELECT(b)) {
        _SELECT(b).style.display = "block";
    }
}

function noneDiv(n) {
    if (_SELECT(n)) {
        _SELECT(n).style.display = "none";
    }
}

function hiddenDiv(h) {
    if (_SELECT(h)) {
        _SELECT(h).style.visibility = "hidden";
    }
}

function visibleDiv(v) {
    if (_SELECT(v)) {
        _SELECT(v).style.visibility = "visible";
    }
}

function nbDiv(n, b) {
    if (_SELECT(n)) {
        _SELECT(n).style.display = "none";
    }
    if (_SELECT(b)) {
        _SELECT(b).style.display = "block";
    }
}

function hvDiv(h, v) {
    if (_SELECT(h)) {
        _SELECT(h).style.visibility = "hidden";
    }
    if (_SELECT(v)) {
        _SELECT(v).style.visibility = "visible";
    }
}
// 截取后两位
function _interceptTwo(str) {
    return str.substring(str.length - 2, str.length);
}

//写cookies
function setCookie(name, value) {
    var Days = 3;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + encodeURI(value) + ";expires=" + exp.toGMTString() + ";path=/";
};
//读取cookies
function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

    if (arr = document.cookie.match(reg))
        //return unescape(arr[2]);
        return decodeURI(arr[2]);
    else
        return null;
}
//删除cookies
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) document.cookie = name + "=" + cval + ";path=/;expires=" + exp.toGMTString();
}


function GetRequest(url) {
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}

function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg); //匹配目标参数
    if (r != null) return unescape(r[2]);
    return null; //返回参数值
}

function json_type(e) {
    return typeof (e) == 'object' ? e : e = eval("(" + e + ")");
}
//关闭接口配置
var CACHE_API_CONFIG ={
    open:false
}

function commen_play(id, programType, programType2, code, cpcode, pervUrl,ordered,dramaSum,iscut,cutdrama,paixu){
    var url=window.location.href;
    var dramasum=dramaSum||0;
    var cuturl = '',title, videoid, cuttime=0, _playjson,volumnCount=programType == 'film' ? 1 :'';
    var commennext=function () {
        _playjson = GET_SERIES_BY_SERIES_CODE(code, cpcode, volumnCount, userId);//获取getSeriesBySeriesCode接口数据
        _playjson=_playjson?_playjson:{};
        if(!_playjson.url){
            //如果影片已经下线，则跳转到 错误页面;
            window.location.href = "error404.jsp?programType="+programType+"&seriesStatus=1";
            return;
        }
        title = _playjson.dramaTitle;
        videoid = programType == 'film' ? _playjson.code : _playjson.movieCode;
        if (!cuttime){
            cuttime = _playjson.cutTime ? parseInt(_playjson.cutTime): 0;
        }
        if (programType != 'film'){
            volumnCount = _playjson.volumncount
        }
        cuturl = _playjson.url;
        volumnCount ? volumnCount : volumnCount = _playjson.volumncount;
        //判断是否使用播放器刷新页面；
        var WebBackUrl="";
        if("anime"==programType){
       	 	WebBackUrl="";
        }else{
        	if(UN_INTERVAL()){
        		WebBackUrl="";
        	}else{
        		WebBackUrl=",{'name':'WebBackUrl', 'value':'"+window.location.href+"'}";
        	}
        }
        var isInstall = false;
        try{isInstall=STBAppManager.isAppInstalled("com.anhui.tv")}catch(ex){}
        if(isInstall){
            if (_playjson.seriesBcharging == '0') { //免费
                STBAppManager.startAppByIntent("{'intentType':0,'appName':'com.anhui.tv', 'className':'com.anhui.tv.activity.AnHuiPlayDemandActivity','extra':[{'name':'PlayUrl', 'value':'" + cuturl + "'},{'name':'seriesCp_id', 'value':'" + code + "'},{'name':'Episodes', 'value':'" + volumnCount + "'},{'name':'WebReturnUrl', 'value':'" + encodeURIComponent('http://tv.itvengine.com.lv1.vcache.cn/itv-epg/webReturnUrl.jsp') + "'},{'name':'StartTime', 'value':'" + parseInt(cuttime) + "'},{'name':'VideoType', 'value':'" + programType2 + "'},{'name':'Type', 'value':'0'},{'name':'Title', 'value':'" + title + "'},{'name':'Vid', 'value':'" + _playjson.movieCode + "'},{'name':'AttemptUrl', 'value':''},{'name':'License', 'value':'ahdx'},{'name':'Cp', 'value':'" + cpcode + "'},{'name':'Bwatermark', 'value':'1'}"+WebBackUrl+"]}");
            }else if(_playjson.seriesBcharging == '1'){//收费
                var _hasorder_data = HAS_ORDER(userId, id, programType, title);
                switch (_hasorder_data.ordered){ // 鉴权成功
                    case 1:
                        var _param = _hasorder_data.param,
                            _battempt = programType == 'film' ? '0' : _playjson.bcharging; // 区分电影鉴权成功默认免费

                        STBAppManager.startAppByIntent("{'intentType':0,'appName':'com.anhui.tv', 'className':'com.anhui.tv.activity.AnHuiPlayDemandActivity','extra':[{'name':'PlayUrl', 'value':'" + cuturl + "'},{'name':'seriesCp_id', 'value':'" + code + "'},{'name':'Episodes', 'value':'" + volumnCount + "'},{'name':'WebReturnUrl', 'value':'" + encodeURIComponent('http://tv.itvengine.com.lv1.vcache.cn/itv-epg/webReturnUrl.jsp') + "'},{'name':'StartTime', 'value':'" + parseInt(cuttime) + "'},{'name':'VideoType', 'value':'" + programType2 + "'},{'name':'Type', 'value':'0'},{'name':'Title', 'value':'" + title + "'},{'name':'Vid', 'value':'" + _playjson.movieCode + "'},{'name':'AttemptUrl', 'value':'" + _param + "'},{'name':'License', 'value':'ahdx'},{'name':'Cp', 'value':'" + cpcode + "'},{'name':'Battempt', 'value':'" + _battempt + "'},{'name':'Bwatermark', 'value':'1'}"+WebBackUrl+"]}");
                        break;
                    default: // 鉴权失败
                        var CO_DATA = CREATE_ORDER(userId, id, programType, title, cpcode), // 获取生成的订单信息
                            _attempt_url = 'providerId=' + CO_DATA.providerId + '|orderInfo=' + CO_DATA.orderInfo2 + '|deviceType=' + CO_DATA.deviceType + '|notifyUrl=' + CO_DATA.notifyUrl + '|orderInfo2=' + CO_DATA.orderInfo,
                            _battempt = _playjson.bcharging;

                        STBAppManager.startAppByIntent("{'intentType':0,'appName':'com.anhui.tv', 'className':'com.anhui.tv.activity.AnHuiPlayDemandActivity','extra':[{'name':'PlayUrl', 'value':'" + cuturl + "'},{'name':'seriesCp_id', 'value':'" + code + "'},{'name':'Episodes', 'value':'" + volumnCount + "'},{'name':'WebReturnUrl', 'value':'" + encodeURIComponent('http://tv.itvengine.com.lv1.vcache.cn/itv-epg/webReturnUrl.jsp') + "'},{'name':'StartTime', 'value':'" + parseInt(cuttime) + "'},{'name':'VideoType', 'value':'" + programType2 + "'},{'name':'Type', 'value':'0'},{'name':'Title', 'value':'" + title + "'},{'name':'Vid', 'value':'" + _playjson.movieCode + "'},{'name':'AttemptUrl', 'value':'" + _attempt_url + "'},{'name':'License', 'value':'ahdx'},{'name':'Cp', 'value':'" + cpcode + "'},{'name':'Battempt', 'value':'" + _battempt + "'},{'name':'Bwatermark', 'value':'1'}"+WebBackUrl+"]}");
                }
            }
        }else { //跳转到 window_tv页面播放

            if(programType == 'anime'|| !dramasum||!ordered){
                var _hasorder_data = HAS_ORDER(userId, id, programType, title);
                ordered=_hasorder_data.ordered;
            }
            if (programType == 'film') {
                window.location.href = "window.jsp?id=" + id + "&programType=" + programType + "&code=" + code + "&cpcode=" + cpcode + pervUrl + "&title=" + encodeURIComponent(title) + "&cutTime=" + cuttime + "&playurl=" + encodeURIComponent(cuturl) + "&videoid=" + videoid+'&seriesBcharging='+_playjson.seriesBcharging+'&ordered='+ordered+'&returnUrl='+encodeURIComponent(url);
            } else {
                window.location.href = "window.jsp?id=" + id + "&programType=" + programType + "&code=" + code + "&cpcode=" + cpcode + pervUrl + "&title=" + encodeURIComponent(title) + "&cutTime=" +(cuttime?cuttime:'') + "&playurl=" + encodeURIComponent(cuturl) + "&videoid=" + videoid + "&dramasum="+dramasum+"&cutdrama=" + volumnCount+'&seriesBcharging='+_playjson.seriesBcharging+'&ordered='+ordered+'&iscut='+iscut+'&returnUrl='+encodeURIComponent(url)+'&paixu='+(paixu?paixu:'');
            }
        }
    }
    if(!iscut){
       // CACHE_PLAY_TIME(userId,code,'commencallback',Math.random())//获取断点cachePlayTime接口数据
        // function F_CALLBACK(e){
               
        // }
        // CACHE_PLAY_TIME(userId,code,F_CALLBACK)
        if(CACHE_API_CONFIG.open){
            JSONP({
                url: 'http://es.itvengine.com.lv1.vcache.cn/itv-epg-api/api/v1/usr/cachePlayTime.json',
                params: {
                    'userId': userId,
                    'seriesCode': code,
                },
                success: function (e) {       
                    if (e.userId) {
                        cuttime = e.cuttime?parseInt(e.cuttime):0;
                        volumnCount=parseInt(e.dramacount)
                    }
                    commennext()
                }
            });
        }else{
            e ={}
            if (e.userId) {
                cuttime = e.cuttime?parseInt(e.cuttime):0;
                volumnCount=parseInt(e.dramacount)
            }
            commennext()
        }
        
           
    }else{
        volumnCount=cutdrama;
        commennext()
    }
}

// 非同一播放器鉴权
function TRY_WATCH(userId, id, programType, title, cpcode, pervUrl) {

    var CO_DATA = CREATE_ORDER(userId, id, programType, title, cpcode); // 获取生成的订单信息

    if (CO_DATA) {
        window.location.href = 'http://61.191.45.118:7002/itv-api/initial_order?returnUrl=' +
            encodeURIComponent(pervUrl) + '&providerId=' + CO_DATA.providerId +
            '&orderInfo=' + CO_DATA.orderInfo + '&notifyUrl=' + CO_DATA.notifyUrl;
    }
}



function CACHE_PLAY_TIME(userId, code,cbname) {
    var PLAYTIME_URL="http://es.itvengine.com.lv1.vcache.cn/itv-epg-api/api/v1/usr/cachePlayTime.json";
    if(CACHE_API_CONFIG.open){
        JSONP({
            url: PLAYTIME_URL,
            params: {
                'userId': userId,
                'seriesCode': code,
            }, //参数，可选
            //cb:cbname,//回调函数键，可选
            success: function (data) {
                eval("("+cbname+")")(data);
            }
        })
    }else{
        var data ={}
        eval("("+cbname+")")(data);
    }
    
}


//获取影片信息 
function GET_SERIES_BY_SERIES_CODE(code, cpcode, volumnCount, userId) {
    var RES;
    $.get(webset.api + "video/getSeriesBySeriesCode.json?code=" + code + "&cp=" + cpcode + "&volumnCount=" + volumnCount + "&userId=" + userId, function (res) {
        //区分动漫返回格式
        var res = json_type(res);
        if (res && res.response.responseHeader && res.response.responseHeader.code == '200') {
            RES = res.response.responseBody;
        }
    }, false);
    return RES
};
// 鉴权
function HAS_ORDER(userId, id, programType, title, async, callback) {
    var ORDER_DATA;
    $.get(webset.authentication + 'order/hasorder4H5.json?itvAccount=' + userId + '&combineId=' + id + '&type=' + programType + '&title=' + title, function (res) {
        var res = json_type(res);
        if (res && res.response.responseHeader && res.response.responseHeader.code == '200') {
            ORDER_DATA = res.response.responseBody;
            if (callback) callback(ORDER_DATA)
        }
    }, async || false);
    return ORDER_DATA
}

// 生成订单
function CREATE_ORDER(userId, id, programType, title, cpcode) {
    var _ATTEMPTDATA
    $.get(webset.authentication + 'order/createorder4H5.json?itvAccount=' + userId +
        '&combineId=' + id + '&type=' + programType + '&title=' + title + '&cpCode=' + cpcode + '&remark=',
        function (res) {
            var res = json_type(res);
            if (res && res.response.responseHeader && res.response.responseHeader.code == '200') {
                _ATTEMPTDATA = res.response.responseBody;
            }

        }, false);
    return _ATTEMPTDATA
}



// 除电影外，更新至集数处理
function NUM_TRANS_F(current, total, type) {

    var NUMSTRING
    if (current < total) {
        NUMSTRING = current
        type == 'arts' ? NUMSTRING = '更新至第' + current + '期' : NUMSTRING = '更新至第' + current + '集'
    } else {
        type == 'arts' ? NUMSTRING = '共' + total + '期 已完结' : NUMSTRING = '共' + total + '集 已完结'
    }
    return NUMSTRING
}

// 用户日志上报
function USER_UPDATA_LOG(_id, _type, _recommendPosition, _from) {
    $.get(webset.apibase + 'itv-api/api/upload/recommendepglog.json?userId=' + userId + '&clickRecommendId=' + _id + '&type=' + _type + '&recommendPosition=' + _recommendPosition + '&from=' + _from,
        function (res) {}, false);
}

//判断是否为“阻塞盒子”
function UN_INTERVAL(){
	if(stbModel=="EC6108V9_pub_ahwdx"
		||stbModel=="MR622-BJ"
		||stbModel=="HG680-J"
		||stbModel=="MR820"
		||stbModel=="IP906H_36T1"
		||stbModel=="HG680"
	){
		return false;
	}else{
		return true;
	}
}

//判断用户是否130版本的
var myConfigKey="ENGINE_EPG_VERSION_"+userId;//存储用户播放器版本号；
//用户进入首页时候，调用；
function IndexBFQversion(){
	
	var bfqVersion=Authentication.CTCGetConfig(myConfigKey);
	
	//如果没有值，则调用接口访问，获取一下；
	if(bfqVersion==''){
		//设置值
		$.get(webset.solo + "search/boxversion.json?userId=" + userId + "&boxmodel=" + stbModel, function (res) {
	        //区分动漫返回格式
	        var res = json_type(res);
	        if (res && res.responseHeader && res.responseHeader.code == '200') {
	            var _RES = res.responseBody;  
	            var v=_RES.version;
	            if(v==""){
	            	Authentication.CTCSetConfig("ENGINE_EPG_VERSION_"+userId,"108");
	            }else{
	            	Authentication.CTCSetConfig("ENGINE_EPG_VERSION_"+userId,v);
	            }
	        }
	    }, false);
	}else{
		//如果已有，则比较是否一致，不一致重新设置值；
		
	}
}
//获取播放器版本；在调用起播放器的时候，验证；
function getBFQversion(){
	var bfqVersion=Authentication.CTCGetConfig(myConfigKey);
	if(bfqVersion!="" && bfqVersion){
		return parseInt(bfqVersion);
	}else{
		return 108;
	}
}

function swichversion() {
	if(_playtimer){clearInterval(_playtimer)}
    //判断是否阻塞
    if(UN_INTERVAL()){
    	if(_playtimer){clearInterval(_playtimer)}
        //阻塞的盒子，直接延时调用；
        setTimeout(function(){
            countplay();
        },2000)
    }else{
    	if(_playtimer){clearInterval(_playtimer)}
        //非阻塞的盒子，判断是否为130版本;
        if(getBFQversion()>=130){
            setTimeout(function(){
                countplay();
            },2000)
        }else{
            //需要轮训
            if(_playtimer){clearInterval(_playtimer)}
            setTimeout(function(){
                _playtimer=setInterval(countplay,3000)
            },1000);
        }
    }
}

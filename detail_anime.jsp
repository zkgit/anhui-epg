<%@page import="java.net.URLDecoder"%>
<%@page import="com.vstartek.epg.pojo.SeriesStar"%>
<%@page import="com.vstartek.epg.utils.HttpLinkUtils"%>   
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.vstartek.epg.pojo.SeriesDetail"%>
<%@page import="com.vstartek.epg.action.SeriesAction"%>
<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String action= RequestUtil.getString("t", request);
	long id=RequestUtil.getLong("id", request);
	String cpcode=RequestUtil.getString("cpcode", request);
	String code=RequestUtil.getString("code", request);
	String programType=RequestUtil.getString("programType", request);

	SeriesDetail seriesDetail= SeriesAction.getSeriesDetailById(id);
	if(seriesDetail==null){
	    response.sendRedirect("error404.jsp?programType="+programType+"&seriesStatus=2");
	    return;
	}
	List<SeriesStar> starlist=seriesDetail.getStars_jh();
	if(starlist==null){
		starlist=new ArrayList<SeriesStar>();
	}
	int size=starlist.size();
	//表两个list，确认导演字段
	List<SeriesStar> starlist2=seriesDetail.getStars();
	if(starlist2==null){
		starlist2=new ArrayList<SeriesStar>();
	}
	
	//导演字段
	SeriesStar directorStar=null;
	
	if(starlist.size()>0&&starlist2.size()>0){
		SeriesStar star1= starlist2.get(0);
		SeriesStar star2= starlist.get(0);
		if(!RequestUtil.replaceNull(star1.getActorId()).equals(star2.getActorId())){
			directorStar=star1;
		}
	}
	
	String focus_id=RequestUtil.getString("focus_id", request);
	String back=RequestUtil.getString("back", request);
	String programa_id=RequestUtil.getString("programa_id", request);
	String perv_num=RequestUtil.getString("perv_num", request);
	int perv_count=RequestUtil.getInt("perv_count", request);
	String pf_focus_id=RequestUtil.getString("pf_focus_id", request);
	
	String home_focus_id=RequestUtil.getString("home_focus_id", request);
	String home_from=RequestUtil.getString("home_from", request);

	String pervUrl="&back=animation_index&focus_id="+focus_id+"&programa_id="+programa_id+"&perv_num="+perv_num+"&perv_count="+(perv_count+1)+"&pf_focus_id="+pf_focus_id+"&home_focus_id="+home_focus_id+"&home_from="+home_from;

	String from=RequestUtil.getString("from", request);
	String programa_name=RequestUtil.getString("programa_name", request);
	if(!"".equals(programa_name)){
		try{
			programa_name=URLDecoder.decode(programa_name, "UTF-8");
		}catch(Exception ex){}
	}

	String backURL=RequestUtil.getString("backURL", request);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
    <meta content="IE=5.0000" http-equiv="X-UA-Compatible">
    <meta name="page-view-size" content="1280*720">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>详情</title>
    <jsp:include page="/common/anime_top.jsp">
        <jsp:param name="t" value="<%=System.currentTimeMillis() %>" />
    </jsp:include>
    <style type="text/css">
        .p0 {
            font-size: 20px
        }
    </style>
    <meta name="GENERATOR" content="MSHTML 11.00.10570.1001">
</head>

<body bgcolor="transparent" >
   <div id="test" style="color: red;"></div>
</body>

<script type="text/javascript">
	window.document.onkeypress = function (keyEvent) {
	keyEvent = keyEvent ? keyEvent : window.event;
		var KV = keyEvent.which ? keyEvent.which : keyEvent.keyCode;
		if (KV == 0x0008){
			Utility.setValueByName("exitIptvApp");
		}
	}
	var _playtimer2;

	var cutdrama='', cuttime = 0,tongyi;
	var tmcutime=0;

	function commen_play2(id, programType, programType2, code, cpcode, pervUrl,ordered,dramaSum,iscut,cutdrama){
	    var url=window.location.href;
	    var dramasum=dramaSum||0;
	    var cuturl = '',title, videoid,volumnCount=programType == 'film' ? 1 :'';
	cuttime=0;
	    if(!iscut){
	        var e = CACHE_PLAY_TIME(userId,code);//获取断点cachePlayTime接口数据
	        if (e.userId) {
	            cuttime = e.cuttime?parseInt(e.cuttime):0;
	            volumnCount=parseInt(e.dramacount);
	        }
	    }else{
	        volumnCount=cutdrama;
	    }

	    var _playjson = GET_SERIES_BY_SERIES_CODE(code, cpcode, volumnCount, userId);//获取getSeriesBySeriesCode接口数据
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
// 	    _SELECT("test").innerHTML+=stbModel+"(cuttime:"+cuttime+")";
	    tmcutime=cuttime;
	    if (programType != 'film'){
	        volumnCount = _playjson.volumncount
	    }
	    cuturl = _playjson.url;
	    volumnCount ? volumnCount : volumnCount = _playjson.volumncount;
	    var isInstall = false;
        try{isInstall=STBAppManager.isAppInstalled("com.anhui.tv")}catch(ex){}
        var backUrlExit=<%="".equals(backURL)?"0":"1" %>;
        if(isInstall){
	         if (_playjson.seriesBcharging == '0') { //免费
	             STBAppManager.startAppByIntent("{'intentType':0,'appName':'com.anhui.tv', 'className':'com.anhui.tv.activity.AnHuiPlayDemandActivity','extra':[{'name':'PlayUrl', 'value':'" + cuturl + "'},{'name':'seriesCp_id', 'value':'" + code + "'},{'name':'Episodes', 'value':'" + volumnCount + "'},{'name':'WebReturnUrl', 'value':'" + encodeURIComponent('http://tv.itvengine.com.lv1.vcache.cn/itv-epg/webReturnUrl.jsp') + "'},{'name':'StartTime', 'value':'" + parseInt(cuttime) + "'},{'name':'VideoType', 'value':'anime'},{'name':'Type', 'value':'0'},{'name':'Title', 'value':'" + title + "'},{'name':'Vid', 'value':'" + _playjson.movieCode + "'},{'name':'AttemptUrl', 'value':''},{'name':'License', 'value':'ahdx'},{'name':'Cp', 'value':'" + cpcode + "'},{'name':'Bwatermark', 'value':'1'}]}");
	             if(backUrlExit){
	            	 setTimeout(function(){
	            		 window.location.href = '<%=backURL%>';
	            	 },10);
	             }else if(UN_INTERVAL()){
	            	setTimeout(function(){
            			Utility.setValueByName("exitIptvApp");
            	    },2000)
	             }else{
	            	 setTimeout(function(){
	            		 window.location.href = 'http://ando.itvengine.com.lv1.vcache.cn/itv-epg/animation_index.jsp?programType=anime&home_from=zhuoying';
	            	 },10);
	             }
	         }else if(_playjson.seriesBcharging == '1'){//收费
	             var _hasorder_data = HAS_ORDER(userId, id, programType, title);
	             switch (_hasorder_data.ordered){ // 鉴权成功
	                 case 1:
	                     var _param = _hasorder_data.param,
	                         _battempt = programType == 'film' ? '0' : _playjson.bcharging; // 区分电影鉴权成功默认免费
	                     
	                     STBAppManager.startAppByIntent("{'intentType':0,'appName':'com.anhui.tv', 'className':'com.anhui.tv.activity.AnHuiPlayDemandActivity','extra':[{'name':'PlayUrl', 'value':'" + cuturl + "'},{'name':'seriesCp_id', 'value':'" + code + "'},{'name':'Episodes', 'value':'" + volumnCount + "'},{'name':'WebReturnUrl', 'value':'" + encodeURIComponent('http://tv.itvengine.com.lv1.vcache.cn/itv-epg/webReturnUrl.jsp') + "'},{'name':'StartTime', 'value':'" + parseInt(cuttime) + "'},{'name':'VideoType', 'value':'anime'},{'name':'Type', 'value':'0'},{'name':'Title', 'value':'" + title + "'},{'name':'Vid', 'value':'" + _playjson.movieCode + "'},{'name':'AttemptUrl', 'value':'" + _param + "'},{'name':'License', 'value':'ahdx'},{'name':'Cp', 'value':'" + cpcode + "'},{'name':'Battempt', 'value':'" + _battempt + "'},{'name':'Bwatermark', 'value':'1'}]}");
	                     if(backUrlExit){
	    	            	 setTimeout(function(){
	    	            		 window.location.href = '<%=backURL%>';
	    	            	 },10);
	    	             }else if(UN_INTERVAL()){
	     	            	setTimeout(function(){
	                 			Utility.setValueByName("exitIptvApp");
	                 	    },2000)
	     	             }else{
	     	            	setTimeout(function(){
		   	            		 window.location.href = 'http://ando.itvengine.com.lv1.vcache.cn/itv-epg/animation_index.jsp?programType=anime&home_from=zhuoying';
		   	            	 },10);
	     	             }
	                     break;
	                 default: // 鉴权失败                                          
	                     var CO_DATA = CREATE_ORDER(userId, id, programType, title, cpcode), // 获取生成的订单信息
	                         _attempt_url = 'providerId=' + CO_DATA.providerId + '|orderInfo=' + CO_DATA.orderInfo2 + '|deviceType=' + CO_DATA.deviceType + '|notifyUrl=' + CO_DATA.notifyUrl + '|orderInfo2=' + CO_DATA.orderInfo,
	                         _battempt = _playjson.bcharging;
	                     
	                     STBAppManager.startAppByIntent("{'intentType':0,'appName':'com.anhui.tv', 'className':'com.anhui.tv.activity.AnHuiPlayDemandActivity','extra':[{'name':'PlayUrl', 'value':'" + cuturl + "'},{'name':'seriesCp_id', 'value':'" + code + "'},{'name':'Episodes', 'value':'" + volumnCount + "'},{'name':'WebReturnUrl', 'value':'" + encodeURIComponent('http://tv.itvengine.com.lv1.vcache.cn/itv-epg/webReturnUrl.jsp') + "'},{'name':'StartTime', 'value':'" + parseInt(cuttime) + "'},{'name':'VideoType', 'value':'anime'},{'name':'Type', 'value':'0'},{'name':'Title', 'value':'" + title + "'},{'name':'Vid', 'value':'" + _playjson.movieCode + "'},{'name':'AttemptUrl', 'value':'" + _attempt_url + "'},{'name':'License', 'value':'ahdx'},{'name':'Cp', 'value':'" + cpcode + "'},{'name':'Battempt', 'value':'" + _battempt + "'},{'name':'Bwatermark', 'value':'1'}]}");
	                     if(backUrlExit){
	    	            	 setTimeout(function(){
	    	            		 window.location.href = '<%=backURL%>';
	    	            	 },10);
	    	             }else if(UN_INTERVAL()){
	     	            	setTimeout(function(){
	                 			Utility.setValueByName("exitIptvApp");
	                 	    },2000)
	     	             }else{
	     	            	setTimeout(function(){
		   	            		 window.location.href = 'http://ando.itvengine.com.lv1.vcache.cn/itv-epg/animation_index.jsp?programType=anime&home_from=zhuoying';
		   	            	 },10);
	     	             }
	             }
	         }
	     }else { //跳转到 window_tv页面播放
	        
	        if(programType == 'anime'|| !dramasum ||!ordered ){
	            var _hasorder_data = HAS_ORDER(userId, id, programType, title);
	            ordered=_hasorder_data.ordered;
	        }
	        url="http://ando.itvengine.com.lv1.vcache.cn/itv-epg/animation_index.jsp?programType=anime&home_from=zhuoying";
	        if(backUrlExit){
	        	url = '<%=backURL%>';
	        }
	        if (programType == 'film') {
	            window.location.href = "window.jsp?id=" + id + "&programType=" + programType + "&code=" + code + "&cpcode=" + cpcode + pervUrl + "&title=" + encodeURIComponent(title) + "&cutTime=" + cuttime + "&playurl=" + encodeURIComponent(cuturl) + "&videoid=" + videoid+'&seriesBcharging='+_playjson.seriesBcharging+'&ordered='+ordered+'&returnUrl='+encodeURIComponent(url);
	        } else {
	            window.location.href = "window.jsp?id=" + id + "&programType=" + programType + "&code=" + code + "&cpcode=" + cpcode + pervUrl + "&title=" + encodeURIComponent(title) + "&cutTime=" +(cuttime?cuttime:'') + "&playurl=" + encodeURIComponent(cuturl) + "&videoid=" + videoid + "&dramasum="+dramasum+"&cutdrama=" + volumnCount+'&seriesBcharging='+_playjson.seriesBcharging+'&ordered='+ordered+'&iscut='+iscut+'&returnUrl='+encodeURIComponent(url);
	        }
	    }
	}
   
	//判断是否为“阻塞盒子” //HG680//
	function UN_INTERVAL(){
		var stbModel = Authentication.CTCGetConfig("STBType");
		if(stbModel=="EC6108V9_pub_ahwdx"
			||stbModel=="MR622-BJ"
			||stbModel=="MR622"
			||stbModel=="HG680-J"
			||stbModel=="HG680"
			||stbModel=="MR820"
			||stbModel=="IP906H_36T1" || stbModel.indexOf("B860")!=-1
		){
			return false;
		}else{
			return true;
		}
	}

	commen_play2('<%=id%>', '<%=programType%>', '<%=HttpLinkUtils.getProgramType_ZH(programType)%>','<%=code%>', '<%=cpcode%>','<%=pervUrl%>',0,1);
</script>

</html>
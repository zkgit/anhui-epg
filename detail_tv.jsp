    <%@page import="java.net.URLEncoder"%>
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
	    response.sendRedirect("error404.jsp?programType="+programType);
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
	
	String backUrl=RequestUtil.getString("backUrl", request);//接受backUrl
	String backUrl_encode=URLEncoder.encode(backUrl,"UTF-8");
	
	String pervUrl="&back="+back+"&focus_id="+focus_id+"&programa_id="+programa_id+"&perv_num="+perv_num+"&perv_count="+(perv_count+1)+"&pf_focus_id="+pf_focus_id+"&home_focus_id="+home_focus_id+"&home_from="+home_from+"&backUrl="+backUrl_encode;
	
	String from=RequestUtil.getString("from", request);
	String programa_name=RequestUtil.getString("programa_name", request);
	if(!"".equals(programa_name)){
		try{
			programa_name=URLDecoder.decode(programa_name, "UTF-8");
		}catch(Exception ex){}
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta content="IE=5.0000" http-equiv="X-UA-Compatible">
    <meta name="page-view-size" content="1280*720">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>详情</title>
    <jsp:include page="/common/top_0718.jsp">
        <jsp:param name="t" value="<%=System.currentTimeMillis() %>" />
    </jsp:include>
    <script src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/webxiri_1.0.8.js" type="text/javascript"></script>
    <script src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/detailfun.min.js" type="text/javascript"></script>
    <style type="text/css">
        .p0 {
            font-size: 20px
        }
    </style>
    <meta name="GENERATOR" content="MSHTML 11.00.10570.1001">
</head>

<body  bgcolor="transparent" onload="initdatas()">
    <img style="left: 0px; top: 0px; width: 1280px; height: 720px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-bg.png">
    <div id="DIV_F" style="left: 588px; top: 348px; position: absolute; z-index: 11;">
        <img id="IMG_F" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-playbutton.png"> </div>
    <div style="left: 62px; top: 52px; position: absolute;">
        <img style="left: 0px; top: 0px; width: 61px; height: 60px; position: absolute; z-index: 10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"  id="isfree">
    </div>
    <div style="left: 611px; top: 45px; width: 450px; height: 50px; position: absolute;">
        <p style="margin: 0px; padding: 0px; left: 0px; top: 0px; width: 450px; height: 50px; text-align: left; color: rgb(255, 255, 255); line-height: 50px; overflow: hidden; font-family: 微软雅黑; font-size: 38px; font-weight: normal; position: absolute;">
            <%=seriesDetail.getTitle() %>
        </p>
    </div>
    <div style="left: 611px; top: 95px; width: 530px; height: 30px; position: absolute;">
        <div style="left: 0px; top: 0px; width: 260px; height: 30px; position: absolute;">
            <h2 style="position:absolute;left:0px;top:0px;width:70px;height:25px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">
                <%=seriesDetail.getYear() %>年</h2>
            <h2 id="item_category" style="position:absolute;left:63px;top:0px;width:190px ;height:23px;line-height:25px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;"></h2>
        </div>
        <div style="left: 260px; top: 0px; width: 270px; height: 30px; position: absolute;">
        <h2 style="margin: 0px; padding: 0px; left: 0px; top: 0px; width: 46px; text-align: left; color: rgb(255, 255, 255); overflow: hidden; font-family: 微软雅黑; font-size: 18px; font-weight: normal; position: absolute;">导演:</h2>
            <%
            if(directorStar!=null){
            	int widthlength=HttpLinkUtils.String_length(directorStar.getActorName())*9+30;
            %>
        <div id="item_director" style="height:38px;width:<%=widthlength%>px;margin: 0px; padding: 0px; left: 46px; top: 0px; text-align: center; color: rgb(255, 255, 255); overflow: hidden; font-family: 微软雅黑; font-size: 18px; font-weight: normal; position: absolute;margin-top:-5px;">
        <p id="a_item_director" style="margin: 0px; padding: 0px;text-decoration: underline;margin-top:5px;"><%=directorStar.getActorName() %></p>
        </div>
            <%}else{ %>
        <p id="a_item_director" style="height:30px;margin: 0px; padding: 0px; left: 46px; top: 0px; text-align: center; color: rgb(255, 255, 255); overflow: hidden; font-family: 微软雅黑; font-size: 18px; font-weight: normal; position: absolute;"></p>
            <%} %>
        </div>
    </div>
    <!-- 嘉宾 -->

    <div style="left: 611px; top: 125px; width: 580px; height: 40px; position: absolute;">
        <div style="left: 0px; top: 0px; width: 580px; height:40px; position: absolute;">
            <h2 style="position:absolute;left:0px;top:0px;width:46px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;padding-top:5px;">演员:</h2>
            <h2 id="item_guest" style="position:absolute;left:46px;top:0px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;"></h2>
        <div id="stars" style="margin: 0px; padding: 0px; left: 46px; top: 0px; width: 560px; height: 40px; text-align: left; color: rgb(255, 255, 255); overflow: hidden; font-family: 微软雅黑; font-size: 18px; font-weight: normal; position: absolute;">
            <%
    int titlewidth=0;
int j=0;
for(SeriesStar star: starlist) {
    int titlelength=HttpLinkUtils.String_length(star.getActorName());
    int width=9*titlelength+30;

    j++;
    titlewidth+=width+10;
    if(titlewidth>=560){
        break;
    }
    if(j==1){
%>
        <div id="item_guest<%=j-1 %>" style="top: 0px; width: <%=width%>px; height: 38px; text-align: center; color: rgb(255, 255, 255); overflow: hidden; font-family: 微软雅黑; font-size: 18px; font-weight: normal; float: left;">
        <p id="a_item_guest<%=j-1 %>" style="text-align: center; color: white; text-decoration: underline; margin-top: 5px;">
            <%=RequestUtil.replaceNull(star.getActorName()) %>
        </p>
        </div>

            <%}else{%>
        <div style="width: 10px; height: 38px; text-align: center; color: rgb(255, 255, 255); overflow: hidden; padding-top: 5px; font-family: 微软雅黑; font-size: 18px; font-weight: normal; float: left;">|</div>
        <div id="item_guest<%=j-1 %>" style="top: 0px; width: <%=width%>px; height: 38px; text-align: center; color: rgb(255, 255, 255); overflow: hidden; font-family: 微软雅黑; font-size: 18px; font-weight: normal; float: left;">
        <p id="a_item_guest<%=j-1 %>" style="text-align: center; color: white; text-decoration: underline; margin-top: 5px;">
            <%=RequestUtil.replaceNull(star.getActorName()) %>
        </p>
        </div>
            <% }} %>
        </div>
        </div>
    </div>
    <div style="position:absolute; left:611px;top:176px;width:510px;height:30px;">
        <p style="position:relative;left:0px;top:0px;width: 510px; height: 30px; line-height: 30px; text-align:left; font-size:19px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;" id='dec'>简介:
            <%=RequestUtil.replaceNull(seriesDetail.getDescription()) %>
        </p>
    </div>
    <div style="position:absolute;left:1110px;top:160px;">
        <img id="bt_bqw" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;width:108px;height:64px; ;">
        <p style="position:relative;left:16px;top:22px; text-align:left; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#5CF0F0; overflow:hidden; margin:0; padding:0;">【全文】</p>
    </div>
    <!-- 选集列表-->
    <div id="bt_div0" style="position: absolute; left: 610px; top: 226px; display: none;">
        <img id="bt_js0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-js-b.png" style="position: absolute;left:0px;top:0px;width:80px; height:35px;">
        <p id="bt_js_f0" style="position:relative; left:0px; top:0px; width:80px; height:35px; line-height:35px; text-align:center;font-size:16px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
    </div>
    <div id="bt_div1" style="position: absolute; left: 700px; top: 226px; display:none;">
        <img id="bt_js1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-js-b.png" style="position: absolute;left:0px;top:0px;width:80px; height:35px;">
        <p id="bt_js_f1" style="position:relative; left:0px; top:0px; width:80px; height:35px; line-height:35px; text-align:center;font-size:16px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
    </div>
    <div id="bt_div2" style="position: absolute; left: 790px; top: 226px; display: none;">
        <img id="bt_js2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-js-b.png" style="position: absolute;left:0px;top:0px;width:80px; height:35px;">
        <p id="bt_js_f2" style="position:relative; left:0px; top:0px; width:80px; height:35px; line-height:35px; text-align:center;font-size:16px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
    </div>
    <div id="bt_div3" style="position: absolute;left:880px;top:226px;display: none;">
        <img id="bt_js3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-js-b.png" style="position: absolute;left:0px;top:0px;width:80px; height:35px;">
        <p id="bt_js_f3" style="position:relative; left:0px; top:0px; width:80px; height:35px; line-height:35px; text-align:center;font-size:16px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
    </div>
    <div id="bt_div4" style="position: absolute;left:970px;top:226px;display: none;">
        <img id="bt_js4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-js-b.png" style="position: absolute;left:0px;top:0px;width:80px; height:35px;">
        <p id="bt_js_f4" style="position:relative; left:0px; top:0px; width:80px; height:35px; line-height:35px; text-align:center;font-size:16px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
    </div>
    <div id="bt_div5" style="position: absolute;left:1060px;top:226px;display: none;">
        <img id="bt_js5" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-js-b.png" style="position: absolute;left:0px;top:0px;width:80px; height:35px;">
        <p id="bt_js_f5" style="position:relative; left:0px; top:0px; width:80px; height:35px; line-height:35px; text-align:center;font-size:16px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:11"></p>
    </div>
    <div id="div_vf0" style="position: absolute; left: 612px; top: 269px; display:none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf0" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf1" style="position: absolute; left: 672px; top: 269px; display:none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf1" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf2" style="position: absolute; left: 732px; top: 269px; display:none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf2" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf3" style="position: absolute; left: 792px; top: 269px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf3" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf4" style="position: absolute; left: 852px; top: 269px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf4" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf5" style="position: absolute; left: 912px; top: 269px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf5" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf5" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf5" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf6" style="position: absolute; left: 972px; top: 269px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf6" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf6" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf6" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf7" style="position: absolute; left: 1032px; top: 269px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf7" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf7" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf7" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf8" style="position: absolute; left: 1092px; top: 269px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf8" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf8" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf8" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf9" style="position: absolute; left: 1152px; top: 269px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf9" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf9" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf9" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>

    <div id="div_vf10" style="position: absolute; left: 612px; top: 308px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf10" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf10" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf10" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf11" style="position: absolute; left: 672px; top: 308px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf11" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf11" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf11" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf12" style="position: absolute; left: 732px; top: 308px; display:none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf12" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf12" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf12" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf13" style="position: absolute; left: 792px; top: 308px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf13" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf13" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf13" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf14" style="position: absolute; left: 852px; top: 308px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf14" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf14" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf14" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf15" style="position: absolute; left: 912px; top: 308px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf15" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf15" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf15" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf16" style="position: absolute; left: 972px; top: 308px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf16" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf16" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf16" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf17" style="position: absolute; left: 1032px; top: 308px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf17" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf17" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf17" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf18" style="position: absolute; left: 1092px; top: 308px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf18" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf18" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf18" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div id="div_vf19" style="position: absolute; left: 1152px; top: 308px; display: none;">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detailtv-dra-bg.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <img id="bt_vf19" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:58px;height:37px;">
        <p id="bt_pf19" style="position:relative;left:0px;top:0px;width:58px; height:37px; line-height:37px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:1"></p>
        <img id="bt_jbf19" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;width:30px;height:30px;z-index:10">
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;">
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;">
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;">
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg4" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;">
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg5" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;">
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg6" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;">
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg7" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;">
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg8" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;;">
    </div>
    <div id="div_arrowf" style="position:absolute;left:1120px;top:220px;display: none;">
        <img id="filter-tag-more" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/filter-tag-more.png" style="position: absolute;left:0px;top:0px;;width:121px;height:47px;">
    </div>
    <!--播放 收藏 订购-->
    <div style="left: 588px; top: 348px; position: absolute;">
        <img style="left: 18px; top: 19px; width: 110px; height: 43px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-play.png">
        <img id="bt_bplay" style="left: 0px; top: 0px; width: 150px; height: 93px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
    <div style="left: 714px; top: 348px; position: absolute;display:none;" id="ordered">
        <img style="left: 18px; top: 19px; width: 110px; height: 43px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-order.png">
        <img id="bt_buy" style="left: 0px; top: 0px; width: 150px; height: 93px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
    <div style="left: 714px; top: 348px; position: absolute;" id="coll">
        <img id="sc_img" style="left: 18px; top: 19px; width: 110px; height: 43px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        <img id="bt_bsc" style="left: 0px; top: 0px; width: 150px; height: 93px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
     <div style="left: 966px;top: 348px;position: absolute;display:none;" id="gd_box">
        <img id="gd_img" style="left: 18px; top:  19px; width: 110px; height:43px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        <img id="bt_gd" style="left: 0px; top: 0px; width: 150px; height: 93px;  position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
     </div>
    <div style="left: 838px; top: 348px; position: absolute;">
        <img style="left: 19px; top: 19px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
    <div id="div_prevWatch" style="left: 594px; top: 318px; width: 280px; height: 55px; visibility: hidden; position: absolute; z-index: 1; background-image: url(http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-watch-tip.png); background-repeat: no-repeat;background-size: 280px auto;"></div>
    <div style="left: 64px; top: 399px; width: 100px; height: 25px; position: absolute; z-index: 10;">
        <p style="margin: 0px; padding: 0px; left: 0px; top: 0px; width: 100px; height: 25px; text-align: left; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-size: 20px; font-weight: normal; position: relative;">关联推荐</p>
    </div>
    
    <!-- 吐槽:位置暂时放在评分的前面 -->
    <div style="left: 1159px; top: 5px; position: absolute;">
      <img id="tc_img" style="left: 58px; top: 32px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc2.png">
      <img id="tc" style="left: 32px; top: 0px; width: 87px; height: 104px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
    <div style="left: 1207px; top: 58px; position: absolute;">
      <p id="tc_title" style="left: 0px; top: 0px; width:50px; text-align: center; color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 16px; position: absolute;">吐槽</p>
    </div>
    
    <!--<div style="left: 1094px; top: 5px; position: absolute;">
      <img id="tc_img" style="left: 58px; top: 32px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc2.png">
      <img id="tc" style="left: 32px; top: 0px; width: 87px; height: 104px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
    <div style="left: 1144px; top: 58px; position: absolute;">
      <p id="tc_title" style="left: 0px; top: 0px; width:50px; text-align: center; color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 16px; position: absolute;">吐槽</p>
    </div>-->
    
    <div id="tc_feedFail" style="left: 0px; top: 0px; visibility: hidden; position: absolute; z-index: 15;">
    	<img style="left: 0px; top: 0px; width: 1280px; height: 720px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-faild4.png"> 
    </div>       
    <div id="tc_feedSuccess" style="left: 0px; top: 0px; visibility: hidden; position: absolute; z-index: 15;">
    	<img style="left: 0px; top: 0px; width: 1280px; height: 720px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-success4.png"> 
    </div>
    
    <div id="tc_block" style="left: 0px; top: 0px; visibility: hidden; position: absolute; z-index: 12;">
        <img style="left: 0px; top: 0px; width: 1280px; height: 720px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-bg2.png">                
        <div style="left: 834px;top: 315px;width: 120px;height: 120px;position: absolute;background-color: white;">
        	<img id='tc_qr' style="left: 5px;top: 5px;width: 110px;height: 110px;position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"/>
        	<!--<p style="top: 138px;position: absolute;font-size: 12px;width: 100%;text-align: center;">扫码反馈意见及建议</p>-->
        </div>
        <div style="left: 310px; top: 307px; position: absolute;">
            <!--<img id="" style="left: 10px; top: 5px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-check.png">-->                
            <img id="checked1" style="visibility:hidden;left: 54px; top: 22px; width: 27px; height: 20px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-confirm2.png">
            <img id="check1" style="left: 10px; top: 20px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        </div>
        <div style="left: 310px; top: 348px; position: absolute;">
            <!--<img id="" style="left: 10px; top: 5px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-check.png">-->
            <img id="checked2" style="visibility:hidden;left: 56px; top: 22px; width: 27px; height: 20px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-confirm2.png">
            <img id="check2" style="left: 10px; top: 18px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        </div>
        <div style="left: 310px; top: 390px; position: absolute;">
        	<!--<img id="" style="left: 10px; top: 5px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-check.png">-->
        	<img id="checked3" style="visibility:hidden;left: 54px; top: 18px; width: 27px; height: 20px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-confirm2.png">
            <img id="check3" style="left: 10px; top: 22px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        </div>
        <!--<div style="left: 312px; top: 410px; position: absolute;">
            <img id="" style="left: 10px; top: 5px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-singel.png">
        </div>-->
        <!-- 提交 返回按钮-->
        <div style="left: 375px; top: 479px; position: absolute;">
            <img id="tc_sub" style="left: 10px; top: 5px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-sub6.png">
        </div>
        <div style="left: 715px; top: 479px; position: absolute;">
            <img id="tc_back" style="left: 10px; top: 5px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-back6.png">
        </div>
    </div>
    
    <!-- 分享 -->
    <div style="left: 1094px; top: 5px; position: absolute;">
          <img id="share_img" style="left: 58px; top: 32px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-share.png">
          <img id="share" style="left: 33px; top: 0px; width: 87px; height: 104px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
          <img id="share_finish" style="left: 35px; top: 95px; position: absolute; z-index: 1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
    <div style="left: 1144px; top: 58px; position: absolute;">
          <p id="share_title" style="left: 0px; top: 0px; width:50px; text-align: center; color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 16px; position: absolute;">分享</p>
    </div>

    <!-- 点赞 -->
    <div style="left: 1029px; top: 5px; position: absolute;">
        <img id="zan" style="left: 58px; top: 32px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-zan.png">
        <img id="dzl" style="left: 32px; top: 0px; width: 87px; height: 104px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        <img id="dzl_finish" style="left: 35px; top: 95px; position: absolute; z-index: 1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
    <div style="left: 1060px; top: 58px; position: absolute;">
        <p id="item_like" style="left: 0px; top: 0px; width:87px; text-align: center; color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 16px; position: absolute;">
            <%=seriesDetail.getVoteCount() %>
        </p>
    </div>
    <!-- 评分 -->

    <div style="left:964px; top: 5px; position: absolute;">
        <img id="pf" style="left: 58px; top: 32px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-score.png">
        <img id="score" style="left: 32px; top: 0px; width: 87px; height: 104px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        <img id="score_finish" style="left: 35px; top: 95px; position: absolute; z-index: 1;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
    <div id="score_all" style="visibility: hidden;">
        <div style="left: 925px; top: 75px; position: absolute;">
            <img id="xx_01" style="left: 0px; top: 66px; position: absolute; z-index: 11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-full.png">
            <img id="xx_01_f" style="left: 0px; top: 66px; width: 41px; height: 41px; position: absolute; z-index: 10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-null.png"> </div>
        <div style="left: 960px; top: 75px; position: absolute;">
            <img id="xx_02" style="left: 0px; top: 66px; position: absolute; z-index: 11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-full.png">
            <img id="xx_02_f" style="left: 0px; top: 66px; width: 41px; height: 41px; position: absolute; z-index: 10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-null.png"> </div>
        <div style="left: 995px; top: 75px; position: absolute;">
            <img id="xx_03" style="left: 0px; top: 66px; position: absolute; z-index: 11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-full.png">
            <img id="xx_03_f" style="left: 0px; top: 66px; width: 41px; height: 41px; position: absolute; z-index: 10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-null.png"> </div>
        <div style="left: 1030px; top: 75px; position: absolute;">
            <img id="xx_04" style="left: 0px; top: 66px; position: absolute; z-index: 11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-full.png">
            <img id="xx_04_f" style="left: 0px; top: 66px; width: 41px; height: 41px; position: absolute; z-index: 10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-null.png"> </div>
        <div style="left: 1065px; top: 75px; position: absolute;">
            <img id="xx_05" style="left: 0px; top: 66px; position: absolute; z-index: 11;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-left.png">
            <img id="xx_05_f" style="left: 0px; top: 66px; width: 41px; height: 41px; position: absolute; z-index: 10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-null.png"> </div>
        <div style="left: 870px; top: 40px; position: absolute;">
            <img style="left: 0px; top: 63px; position: absolute; z-index: 10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/score-bg.png"> </div>
        <!-- 评分确定 -->
    	</div>
     
    <div style="left: 0px; top: 0px; position: absolute;">
        <img id="bt_xl" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> </div>
    <div style="left: 0px; top: 0px; position: absolute;">
        <img id="bt_xx" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> </div>
    <div style="left: 0px; top: 0px; position: absolute;">
        <img id="bt_xr" style="left: 0px; top: 0px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> </div>
    <div style="left: 998px; top: 58px; position: absolute;">
        <p id="b_score" style="left: 0px; top: 0px; width: 87px; text-align: center; color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 16px; position: absolute;">
            <%=seriesDetail.getScore() %>
        </p>
    </div>
    <!-- 小视频 -->

    <div style="left: 62px; top: 52px; width: 532px; height: 314px; position: absolute;">
       	<iframe name="smallWidow" width="0" height="0" id="smallWidow" src="" frameborder="0" scrolling="no"></iframe>
        <img id="dp_01" style="left: -18px; top: -16px; width: 568px; height: 352px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        <img id="mf" style="left: 1px; top: 133px; width: 530px; height: 180px; position: absolute; z-index: 2;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-smwindow-bot.png">
        <p style="margin: 0px; padding: 0px; left: 0px; top: 288px; text-align: center; color: rgb(255, 255, 255); overflow: hidden; font-size: 20px; font-weight: normal; position: relative; z-index: 2;">您正在观看精彩视频,按确定键可全屏播放</p>
    </div>
    <!-- 分享 -->

    <div id="share_memo" style="left: 0px; top: 0px; visibility: hidden; position: absolute; z-index: 12;">
        <img style="left: 0px; top: 0px; width: 1280px; height: 720px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-share-alert.png">
        <img style="left: 649px; top: 413px; width: 200px; height:200px;webkit-transform:rotate(-5deg);transform: rotate(-5deg); position: absolute;" id="share-er" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">

        <!-- 返回按钮 -->
        <div style="left: 1110px; top: 45px; position: absolute;">
            <img id="bt_sh" style="left: 10px; top: 5px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/icon-back.png">
            <img id="bt_bhs" style="left: 0px; top: 0px; width: 87px; height: 104px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-zanbg-f.png">
        </div>
    </div>
        <!-- 点击全文 -->

    <div id="qw_memo" style="left: 0px; top: 0px; visibility: hidden; position: absolute; z-index: 12;">
        <img style="left: 0px; top: 0px; width: 1280px; height: 720px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-qwbg.png">
        <!-- 全文详情 -->
        <div style="left: 180px; top: 133px; width: 80px; height: 50px; position: absolute;">
        <p style="margin: 0px; padding: 0px; left: 0px; top: 0px; width: 80px; height: 50px; text-align: center; color: rgb(255, 255, 255); line-height: 50px; overflow: hidden; font-size: 35px; font-weight: normal; position: absolute;">简介</p>
        </div>
        <div style="left: 215px; top: 190px; width: 870px; height: 420px; position: absolute;">
        <div class="deczhan" style="margin: 0px; padding: 0px; width: 870px; height: 416px; text-align: left; color: rgb(255, 255, 255); line-height: 35px; letter-spacing: 8px; overflow: hidden; font-size: 25px; font-weight: normal; position: relative;">
        <p> 简介：
            <%=RequestUtil.replaceNull(seriesDetail.getDescription()) %>
        </p>
        </div>
        </div>
        <!-- 返回按钮 -->
        <div style="left: 1110px; top: 45px; position: absolute;">
        <img id="bt_fh" style="left: 10px; top: 5px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/icon-back.png">
        <img id="bt_bhf" style="left: 0px; top: 0px; width: 87px; height: 104px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-zanbg-f.png"> </div>
     </div>
    <img id="totj" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    <!-- 返回按钮 -->
    <div id="scrollid" style="top: 425px; width: 1250px; height: 295px; overflow: hidden; position: absolute; z-index: 9;">
        <img style="left: 20px; top: 110px; width: 40px; height: 100px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/icon-left.png">
        
        <img id="toleftpageend17" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">

        <div id="div_f0" style="left: 44px; display: block; position: absolute;">
            <img id="bt_s0" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb0" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f0" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr0" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p0" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f1" style="left: 242px; display: block; position: absolute;">
            <img id="bt_s1" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb1" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f1" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr1" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p1" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f2" style="left: 440px; display: block; position: absolute;">
            <img id="bt_s2" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb2" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f2" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr2" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p2" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f3" style="left: 638px; display: block; position: absolute;">
            <img id="bt_s3" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb3" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f3" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr3" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p3" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f4" style="left: 836px; display: block; position: absolute;">
            <img id="bt_s4" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb4" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f4" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr4" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p4" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f5" style="left: 1034px; display: block; position: absolute;">
            <img id="bt_s5" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb5" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f5" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr5" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p5" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <img id="torightpage5" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">

        <img id="toleftpage6" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">


        <div id="div_f6" style="left: 1232px; display: block; position: absolute;">
            <img id="bt_s6" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb6" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f6" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr6" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p6" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f7" style="left: 1430px; display: block; position: absolute;">
            <img id="bt_s7" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb7" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f7" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr7" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p7" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f8" style="left: 1628px; display: block; position: absolute;">
            <img id="bt_s8" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb8" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f8" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr8" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p8" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f9" style="left: 1826px; display: block; position: absolute;">
            <img id="bt_s9" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb9" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f9" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr9" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p9" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f10" style="left: 2024px; display: block; position: absolute;">
            <img id="bt_s10" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb10" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f10" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr10" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p10" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f11" style="left: 2222px; display: block; position: absolute;">
            <img id="bt_s11" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb11" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f11" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr11" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p11" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 23px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <img id="torightpage11" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">

        <img id="toleftpage12" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">


        <div id="div_f12" style="left: 2420px; display: block; position: absolute;">
            <img id="bt_s12" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb12" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f12" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr12" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p12" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 25px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f13" style="left: 2618px; display: block; position: absolute;">
            <img id="bt_s13" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb13" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f13" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr13" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p13" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 25px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f14" style="left: 2816px; display: block; position: absolute;">
            <img id="bt_s14" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb14" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f14" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr14" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p14" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 25px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f15" style="left: 3014px; display: block; position: absolute;">
            <img id="bt_s15" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb15" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f15" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr15" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p15" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 25px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f16" style="left: 3212px; display: block; position: absolute;">
            <img id="bt_s16" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb16" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f16" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr16" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p16" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 25px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <div id="div_f17" style="left: 3410px; display: block; position: absolute;">
            <img id="bt_s17" style="left: 20px; top: 10px; width: 166px; height: 222px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_jb17" style="left: 20px; top: 10px; width: 61px; height: 60px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_f17" style="left: 0px; top: -10px; width: 206px; height: 262px; position: absolute;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <!--<img id="bt_jbr17" style="left: 124px; top: 10px; width: 56px; height: 29px; position: absolute; z-index: 9;" src="Welcome-detail_files/jb_.png">-->
            <p class="p0" id="bt_p17" style="margin: 0px; padding: 0px; left: 20px; top: 247px; width: 166px; height: 25px; text-align: center; color: rgb(255, 255, 255); line-height: 25px; overflow: hidden; font-family: 微软雅黑; font-weight: normal; position: absolute;"></p>
        </div>
        <img id="torightpageend17" style="width: 1px; height: 1px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        <img style="left: 1227px; top: 110px; width: 40px; height: 100px; position: absolute; z-index: 9;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/icon-right.png"> </div>
        <img id="collect" style="left: 680px; top: 260px; position: absolute; z-index: 99;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">

    <div style="left: 5px; top: 5px; position: absolute;">
        <img id="stat" style="left: 1px; top: 1px; position: absolute;" src=""> </div>
        <!-- <img id="img_volume" style="left:50px; top: 537px; position: absolute; z-index:9999;display:none;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"> -->
    <div id="test" style="left: 59px; top: 537px; color: rgb(255, 0, 0); font-size: 30px; position: absolute;"></div>
</body>

<script type="text/javascript">
   var cjson={
            'film':2,
            'tv':3,
            'arts':4,
            'documentary':12
        }
   var uptype='<%=programType%>'.toUpperCase();
    var _BS = {};
    var focus_id = 'bt_bplay';
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
        	var str=window.location.href.replace('detail_tv.jsp', 'detail_tv1.jsp')
            window.location.href=str;
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
        if(_IS_Long){
           _BS['bt_gd']['focusImage']='detail-longplay.png';
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
        } else if (focus_id == 'bt_bqw' && _BS[focus_id] != undefined && _BS[focus_id]['upButtonId'] != '') {
            _H_F(_BS['dzl']);
        }
        return;
    }

    function F_KEY_G_6() { //right
        if (_BS[focus_id]['rightButtonId'].indexOf('bt_js') > -1) {
            right = _BS[focus_id]['rightButtonId'].replace('bt_js', 'bt_div');
            if (_SELECT(right).style.display == 'none') {
                return;
            }
        }
        if (_BS[focus_id] != undefined && _BS[focus_id]['rightButtonId'] != ''&&_SELECT(_BS[focus_id]['rightButtonId']).style.display!='none') {
            _H_F(_BS[focus_id]['rightButtonId'])
        }
        return;
    }

    function F_KEY_G_7() { //down
        if (_BS[focus_id] != undefined && _BS[focus_id]['downButtonId'] != '') {
            _H_F(_BS[focus_id]['downButtonId'])
        } else if (focus_id == 'dzl' && _BS[focus_id] != undefined && _BS[focus_id]['downButtonId'] != '') {
            _H_F(_BS['bt_bqw'])
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

    function F_KEY_G_0() { //back
    	if('tc-success' == go_order_div){//吐槽成功
           	_SELECT("tc_feedSuccess").style.visibility = "hidden";
           	_H_F('tc');
           	go_order_div = 'N'
        }else if('tc-faild' == go_order_div){//吐槽未选
       	    _SELECT("tc_feedFail").style.visibility = "hidden";
       	    _H_F('tc');
       	    F_E_TC();
        }else if('tc' == go_order_div){//吐槽
            F_E_TC_BACK();
        }else if ('Q' == go_order_div) { //全文
            QW_BACK();
            SH_BACK();
        } else if ('XX' == go_order_div) { //星星评分
            F_E_CANEL_F();
        } else if ('dx' == 'dx') { //电信推荐位进来按返回，弹出挽留
      if(_playtimer){clearInterval(_playtimer)}
       window.frames["smallWidow"].F_M_10();
            <%
        		String text="";
	        	if(perv_count==0){
	        		if("".equals(back)||!"".equals(from)){
	        			if(!"".equals(from)){
	        				text="Utility.setValueByName(\"exitIptvApp\");";//卓影页面进来的，直接退出
	        			}else{
		        			text="window.location.href = \"list.jsp?programType="+programType+pervUrl+"\";";
	        			}
	        		}else{
	        		    text="window.location.href = \""+back+".jsp?programType="+programType+pervUrl+"\";";
	        		}
	        	}else if(RequestUtil.getInt("dinggou", request)==1){
	        		text="window.location.href = \"list.jsp?programType="+programType+pervUrl+"\";";
	        	}else{
	        		text="window.history.go(-1)";
	        	}
        	%>
            <%=text%>
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
        } else if ('dx' == 'dx') { //电信推荐位进来按返回，弹出挽留
            window.location.href = "list.jsp?programType=<%=programType%>";
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
    /***************相关推荐***************/
    function _H_F(_id) { //旧的焦点去除选中样式，新的焦点添加选中样式
        if (_BS[focus_id] != undefined && _BS[_id] != undefined && _SELECT(focus_id) != undefined && _SELECT(_id) !=
            undefined) {
            if (_id.indexOf('bt_f') >= 0) { //推荐的列表
                var _p_div = _id.replace('bt', 'div');
                if (_SELECT(_p_div).style.display == 'none') {
                    return;
                }
            }

            _SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['blurImage'];
            next_id = _id;
            DOBUTTONBLURFUN(focus_id);

            if (focus_id.indexOf('bt_f') >= 0) {
                var show_id = focus_id.replace('f', 's'); //推荐的列表图
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
                }
                if (focus_id.indexOf('bt_f') >= 0) {
                    _TF('DIV_F', 1.1);
                    var show_id = focus_id.replace('f', 's');
                    var jb_id = focus_id.replace('f', 'jb');
                    _TF(show_id, 1.1);
                    _FD(jb_id, 1.3, 1.4);
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
    //隐藏选集列表
    function hiddenXJ() {
        _SELECT("bt_div0").style.display = "none";
        _SELECT("bt_div1").style.display = "none";
        _SELECT("bt_div2").style.display = "none";
        _SELECT("bt_div3").style.display = "none";
        _SELECT("bt_div4").style.display = "none";
        _SELECT("bt_div5").style.display = "none";
    }

    function XJnonediv() {
        for (var i = 0; i < 20; i++) {
            _SELECT("div_vf" + i).style.display = "none";
        }
    }
    var flag_i = "bt_vf0"; //单个剧集
    var pf_d_f = 'bt_js0'; //剧集分类

    function jujiclass() {
        XJnonediv();
        i = parseInt(pf_d_f.replace('bt_js', ''));
        if (curentpage > 1) {
            var ilength = dramaSum / 20 - 6 * (curentpage - 1);
        } else {
            var ilength = dramaSum / 20;
        }

        var a = 1 + 20 * i + (120 * (curentpage - 1));
        if (i < ilength - 1) {
            var b = 20 * (i + 1) + (120 * (curentpage - 1));
        } else if (page > curentpage) {
            var b = 20 * (i + 1) + (120 * (curentpage - 1));
        } else {
            var b = dramaSum;
        }
        if (b > a) {
            len = b - a + 1;
        } else {
            len = 1;
        }

        for (var j = 0; j < len; j++) {
            if (curentpage==1&&i==0&&dramares.bcharging==1&&drama[j].bcharging ==0) {
                _SELECT("bt_jbf" + j).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-xmf.png";
            } else {
                _SELECT("bt_jbf" + j).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
            }
            _SELECT("div_vf" + j).style.display = "block";

            _SELECT("bt_pf" + j).innerHTML = a + j;
        }
    }

    function F_E_JS() { //剧集分类 focus
        i = parseInt(pf_d_f.replace('bt_js', ''));
        if (_SELECT("bt_div" + i).style.display == 'block') {
            pf_d_f = focus_id;
            flag_i = "bt_vf0";
        } else {
            _H_F(pf_d_f);
        }
        jujiclass()
    }
   
    function F_XJ_RIGHT() { //剧集分类最后一个 right
        if (page > curentpage) {
            hiddenXJ();
            var ilength = dramaSum / 20 - 6 * curentpage; //下一页的分类
            curentpage = curentpage + 1;
            if (ilength > 6) {
                _SELECT("div_arrowf").style.display = "block";
                ilength = 6;
            } else {
                _SELECT("div_arrowf").style.display = "none";
            }

            for (var i = 0; i < ilength; i++) {
                var a = 1 + 20 * i + (120 * (curentpage - 1));
                if (i < ilength - 1) {
                    var b = 20 * (i + 1) + (120 * (curentpage - 1));
                } else if (page > curentpage) {
                    var b = 20 * (i + 1) + (120 * (curentpage - 1));
                } else {
                    var b = dramaSum;
                }
                var c = a + "-" + b + "集";
                _SELECT("bt_div" + i).style.display = "block";
                _SELECT("bt_js_f" + i).innerHTML = c;
            }
            pf_d_f = "bt_js0";
            flag_i = "bt_vf0";
            _H_F("bt_js0");
        }else if(page==curentpage){
          _H_F("bt_js5");
        }
    }

    function F_XJ_LEFT() { //剧集分类第一个left
        if (curentpage > 1) {
            curentpage = curentpage - 1;
            hiddenXJ();
            for (var i = 0; i < 6; i++) {
                var a = 1 + 20 * i + (120 * (curentpage - 1));
                if (i < 5) {
                    var b = 20 * (i + 1) + (120 * (curentpage - 1));
                } else if (page > curentpage) {
                    var b = 20 * (i + 1) + (120 * (curentpage - 1));
                } else {
                    var b = dramaSum;
                }
                var c = a + "-" + b + "集";
                _SELECT("bt_div" + i).style.display = "block";
                _SELECT("bt_js_f" + i).innerHTML = c;
            }
            pf_d_f = "bt_js0";
            flag_i = "bt_vf0";
            _SELECT("div_arrowf").style.display = "block";
            setTimeout(function () {
                _H_F("bt_js0");
            }, 0)

        } else {
            _H_F("dp_01");
        }
    }

    function F_PDG7() { //单个剧集1-10集 down
        var i = parseInt(flag_i.replace("bt_vf", ""));
        if (_SELECT("div_vf" + (i + 10)).style.display == "none") {
            _H_F("bt_bplay");
        } else {
            _H_F("bt_vf" + (i + 10));
        }
    }
     function F_PDG8() { //单个剧集all right
        if (flag_i != null && "" != flag_i) {
            var i = parseInt(flag_i.replace("bt_vf", ""));
            if (_SELECT("div_vf" + (i + 1)).style.display == "block") {
                _H_F("bt_vf" + (i + 1));
            } else {
                _H_F(flag_i);
            }
        }
    }

    function F_VIDEO_PLAY(j) { //剧集enter
        if(_playtimer){clearInterval(_playtimer)}
        try {swichversion()}catch (ex) {}
        if(drama.length){
        var i = j?j:parseInt(_SELECT(focus_id.replace('bt_vf', 'bt_pf')).innerHTML);
        var iscut=(parseInt(cutdrama) == i)?0:1;
        commen_play('<%=id%>', '<%=programType%>', '<%=HttpLinkUtils.getProgramType_ZH(programType)%>', '<%=code%>','<%=cpcode%>', '<%=pervUrl%>',ordered,dramaSum,iscut,i);
        F_B_PREVWATCH()
        /*  if(parseInt(cutdrama) == i){
     window.location.href ="window.jsp?id=<%=id%>&programType=<%=programType%>&code=<%=code%>&cpcode=<%=cpcode%><%=pervUrl%>&title=" +encodeURIComponent(dramares.title + "第" + cutdrama + "集") + "&cutTime=" + (cuttime * 1000) +"&playurl=" + playjson.url + "&videoid=" + playjson.movieCode + "&dramasum=" + dramaSum + "&cutdrama=" +i;
        } else {
            $.get(webset.api + 'video/def.json?scode=' + drama[i - 1].dramaId, function (res) { //获取playurl
                var res = eval("(" + res + ")");
                if (res && res.response.responseHeader && res.response.responseHeader.code == '200') {
        window.location.href ="window.jsp?id=<%=id%>&programType=<%=programType%>&code=<%=code%>&cpcode=<%=cpcode%><%=pervUrl%>&title=" +encodeURIComponent(dramares.title + "第" + drama[i - 1].dramaNo + "集") +"&cutTime=&playurl=" + res.response.responseBody[0].url + "&videoid=" + res.response.responseBody[0].code + "&dramasum=" + dramaSum + "&cutdrama=" + i + '&iscut=1';
                }
            }, false);
        }*/
        }
    }


    //单个剧集聚焦改变flag_i
    function F_VIDEO_F() {
        flag_i = focus_id;
    }

    //单个剧集跳到剧集分类1-10 up
    function F_D_PFG() {
        _H_F(pf_d_f);
    }

    function F_PDG6() {
        _H_F(flag_i);
    }
            <%
String actors="";
titlewidth=0;
j=0;
for(SeriesStar star: starlist){
    int titlelength=HttpLinkUtils.String_length(star.getActorName());
    int width=9*titlelength+30;

    j++;
    titlewidth+=width;
    if(titlewidth>=560){
        break;
    }
    actors+="{id: 'item_guest"+(j-1)+"',upButtonId: '"+(directorStar==null?"dzl":"item_director")+"',downButtonId: 'bt_bqw',rightButtonId: 'item_guest"+(j)+"',blurFun: 'F_STAR_BLUR',focusFun: 'F_STAR_FOCUS',enterFun: 'F_TOSTARDETAIL"+(j-1)+"',focusImage: 'item_guest.png',blurImage: 'Pixel.png',leftButtonId:";
    if(j==1){
        actors+="'dp_01'},";
    }else if(j>1){
        actors+="'item_guest"+(j-2)+"'},";
    }
}
%>
        function directorENTER(){
        if(_playtimer){clearInterval(_playtimer)}
            <%
    		String txt="";
    		if(directorStar!=null){
    			txt="window.location.href=\"stardetail.jsp?id="+id+"&code="+code+"&cpcode="+cpcode+"&starId="+directorStar.getActorId()+"&programType="+programType+pervUrl+"\";";
    		}
    	%>
            <%=txt%>
        }

      var  _IS_Long=false;
    var buttons = [{
            id: 'bt_bplay', //播放
            upButtonId: 'bt_pdg6',
            downButtonId: 'totj',
            leftButtonId: 'dp_01',
            rightButtonId: 'bt_bsc',
            blurFun: 'F_B_PREVWATCH',
            focusFun: 'F_F_PREVWATCH',
            enterFun: 'F_E_PLAY',
            focusImage: 'detail-playbutton.png',
            blurImage: 'Pixel.png'
        },
            <%=actors%>
        {
            id: 'bt_js0',
            upButtonId: 'bt_bqw',
            downButtonId: 'bt_pdg6',
            leftButtonId: 'bt_pdg4',
            rightButtonId: 'bt_js1',
            blurFun: '',
            focusFun: 'F_E_JS',
            enterFun: '',
            focusImage: 'detailtv-js-f.png',
            blurImage: 'detailtv-js-b.png'
        },
        {
            id: 'bt_js1',
            upButtonId: 'bt_bqw',
            downButtonId: 'bt_pdg6',
            leftButtonId: 'bt_js0',
            rightButtonId: 'bt_js2',
            blurFun: '',
            focusFun: 'F_E_JS',
            enterFun: '',
            focusImage: 'detailtv-js-f.png',
            blurImage: 'detailtv-js-b.png'
        },
        {
            id: 'bt_js2',
            upButtonId: 'bt_bqw',
            downButtonId: 'bt_pdg6',
            leftButtonId: 'bt_js1',
            rightButtonId: 'bt_js3',
            blurFun: '',
            focusFun: 'F_E_JS',
            enterFun: '',
            focusImage: 'detailtv-js-f.png',
            blurImage: 'detailtv-js-b.png'
        },
        {
            id: 'bt_js3',
            upButtonId: 'bt_bqw',
            downButtonId: 'bt_pdg6',
            leftButtonId: 'bt_js2',
            rightButtonId: 'bt_js4',
            blurFun: '',
            focusFun: 'F_E_JS',
            enterFun: '',
            focusImage: 'detailtv-js-f.png',
            blurImage: 'detailtv-js-b.png'
        },
        {
            id: 'bt_js4',
            upButtonId: 'bt_bqw',
            downButtonId: 'bt_pdg6',
            leftButtonId: 'bt_js3',
            rightButtonId: 'bt_js5',
            blurFun: '',
            focusFun: 'F_E_JS',
            enterFun: '',
            focusImage: 'detailtv-js-f.png',
            blurImage: 'detailtv-js-b.png'
        },
        {
            id: 'bt_js5',
            upButtonId: 'bt_bqw',
            downButtonId: 'bt_pdg6',
            leftButtonId: 'bt_js4',
            rightButtonId: 'bt_pdg3',
            blurFun: '',
            focusFun: 'F_E_JS',
            enterFun: '',
            focusImage: 'detailtv-js-f.png',
            blurImage: 'detailtv-js-b.png'
        },
        {
            id: 'bt_pdg2', //单个剧集1-10集跳到剧集分类 up
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_D_PFG',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_pdg3', //剧集分类最后一个 right
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_XJ_RIGHT',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_pdg4', //剧集分类第一个left
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_XJ_LEFT',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_pdg5',
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: 'bt_pdg5',
            blurFun: '',
            focusFun: 'F_CHECKXJ',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_pdg6',
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_PDG6',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_pdg7', //单个剧集1-10集down
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_PDG7',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_pdg8', //单个剧集all right
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_PDG8',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf0',
            upButtonId: 'bt_pdg2',
            downButtonId: 'bt_pdg7',
            leftButtonId: 'dp_01',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF0
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf1',
            upButtonId: 'bt_pdg2',
            downButtonId: 'bt_pdg7',
            leftButtonId: 'bt_vf0',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF1
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf2',
            upButtonId: 'bt_pdg2',
            downButtonId: 'bt_pdg7',
            leftButtonId: 'bt_vf1',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF2
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf3',
            upButtonId: 'bt_pdg2',
            downButtonId: 'bt_pdg7',
            leftButtonId: 'bt_vf2',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF3
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf4',
            upButtonId: 'bt_pdg2',
            downButtonId: 'bt_pdg7',
            leftButtonId: 'bt_vf3',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF4
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf5',
            upButtonId: 'bt_pdg2',
            downButtonId: 'bt_pdg7',
            leftButtonId: 'bt_vf4',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF5
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf6',
            upButtonId: 'bt_pdg2',
            downButtonId: 'bt_pdg7',
            leftButtonId: 'bt_vf5',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF6
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf7',
            upButtonId: 'bt_pdg2',
            downButtonId: 'bt_pdg7',
            leftButtonId: 'bt_vf6',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF7
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf8',
            upButtonId: 'bt_pdg2',
            downButtonId: 'bt_pdg7',
            leftButtonId: 'bt_vf7',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF8
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf9',
            upButtonId: 'bt_pdg2',
            downButtonId: 'bt_pdg7',
            leftButtonId: 'bt_vf8',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF9
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf10',
            upButtonId: 'bt_vf0',
            downButtonId: 'bt_bplay',
            leftButtonId: 'dp_01',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF10
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf11',
            upButtonId: 'bt_vf1',
            downButtonId: 'bt_bplay',
            leftButtonId: 'bt_vf10',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF11
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf12',
            upButtonId: 'bt_vf2',
            downButtonId: 'bt_bplay',
            leftButtonId: 'bt_vf11',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF12
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf13',
            upButtonId: 'bt_vf3',
            downButtonId: 'bt_bplay',
            leftButtonId: 'bt_vf12',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF13
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf14',
            upButtonId: 'bt_vf4',
            downButtonId: 'bt_bplay',
            leftButtonId: 'bt_vf13',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF14
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf15',
            upButtonId: 'bt_vf5',
            downButtonId: 'bt_bplay',
            leftButtonId: 'bt_vf14',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF15
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf16',
            upButtonId: 'bt_vf6',
            downButtonId: 'bt_bplay',
            leftButtonId: 'bt_vf15',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF16
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf17',
            upButtonId: 'bt_vf7',
            downButtonId: 'bt_bplay',
            leftButtonId: 'bt_vf16',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF17
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_vf18',
            upButtonId: 'bt_vf8',
            downButtonId: 'bt_bplay',
            leftButtonId: 'bt_vf17',
            rightButtonId: 'bt_pdg8',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF18
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_vf19',
            upButtonId: 'bt_vf9',
            downButtonId: 'bt_bplay',
            leftButtonId: 'bt_vf18',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_VIDEO_F',
            enterFun: 'F_VIDEO_PLAY', //F_E_VF19
            focusImage: 'detailtv-dra-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_bqw', //全文
            upButtonId: '<%=starlist.size()>0?"item_guest0":(directorStar!=null)?"item_director":"dzl"%>',
            downButtonId: 'bt_pdg2',
            leftButtonId: 'dp_01',
            rightButtonId: '',
            blurFun: '',
            focusFun: '',
            enterFun: 'F_E_PYY',
            focusImage: 'detail-qw-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f0',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'toleftpageend17',
            rightButtonId: 'bt_f1',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_buy', //订购
            upButtonId: 'bt_bqw',
            downButtonId: 'totj',
            leftButtonId: 'bt_bplay',
            rightButtonId: 'bt_bsc',
            blurFun: '',
            focusFun: '',
            enterFun: 'orderenter',
            focusImage: 'detail-playbutton.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_bsc', //收藏
            upButtonId: 'bt_pdg6',
            downButtonId: 'totj',
            leftButtonId: 'bt_bplay',
            rightButtonId: 'bt_gd',
//			rightButtonId: '',
            blurFun: '',
            focusFun: '',
            enterFun: 'F_E_SC',
            focusImage: 'detail-playbutton.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_gd', //广告
            upButtonId: 'bt_pdg6',
            downButtonId: 'totj',
            leftButtonId: 'bt_bsc',
            rightButtonId: '',
            blurFun: '',
            focusFun: '',
            enterFun: 'F_E_GD',
            focusImage: 'detail-playbutton.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'toleftpageend17', //推荐列表bt_f0跳到bt_f17
            upButtonId: '',
            downButtonId: '',
            leftButtonId: 'bt_f17',
            //rightButtonId:'bt_f1',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_TOLEFTPAGEEND',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f1',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f0',
            rightButtonId: 'bt_f2',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f2',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f1',
            rightButtonId: 'bt_f3',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f3',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f2',
            rightButtonId: 'bt_f4',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f4',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f3',
            rightButtonId: 'bt_f5',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f5',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f4',
            rightButtonId: 'torightpage5',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'torightpage5', //bt_f5向右边点击跳到bt_f6
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
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'toleftpage6',
            rightButtonId: 'bt_f7',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'toleftpage6', //bt_f6向左跳到bt_f5
            upButtonId: '',
            downButtonId: '',
            leftButtonId: 'bt_f5',
            //rightButtonId:'bt_f7',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_TOLEFTPAGE',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f7',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f6',
            rightButtonId: 'bt_f8',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f8',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f7',
            rightButtonId: 'bt_f9',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f9',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f8',
            rightButtonId: 'bt_f10',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f10',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f9',
            rightButtonId: 'bt_f11',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f11',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f10',
            rightButtonId: 'torightpage11',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'torightpage11', //bt_f11向右边点击跳到bt_f12
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: 'bt_f12',
            blurFun: '',
            focusFun: 'F_TORIGHTPAGE',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f12',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'toleftpage12',
            rightButtonId: 'bt_f13',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'toleftpage12', ////bt_f12向左跳到bt_f11
            upButtonId: '',
            downButtonId: '',
            leftButtonId: 'bt_f11',
            //rightButtonId:'bt_f13',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_TOLEFTPAGE',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f13',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f12',
            rightButtonId: 'bt_f14',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f14',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f13',
            rightButtonId: 'bt_f15',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },


        {
            id: 'bt_f15',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f14',
            rightButtonId: 'bt_f16',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_f16',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f15',
            rightButtonId: 'bt_f17',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f17',
            upButtonId: 'bt_bplay',
            downButtonId: '',
            leftButtonId: 'bt_f16',
            rightButtonId: 'torightpageend17',
            blurFun: 'F_E_IVBLUR',
            focusFun: 'F_E_IFOCUS',
            enterFun: 'F_TODETAIL',
            focusImage: 'detail-iti-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'torightpageend17', //bt_17像右边点击跳到bt_f0
            upButtonId: '',
            downButtonId: '',
            //leftButtonId:'bt_f16',
            leftButtonId: '',
            rightButtonId: 'bt_f0',
            blurFun: '',
            focusFun: 'F_TORIGHTPAGEEND',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'totj',
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_TOTJ',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_border', //what,不存在
            upButtonId: 'bt_bqw',
            downButtonId: 'bt_f0',
            leftButtonId: 'bt_bplay',
            rightButtonId: 'bt_bsc',
            blurFun: '',
            focusFun: '',
            enterFun: 'GOORDER',
            focusImage: 'detail-playbutton.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'dp_01', //video
            upButtonId: '',
            downButtonId: 'bt_f0',
            leftButtonId: '',
            rightButtonId: 'bt_vf0',
            blurFun: '',
            focusFun: '',
            enterFun: 'F_E_PLAY',
            focusImage: 'detail-smwindow-f.png',
            blurImage: 'Pixel.png'
        },
        {
        id: 'item_director',
        upButtonId: 'dzl',downButtonId: 'item_guest0',rightButtonId: '',leftButtonId:'dp_01',
        blurFun: 'F_STAR_BLUR',focusFun: 'F_STAR_FOCUS',enterFun: 'directorENTER',
        focusImage: 'item_guest.png',blurImage: 'Pixel.png'
        },

        {
            id: 'score', //评分
            upButtonId: '',
            downButtonId: '<%=directorStar==null?(starlist.size()==0?"bt_pdg":"item_guest0"):"item_director"%>',
            leftButtonId: 'dp_01',
            rightButtonId: 'dzl',
            blurFun: 'F_SCORE_BLUR', //
            focusFun: 'F_SCORE_H', //光标选中，已评出现
            enterFun: 'F_E_SCORE',
            focusImage: 'detail-zanbg-f.png',
            blurImage: 'Pixel.png'
        },
        {
        id: 'dzl', //点赞
        upButtonId: '',
        downButtonId:  '<%=directorStar==null?(starlist.size()==0?"bt_bqw":"item_guest0"):"item_director"%>',
        leftButtonId: 'score',
        rightButtonId: 'share',
        blurFun: 'F_ZAN_D', //失去光标，已赞消失
        focusFun: 'F_ZAN_H', //光标选中，已赞出现
        enterFun: 'F_E_POINT',
        focusImage: 'detail-zanbg-f.png',
        blurImage: 'Pixel.png'
        },
        {
	        id: 'share', //分享
	        upButtonId: '',
	        downButtonId: '<%=directorStar==null?(starlist.size()==0?"bt_pdg":"item_guest0"):"item_director"%>',
	        leftButtonId: 'dzl',
	        rightButtonId: 'tc',
	        blurFun: 'F_SHARE_BLUR', //
	        focusFun: 'F_SHARE_H', //光标选中，已评出现
	        enterFun: 'F_E_SHARE',
	        focusImage: 'detail-zanbg-f.png',
	        blurImage: 'Pixel.png'
        },
        {
            id: 'tc', //吐槽
            upButtonId: '',
            downButtonId: '<%=starlist.size()==0?"bt_bqw":"item_guest0"%>',
            leftButtonId: 'share',
            rightButtonId: '',
            blurFun: 'F_TC_BLUR', 
            focusFun: 'F_TC_H',
            enterFun: 'F_E_TC',
			focusImage: 'detail-zanbg-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'check1', //吐槽选中1
            upButtonId: '',
            downButtonId: 'check2',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: 'F_TC_BLUR1', 
            focusFun: 'F_TC_C1', 
            enterFun: 'F_E_TC1',
			focusImage: 'detail-tc-hand2.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'check2', //吐槽选中2
            upButtonId: 'check1',
            downButtonId: 'check3',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: 'F_TC_BLUR2', //
            focusFun: 'F_TC_C2', 
            enterFun: 'F_E_TC2',
			focusImage: 'detail-tc-hand2.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'check3', //吐槽选中3
            upButtonId: 'check2',
            downButtonId: 'tc_sub',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: 'F_TC_BLUR3', //
            focusFun: 'F_TC_C3',
            enterFun: 'F_E_TC3',
			focusImage: 'detail-tc-hand2.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'tc_sub', //吐槽提交
            upButtonId: 'check3',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: 'tc_back',
            blurFun: 'F_TC_BLUR_SUB', //
            focusFun: 'F_TC_SUB', 
            enterFun: 'F_E_TC_SUB',
			focusImage: 'detail-tc-sub6.png',
            blurImage: 'detail-tc-sub-f6.png'
        },
        {
            id: 'tc_back', //吐槽返回
            upButtonId: 'check3',
            downButtonId: '',
            leftButtonId: 'tc_sub',
            rightButtonId: '',
            blurFun: 'F_TC_BLUR_BACK', //
            focusFun: 'F_TC_BACK', 
            enterFun: 'F_E_TC_BACK',
			focusImage: 'detail-tc-back-f6.png',
            blurImage: 'detail-tc-back6.png'
        },
        {
            id: 'tc_feedSuccess', 
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '', 
            focusFun: '',
            enterFun: 'F_E_TC_SUCCESS',
			focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'tc_feedFail', 
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '', 
            focusFun: '',
            enterFun: 'F_E_TC_FAIL',
			focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'xx_sure', //评分确定 注释中
            upButtonId: 'bt_xx',
            downButtonId: 'qw_01',
            leftButtonId: '',
            rightButtonId: 'xx_canel',
            blurFun: '',
            focusFun: '',
            enterFun: 'F_E_SURE',
            focusImage: 'sure_canel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'xx_canel', //评分取消 注释中
            upButtonId: 'bt_xx',
            downButtonId: 'qw_01',
            leftButtonId: 'xx_sure',
            rightButtonId: '',
            blurFun: '',
            focusFun: '',
            enterFun: 'F_E_CANEL_F',
            focusImage: 'sure_canel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_xl', //what
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_J_XX', //减星星的方法
            enterFun: 'F_E_SURE',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_xx', //点击评分显示出来星星
            upButtonId: 'score',
            downButtonId: 'xx_sure',
            leftButtonId: 'bt_xl',
            rightButtonId: 'bt_xr',
            blurFun: 'F_STAR_B',
            focusFun: 'F_STAR_F',
            enterFun: 'F_E_SURE',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_xr', //what
            upButtonId: '',
            downButtonId: '',
            leftButtonId: 'bt_xx',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_JIA_XX', //加星星的方法
            enterFun: 'F_E_SURE',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_pdg', //好像也是返回
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
        {
            id: 'bt_bhf', //返回  没看见图上有返回按钮
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: '',
            enterFun: 'QW_BACK',
            focusImage: 'detail-zanbg-f.png',
            blurImage: 'detail-zanbg-f.png'
        },
        {
            id: 'bt_bhs', //返回  没看见图上有返回按钮
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: '',
            enterFun: 'SH_BACK',
            focusImage: 'detail-zanbg-f.png',
            blurImage: 'detail-zanbg-f.png'
        }

    ]
    var next_id = '';
    var backUrl = '';
    //////////////////////////小视频开始
    var smallWidowItemId = '';



    function F_KEY_M_7() {
        eval("oEvent = " + Utility.getEvent());
        switch (oEvent.type) {
            case 'EVENT_MEDIA_ERROR':
            case 'EVENT_MEDIA_END':

                return;
            default:
                return 1;
        }
    }

    function F_KEY_M_0() { //音量加
        window.frames["smallWidow"].F_M_0('+');
    }

    function F_KEY_M_1() { //音量减
        window.frames["smallWidow"].F_M_0('-');
    }
    //////////////////////////小视频结束
        var _playtimer;
    function F_E_PLAY() { //播放enter
        if(_playtimer){clearInterval(_playtimer)}
        try {swichversion()}catch (ex) {}
        commen_play('<%=id%>', '<%=programType%>', '<%=HttpLinkUtils.getProgramType_ZH(programType)%>','<%=code%>', '<%=cpcode%>','<%=pervUrl%>',ordered,dramaSum);
        F_B_PREVWATCH()
        
    }


        function playtishi(drama) {
        if(focus_id=='bt_bplay'){
        visibleDiv('div_prevWatch');
        }
        _SELECT("div_prevWatch").innerHTML ="<div id='div_watchPosition' style='position:absolute;left:13px;top:8px; width:258px; height:55px; line-height:35px; text-align:center; font-size:20px; font-weight:600; color:#ffffff; overflow:hidden; margin:0; padding:0;'>您上次观看到第" +drama + "集</div>";
    }

    var playjson;

    function F_F_PREVWATCH() { //播放focus获取播放到哪了
        if (!playjson) {
            if (cutdrama) {
                playtishi(cutdrama)
            }
            var volumnCount = cutdrama ? cutdrama : '';
            var url = webset.api + "video/getSeriesBySeriesCode.json?code=<%=code%>&cp=<%=cpcode%>&volumnCount=" +
                volumnCount + "&userId=" + userId;
            $.get(url, function (res) {
                var res = eval("(" + res + ")");
                if (res && res.response.responseHeader && res.response.responseHeader.code == '200') {
                    playjson = res.response.responseBody;
                       if(playjson.seriesBcharging==1){
                          hasorder()
                        }else if(_HAS_GD){
                            _SELECT('gd_box').style.left='840px';
                            _SELECT('gd_box').style.display='block';
                        }
                    _SELECT('isfree').src = playjson.seriesBcharging == 1 ? "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png" : "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png"
                    if (!cutdrama) {
                        cuttime = playjson.cutTime ? parseInt(playjson.cutTime) : 0;
                        if (!(playjson.volumncount == 1 && !cuttime)) {
                            playtishi(playjson.volumncount)
                        }
                    }
                    cutdrama = parseInt(playjson.volumncount);
                    _SELECT("smallWidow").src = "smallwindow.jsp?cutTime=" + cuttime + "&playurl=" +
                        encodeURIComponent(playjson.url) + '&seriesBcharging=' + playjson.seriesBcharging+'&ordered='+ordered+'&cutdrama='+cutdrama+'&programType=<%=programType%>';
                }else{hasorder()}
            }, true);
        } else if (_SELECT("div_prevWatch").innerHTML != '') {
            visibleDiv('div_prevWatch');
        }
    }

    function F_B_PREVWATCH() { //播放blur
        hiddenDiv('div_prevWatch');
    }





    var collect_flag = '0';

    function F_E_SC(flag,str) { //收藏enter
        if(flag&&(str!=collect_flag)){
        return;
        }
        var title = collect_flag == '1' ? '0' : '1';
        $.get(webset.api + 'user/usersearch.json?userId=' + userId + '&combineid=<%=id%>&type=collect&title=' + title,
            function (res) {
                var res = eval("(" + res + ")");
                if (res && res.response.responseHeader && res.response.responseHeader.code == '200') {
                    _SELECT('sc_img').src = title == '1' ? "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-collected.png" :
                        "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-collect.png";
                    collect_flag = title;
                    _SELECT('collect').src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tip-collect" + title + ".png";
                    setTimeout(COLLECTSEC, 3000)
                }
            }, false);
    }


    function COLLECTSEC() {
        _SELECT('collect').src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
    }





    var go_order_div = "N";
    //全文点击事件
    function F_E_PYY() { //全文enter
        clearTimeout(order_setime);
        go_order_div = 'Q';
        visibleDiv("qw_memo");
        _H_F('bt_bhf'); //让返回按钮获得焦点
    }

   var sharestr='http://itv.live.jisu8.cn:28080/uic/anhui/playShare/#/vodPlay?mediaId=Vstartek<%=id%>&columnId='+cjson['<%=programType%>']+'&serial=1&userId='+userId+'&from='+uptype;

   function F_E_SHARE(){//分享
        go_order_div = 'Q';
        _SELECT("share-er").src = serverBaseStatic+"itv-epg-api/api/v1/ad/image.json?content="+encodeURIComponent(sharestr);
        visibleDiv("share_memo");
        _H_F('bt_bhs');
    }

    function QW_BACK() { //返回enter
        go_order_div = 'N';
        _H_F('bt_bqw');
        hiddenDiv("qw_memo");
    }

    function SH_BACK(){
        go_order_div = 'N';
        _H_F('share');
        hiddenDiv("share_memo");
     }



    function GOORDER() {
        //	GO_ORDERJSP('voole','5204284');
        var _item_name = '哈利波特与魔法石';
        _item_name = encodeURIComponent(encodeURIComponent(_item_name));
        GO_ORDERJSP('voole', '4136', _item_name);
    }

     function F_E_POINT() { //点赞 enter
        if (flag_zan == 0) {
            $.get(webset.api + 'user/userscore.json?userId=' + userId + '&combineid=<%=id%>&type=point&score=0',
                function (res) {
                    var res = eval("(" + res + ")");
                    if (res && res.response.responseHeader && res.response.responseHeader.code == '200') {
                        var item_like = _SELECT("item_like").innerHTML;
                        var likes = parseInt(item_like) + 1;
                        _SELECT("item_like").innerHTML = likes;
                        _SELECT("zan").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-zan-f.png";
                        _SELECT("dzl_finish").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-icon-iszan.png"
                        flag_zan = 1;
                    }
                }, false);
        }

    }

    var flag_zan = 0; //是否点赞
    function F_ZAN_H() { //点赞 focus
        if (flag_zan != 0) {
            _SELECT("dzl_finish").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-icon-iszan.png"
        }
    }
        var flag_share = 0;
    function F_SHARE_H() { //是否分享
        if (flag_share != 0) {
        _SELECT("share_finish").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-icon-iszan.png"
        }
    }

    function F_ZAN_D() {
        _SELECT("dzl_finish").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
    }
    function  F_SHARE_BLUR() {
        _SELECT("share_finish").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
     }
    
    //吐槽focus
    function F_TC_H(){
//      	_SELECT("tc_img").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-f2.png"
    }
    //吐槽enter事件
    var tcstr = "http://proposal.info.zy.lv1.vcache.cn:8081/platform/#/?itvId="+userId+"&stbVersion="+stbModel+"&programCode=<%=seriesDetail.getId()%>&programName=<%=URLEncoder.encode(seriesDetail.getTitle(),"utf-8")%>&programGenre=<%=URLEncoder.encode(HttpLinkUtils.getProgramType_ZH(programType),"utf-8")%>"
//      var tcstr = "http://117.71.47.125:8081/platform/#/?itvId="+userId+"&stbVersion="+stbModel+"&programCode="++"&programName="++"&programGenre="+;
    function F_E_TC(){
//  	if(hasTC)return;
    	go_order_div = "tc"
        _SELECT("tc_block").style.visibility = "visible";
        _SELECT("tc_qr").src = serverBaseStatic+"itv-epg-api/api/v1/ad/image.json?content="+encodeURIComponent(tcstr);
        _H_F('check1');
//      _SELECT("checked1").style.visibility = "visible";
    }
    //吐槽 blur
    function F_TC_BLUR(){
//      	_SELECT("tc").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc2.png"
    }
    //吐槽blur123
    function F_TC_BLUR1(){
    	_SELECT("check1").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"
    }
    function F_TC_BLUR2(){
    	_SELECT("check2").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"
    }
    function F_TC_BLUR3(){
    	_SELECT("check3").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"
    }
    //吐槽1focus/
    function F_TC_C1(){
    	_SELECT("check1").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-hand2.png"
    }
    function F_TC_C2(){
    	console.log("tc2")
    	_SELECT("check2").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-hand2.png"
    }
    function F_TC_C3(){
    	console.log("tc3")
    	_SELECT("check3").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-hand2.png"
    }
    //吐槽enter123
    function F_E_TC1(){
    	var che1 = _SELECT("checked1");
    	if (che1.style.visibility == "hidden") {
            che1.style.visibility = "visible";           
			_SELECT("checked2").style.visibility = 'hidden';
			_SELECT("checked3").style.visibility = 'hidden';
        }else{
         	che1.style.visibility = "hidden";
            console.log("处理选中提交的参数")
        }
    }
    function F_E_TC2(){
    	var che1 = _SELECT("checked2");
    	if (che1.style.visibility == "hidden") {
            che1.style.visibility = "visible";
            _SELECT("checked1").style.visibility = 'hidden';
			_SELECT("checked3").style.visibility = 'hidden';
        }else{
         	che1.style.visibility = "hidden";
        }
    }
    function F_E_TC3(){
    	var che1 = _SELECT("checked3");
    	if (che1.style.visibility == "hidden") {
            che1.style.visibility = "visible";
            _SELECT("checked1").style.visibility = 'hidden';
			_SELECT("checked2").style.visibility = 'hidden';
        }else{
         	che1.style.visibility = "hidden";
        }
    }
    function hideCheck(){
    	_SELECT("checked1").style.visibility = 'hidden';
    	_SELECT("checked2").style.visibility = 'hidden';
    	_SELECT("checked3").style.visibility = 'hidden';
    }
    //吐槽按钮
    var hasTC = false;
    function F_E_TC_SUB(){
//  	if(hasTC)return;
    	var checkInfo = [];
    	if(_SELECT("checked1").style.visibility=='visible'){
    		checkInfo.push('40')
    	}
    	if(_SELECT("checked2").style.visibility=='visible'){
    		checkInfo.push('41')
    	}
    	if(_SELECT("checked3").style.visibility=='visible'){
    		checkInfo.push('42')
    	}       	
    	var classifyId = checkInfo.join(';');//目前只做单选
    	if(!classifyId){
    		go_order_div = 'tc-faild';
    		_H_F("tc_feedFail");
			_SELECT("tc_feedFail").style.visibility = "visible"; //没有选中的时候
			return
		}
		F_E_TC_BACK();
		var url = webset.api+"ad/submitFeedback.json?itvId="+userId+"&stbVersion="+stbModel+"&classifyId="+classifyId+"&programCode=<%=seriesDetail.getId()%>&programName=<%=seriesDetail.getTitle()%>&programGenre=<%=HttpLinkUtils.getProgramType_ZH(programType)%>";
    	$.get(url, function (res) {
            var res = eval("(" + res + ")");
			hasTC = true;
			_SELECT("tc_img").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-f2.png"
        	_SELECT("tc_feedSuccess").style.visibility = "visible";//反馈成功显示
        	_SELECT("IMG_F").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
        	_H_F('tc_feedSuccess');
			go_order_div = 'tc-success';
    	}, true);
    }
    function F_E_TC_BACK(){
    	hideCheck();
    	var BL = _SELECT("tc_block");
    	BL.style.visibility = "hidden"; 
        _H_F('tc');
        go_order_div = "N";
    }
    //吐槽按钮 focus/blur
    function F_TC_SUB(){
    	_SELECT("tc_sub").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-sub-f6.png"
    }
    function F_TC_BLUR_SUB(){
    	_SELECT("tc_sub").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-sub6.png"
    }
    function F_TC_BACK(){
    	_SELECT("tc_back").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-back-f6.png"
    }
    function F_TC_BLUR_BACK(){
    	_SELECT("tc_back").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-tc-back6.png"
    }
    
    //两个提示窗的enter事件
    function F_E_TC_SUCCESS(){
    	_SELECT("tc_feedSuccess").style.visibility = "hidden";
       	_H_F('tc');
       	go_order_div = 'N'
    }
    
    function F_E_TC_FAIL(){
    	_SELECT("tc_feedFail").style.visibility = "hidden";
   	    _H_F('tc');
   	    F_E_TC();
    }

    //评分
    var divall_flag = 0; //是否已经评分
    function F_E_SCORE() { //评分 enter
        if (flag_score == 0) {
            if (divall_flag == 0) {
                var DIV = _SELECT("score_all");
                if (DIV.style.visibility == "hidden") {
                    DIV.style.visibility = "visible";
                    go_order_div = "XX"; //what
                    _SELECT("score").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                    _H_F("bt_xx");
                }
            }
        }
    }

    function F_E_CANEL_F() { //取消评分
        var DIV = _SELECT("score_all");
        if (DIV.style.visibility == "visible") {
            DIV.style.visibility = "hidden";
            go_order_div = "N";
        }

        focus_id = "score";
        var Path = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png';
        if (_SELECT("score").src == Path) {
            _SELECT("score").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-zanbg-f.png";
        }
    }

    function F_SCORE_H() { //评分 focus
        if (flag_score == 1) { //已评分
            _SELECT("score_finish").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-icon-isscore.png"
        }
    }

    function F_SCORE_BLUR() { //评分 blur
        var DIV = _SELECT("score_all");
        if (next_id != "bt_xx" && next_id != "bt_pdg" && DIV.style.visibility == "visible") {
            DIV.style.visibility = "hidden";
            go_order_div = "N";
        }
        _SELECT("score").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
        _SELECT("score_finish").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
    }
    var star = 9;

    function F_J_XX() { //减星星的方法
        if (star <= 1) {
            star = 1;
        } else {
            star = star - 1;
        }
        
        decreaseStar(star);
        focus_id = 'bt_xx';
    }

    function F_JIA_XX() { //加星星的方法
        if (star >= 10) {
            star = 10;
        } else {
            star = star + 1;
        }
        increaseStar(star);
        focus_id = 'bt_xx';
    }

    function F_STAR_F() { //点击评分
        focusStar(star);
    }
    var flag_score = 0; //是否已评分
    function F_E_SURE() { //确定评分
        $.get(webset.api + 'user/userscore.json?userId=' + userId + '&combineid=<%=id%>&type=score&score=' + star,
            function (res) {
                var res = eval("(" + res + ")");
                if (res && res.response.responseHeader && res.response.responseHeader.code == '200') {
                    _SELECT("pf").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-score-f.png";
                    _SELECT("score_finish").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-icon-isscore.png";
                    if ((_SELECT("b_score").innerHTML == '0') || (_SELECT("b_score").innerHTML == '0.0')) {
                        getScore(star)
                    }
                        flag_score = 1;
                }
                var DIV = _SELECT("score_all");
                if (DIV.style.visibility == "visible") {
                    DIV.style.visibility = "hidden";
                    go_order_div = "N";
                }
                divall_flag = 1;
            }, true);
        _H_F("score");
    }

    function F_STAR_B() { //星星失去焦点
        blurStar();
    }





    function F_F_PFG() { //当前焦点在评分时，按下键判断下个焦点是星星还是全文
        var DIV = _SELECT("score_all");
        if (DIV.style.visibility == "visible") {
            _H_F("bt_xx");
        } else if (DIV.style.visibility == "hidden") {
            _H_F("bt_bqw");
        }
    }

    var order_setime;



    var page, dramaSum = 0,
        curentpage = 1,
        drama=[], dramares;

    function getDrama() {
        $.get(webset.api + 'video/drama.json?userid=' + userId + '&code=<%=code%>&cpCode=<%=cpcode%>', function (res) {
            var res = eval("(" + res + ")");
            if (res.response && res.response.responseHeader.code == 200) {
                dramares = res.response.responseBody;
                drama = res.response.responseBody.dramas;
                dramaSum = parseInt(res.response.responseBody.dramaCount);
                if (dramaSum / 120 > parseInt(dramaSum / 120)) {
                    page = parseInt(dramaSum / 120) + 1;
                } else {
                    page = parseInt(dramaSum / 120);
                }
                var ilength = dramaSum / 20;
                if (ilength > 6) {
                    _SELECT("div_arrowf").style.display = "block";
                    ilength = 6;
                }
                for (var i = 0; i < ilength; i++) {
                    var a = 1 + 20 * i
                    if (i < ilength - 1) { //不是最后一个
                        var b = 20 * (i + 1)
                    } else {
                       if(dramaSum>20 * (i + 1)){
                          var b = 20 * (i + 1)
                         }else{
                           var b = dramaSum;
                         }
                    }
                    _SELECT("bt_div" + i).style.display = "block";
                    _SELECT("bt_js_f" + i).innerHTML = a + "-" + b + "集";
                }
                jujiclass()
            }
        }, true);
    }


        function hasorder(){
            HAS_ORDER(userId, '<%=id%>', '<%=programType%>', '<%=seriesDetail.getTitle() %>',false,function(orderes){
                if (orderes.ordered == 1){ //鉴权成功
                    _BS['bt_bplay']['rightButtonId'] = 'bt_bsc';
                    _BS['bt_bsc']['leftButtonId'] = 'bt_bplay';
                    ordered =1;
                    _SELECT('ordered').style.display = "none";
                    _SELECT('coll').style.left = '714px';
                   _SELECT('gd_box').style.left='840px';
                }else{
                    _BS['bt_bplay']['rightButtonId'] = 'bt_buy';
                    _BS['bt_bsc']['leftButtonId'] = 'bt_buy';
                    ordered =0;
                    _SELECT('ordered').style.display = "block";
                    _SELECT('coll').style.left = '840px';
                }
                 _SELECT('gd_box').style.display='block';
          });
        }

        function orderenter() {
            var attemptUrl=CREATE_ORDER(userId,'<%=id%>', '<%=programType%>', '<%=seriesDetail.getTitle() %>', '<%=cpcode%>');
            if (attemptUrl) {
            window.location.href = 'http://61.191.45.118:7002/itv-api/initial_order?returnUrl=' +
            encodeURIComponent(window.location.href+"&dinggou=1") + '&providerId=' + attemptUrl.providerId +
            '&orderInfo=' + attemptUrl.orderInfo + '&notifyUrl=' + attemptUrl.notifyUrl;
            }
        }




    var cutdrama='', cuttime = 0,tongyi;

        function countplaycallback(tongyi){
              console.log('tongyi',tongyi)
            if (tongyi.userId){
                if((tongyi.dramacount&&(cutdrama!=parseInt(tongyi.dramacount)))||(tongyi.cuttime&&(cuttime!=parseInt(tongyi.cuttime)))||!tongyi.cuttime){
//                     if(_playtimer){clearInterval(_playtimer)}
                    cuttime = tongyi.cuttime?parseInt(tongyi.cuttime):0;
                    cutdrama=parseInt(tongyi.dramacount);
                    playjson='';
                    F_F_PREVWATCH()
                }
            }
        }

        function countplay(){
           CACHE_PLAY_TIME(userId, '<%=code%>',countplaycallback)
        }


        function initdatas(){
        checkedScoreAndZan();
        getDrama();
        getTJList();
        getItemCategory();
        getDirector();
        getItemGuest();
        init();
        FYY();
    }

    function getItemCategory() { //类型处理
        var itemcategory = new Array();
        var item_category = "<%=RequestUtil.replaceNull(seriesDetail.getTag())%>";
        if (item_category != "") {
            if (item_category.indexOf("/") >= 0) { //,至少有一个
                itemcategory = item_category.split("/"); //字符分割
            }
            if (itemcategory.length > 0) {
                var newcategory = itemcategory[0];
                var len = itemcategory.length > 3 ? 3 : itemcategory.length;
                if (len > 1) {
                    for (var i = 1; i < len; i++) {
                        if (itemcategory[i].length > 0) {
                            if(newcategory.length){
                                newcategory = newcategory + "," + itemcategory[i]
                            }else{
                               newcategory = itemcategory[i]
                            }
                        }
                    }
                }
                _SELECT("item_category").innerHTML = "/ " + newcategory;
            } else {
                _SELECT("item_category").innerHTML = "/ " + item_category;
            }
        } else {
            _SELECT("item_category").innerHTML = "/ 暂无";
        }
    }



    function getDirector() { //处理导演
        var tmpstarsize=<%=directorStar==null?"0":"1"%>;
        if(tmpstarsize!=0){return;}
        var itemdirector = new Array();
        var item_director = "<%=RequestUtil.replaceNull(seriesDetail.getDirector())%>";
        if (item_director != "") {
            if (item_director.indexOf("/") >= 0) {
                itemdirector = item_director.split("/"); //字符分割
            }
            if (itemdirector.length > 0) {
                if (itemdirector.length >= 2) {
                    if (itemdirector[0].length >=12) {
                        _SELECT("item_director").innerHTML = itemdirector[0];
                    } else if (itemdirector[1].length > 0) {
                        var newdirector = itemdirector[0].length?itemdirector[0] + "," + itemdirector[1]:itemdirector[1];
                        if (newdirector.length > 12) {
                            _SELECT("a_item_director").innerHTML = itemdirector[0];
                        } else {
                            _SELECT("a_item_director").innerHTML = newdirector;
                        }
                    } else {
                        _SELECT("a_item_director").innerHTML = itemdirector[0];
                    }
                } else {
                    _SELECT("a_item_director").innerHTML = itemdirector[0]
                }
            } else {
                _SELECT("a_item_director").innerHTML = item_director;
            }

        } else {
            _SELECT("a_item_director").innerHTML = "暂无";
        }
    }

    function getItemGuest() { //处理演员
        var tmpstarsize=<%=starlist.size()%>;
        if(tmpstarsize!=0){return;}
        var itemguest = new Array();
        var item_guest ="<%=RequestUtil.replaceNull(seriesDetail.getActors()).replaceAll("/",",") %>";
        if (item_guest != "") {
            if (item_guest.indexOf(",") >= 0) {
                itemguest = item_guest.split(","); //字符分割
                var newguest = '';
                for (var j = 0; j < itemguest.length; j++){
                    if (itemguest[j].length&&(24 - newguest.length >= itemguest[j].length)) {
                        newguest = newguest?newguest + "," + itemguest[j]:itemguest[j];
                    }
                }
                _SELECT("item_guest").innerHTML = newguest;
            }else {
                _SELECT("item_guest").innerHTML = item_guest;
            }

        } else {
            _SELECT("item_guest").innerHTML = "暂无";
        }
    }

        function GET_INFO_IN() {
        	var _INFO =eval("({\"checkInterval\": 0,\"infoItem\": [],\"resultCode\": \"000000\",\"resultCount\": 1,\"resultDesc\": \"success\",\"sessionId\": \"1539951054222\"})");
            
            
            return _INFO
        }

        function F_E_GD(){
           if(_GD_URL){window.location.href=_GD_URL;}
        }
        // 广告插入
        _INFO_RES_NUM=[];
        _GD_URL='';
        _HAS_GD=false;
        _INFO_RES = GET_INFO_IN().infoItem;
        if(_INFO_RES.length==0){
        	for (var i = 0; i < buttons.length; ++i) {
            	if(buttons[i].id=='bt_bsc'){//如果没有广告，则将收藏的向右id设置为''
            		buttons[i].rightButtonId = '';
            		break
            	}
		    }
        }
        $.each(_INFO_RES,function(k,item){
          var str = _INFO_RES[k].postionId, _p_Id = str.substring(2, str.length)
          _INFO_RES_NUM.push(parseInt(_p_Id)-1);
         if(parseInt(_p_Id)==7&&_INFO_RES[k].infoURL){
            _HAS_GD=true;
           var img = new Image();
            img.src=_INFO_RES[k].infoURL;
            if(img.width==243){
               _IS_Long=true;
              _SELECT('gd_img').style.width='166px';
              _SELECT('bt_gd').style.top='11px';
              _SELECT('bt_gd').style.left='10px';
              _SELECT('bt_gd').style.width='182px';
              _SELECT('bt_gd').style.height='59px';
               console.log(1111)
            }
            _SELECT('gd_img').src=_INFO_RES[k].infoURL;
           if(_INFO_RES[k].href){
                try{
                    var _backurl = window.location.href;
                    _GD_URL=_INFO_RES[k].href;
                    if(_GD_URL.indexOf('?')>-1){
                    _GD_URL = _GD_URL+'&backurl=' + encodeURIComponent(_backurl)
                    }else{
                    _GD_URL = _GD_URL+'?backurl=' + encodeURIComponent(_backurl)
                    }
                }catch(e){}
          }
         }else{
         	for (var i = 0; i < buttons.length; ++i) {
            	if(buttons[i].id=='bt_bsc'){//如果没有广告，则将收藏的向右id设置为''
            		buttons[i].rightButtonId = '';
            		break
            	}
		    }
         }
     })

    var tjlist = new Array();

    function getTJList() { //相关推荐
        $.get(webset.apiStatic + 'iti/<%=id%50%>/<%=id%>.json', function (result) {
            var json = eval("(" + result + ")");
            tjlist = json.list;
            $.each(json.list, function (i, item) {
           if(_INFO_RES_NUM.indexOf(i)>-1&&_INFO_RES_NUM<=5){
                var _k= _INFO_RES_NUM.indexOf(i);
                _SELECT("bt_s" + i).src = _INFO_RES[_k].infoURL;
                _SELECT("bt_p" + i).innerHTML = _INFO_RES[_k].contentName;
                seriesCp_name.push(_INFO_RES[_k].contentName);
            }else{
                _SELECT("bt_s" + i).src = item.imagetv;
                _SELECT("bt_p" + i).innerHTML = item.title;
                seriesCp_name.push(item.title);
                if (item.bcharging == "1") {
                    _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                } else {
                    _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                }
             }
            });
        FYY();
        }, true);

    }
    var hd_index = 'bt_f0'; //推荐列表当前焦点
    function F_TOTJ() { //推荐列表当前焦点focusfun
        _H_F(hd_index);
    }

    //推荐enter
    function F_TODETAIL() {
        var i = parseInt(focus_id.replace("bt_f", ""));
        if(_INFO_RES_NUM.indexOf(i)>-1&&_INFO_RES_NUM<=5){
        var _k= _INFO_RES_NUM.indexOf(i)
        try{
            var _backurl = window.location.href;
            var _url = _INFO_RES[_k].href
            if(_url.indexOf('?')>-1){
            _url = _INFO_RES[_k].href+'&backurl=' + encodeURIComponent(_backurl)
            }else{
            _url = _INFO_RES[_k].href+'?backurl=' + encodeURIComponent(_backurl)
            }
            window.location.href = _url
        }catch(e){}
        return false;
        }

        var _stat="影视聚合-<%=HttpLinkUtils.getProgramType_ZH(programType)%>-关联-<%=seriesDetail.getTitle()%>-"+tjlist[i].title;
        USER_UPDATA_LOG(tjlist[i].id, 'EPG_ITI', i,'<%=id%>');
        setTimeout(_STAT(_stat), 1);
        if(_playtimer){clearInterval(_playtimer)}
        setTimeout(function(){
        	 window.location.href = "detail_tv.jsp?id=" + tjlist[i].id + "&programType=" + tjlist[i].videoType + "&code=" + tjlist[i].code + "&cpcode=" + tjlist[i].cpcode + '&prev_focus_id=' + focus_id + '<%=pervUrl%>';
        },80)
    }
  
    
    function updateProgramaId() {

    }
        var callback = function(intent){
        var _command = intent['_command'];
        if(_command=='bt_bsc'){
        _H_F(_command);
        F_E_SC(true,'0');
        return;
        }else if(_command=='bt_bsc2'){
        _H_F('bt_bsc');
        F_E_SC(true,'1');
        return;
        }else if(_command=='_EPISODE'){
        var action= intent['_action'];
        if (action == 'INDEX') {
        if(intent['index']&&intent['index']<=drama.length){
        F_VIDEO_PLAY(intent['index']);
        }
        return;
        }
        }
        _H_F(_command);
        DOBUTTONENTERFUN(_command);
        }
        var listener = new Xiri.Listener(callback);
    var seriesCp_name=new Array();
    function FYY(){
        var scene = {
        _scene: "com.iflytek.xiri.MGTV",
        _commands: {
        "_EPISODE": ["$P(_EPISODE)"],
        "dp_01":["全屏"],
        "bt_bplay":["播放"],
        "bt_bsc":["收藏"],
        "bt_bsc2":["取消收藏"],
        "bt_f0":[""+seriesCp_name[0]+""],
        "bt_f1":[""+seriesCp_name[1]+""],
        "bt_f2":[""+seriesCp_name[2]+""],
        "bt_f3":[""+seriesCp_name[3]+""],
        "bt_f4":[""+seriesCp_name[4]+""],
        "bt_f5":[""+seriesCp_name[5]+""],
        "test1": ["测试1"],
        "test2": ["测试2"]
        },
        _feedbacks: {
        "dp_01":'全屏',
        "bt_bplay":'播放',
        "bt_bsc":'收藏',
        "bt_bsc2":'取消收藏',
        "bt_f0":'打开'+seriesCp_name[0]+'',
        "bt_f1":'打开'+seriesCp_name[1]+'',
        "bt_f2":'打开'+seriesCp_name[2]+'',
        "bt_f3":'打开'+seriesCp_name[3]+'',
        "bt_f4":'打开'+seriesCp_name[4]+'',
        "bt_f5":'打开'+seriesCp_name[5]+'',
        "test1": '为你测试1',
        "test2": '为你测试2'
        }
        };

        listener.regist(scene);
        }
    function checkedScoreAndZan() { //检测评分以及点赞状态
        if (userId.length > 4) {
            userIdStr = userId.slice(userId.length - 4, userId.length);
        } else {
            userIdStr = userId;
        }
        $.get(webset.apiStatic + 'user/' + userIdStr + '/' + userId + '.json', function (result) {
            var json = eval("(" + result + ")");
            var behavior = false
            if (json.behaviorStateList.length) {
                $.each(json.behaviorStateList, function (i, item) {
                    if (item.combineId == '<%=id%>') {
                        behavior = true
                        userbehavior(item.result)
                    }
                });
            }

            if (!behavior) {
                userbehavior('0,0,0,0')
            }
        }, true, function () {
            userbehavior('0,0,0,0');
        });
    }

    function userbehavior(res) {
        var res = res.split(','); //点赞、收藏、评分、评分数
        flag_zan = res[0];
        collect_flag = res[1];
        flag_score = res[2];

        if (flag_zan == 1) { //已经点赞
            var zannum=_SELECT("item_like").innerHTML;
            _SELECT("item_like").innerHTML =parseInt(zannum)+1
            _SELECT("zan").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-zan-f.png";
        } else { //没有点赞
            _SELECT("zan").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-zan.png";
        }

        if (collect_flag == 1) { //有收藏记录
            _SELECT("sc_img").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-collected.png';
        } else { //无收藏记录
            _SELECT("sc_img").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-collect.png';
        }

        if (flag_score == 1) { //已经评分
            _SELECT("pf").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-score-f.png";
            getScore(parseFloat(res[3]));
        } else { //没有评分
            _SELECT("pf").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/detail-score.png";
        }
    }

    function getScore(scores) { //评分处理
        var score = scores.toFixed(1);
        if (score < 7) {
            score = 7.0;
            score = score.toFixed(1);
        } else if (score >= 10) {
            score = 9.9;
        }
       // _SELECT("b_score").innerHTML = score;
    }

        //演员enter
            <%
String fun="";
titlewidth=0;
j=0;
for(SeriesStar star: starlist){
    int titlelength=HttpLinkUtils.String_length(star.getActorName());
    int width=9*titlelength+30;

    j++;
    titlewidth+=width;
    if(titlewidth>=560){
        break;
    }
    fun+="function F_TOSTARDETAIL"+(j-1)+"(){if(_playtimer){clearInterval(_playtimer)}window.location.href=\"stardetail.jsp?id="+id+"&code="+code+"&cpcode="+cpcode+"&starId="+star.getActorId()+"&programType="+programType+pervUrl+"\";}";
}
%>

  <%=fun%>

    <%
		String _stat="影视聚合-"+HttpLinkUtils.getProgramType_ZH(programType);
	    if(RequestUtil.getInt("star", request)==1){
	    	_stat+="-明星";
		}else if("list".equals(back)){
			if(!"".equals(programa_name)){
				_stat+="-"+programa_name;
			}
		}else if("search".equals(back)){
			_stat+="-搜索";
		}else if("filter".equals(back)){
			_stat+="-筛选";
		}else if("epg_tvod".equals(from)){
			_stat+="-直播推荐";
		}else if(!"".equals(from)){
			_stat+="-卓影";
		}
		_stat+="-"+seriesDetail.getTitle();
	%>
	function _STAT(_stat) { //用户点击行为上报
	    _stat = encodeURI(encodeURI(_stat));
	    var _url = 'http://sta.jisu8.cn/stat?category=' + _stat +'&contid=&style=&label=&id=6955&action=click&account='+userId+'&plat=&vlauncher=&vterminal=';
	    _SELECT('stat').src = _url;
	}

    function F_STAR_FOCUS() { //演员focus
        _SELECT(focus_id).style.fontWeight = 'bold';
        _SELECT("a_" + focus_id).style.textDecoration = 'none';
    }

    function F_STAR_BLUR() { //演员blur
        _SELECT(focus_id).style.fontWeight = 'normal';
        _SELECT("a_" + focus_id).style.textDecoration = 'underline';
    }
</script>
<script type="text/javascript">
    window.focus();
    countplay()
    setTimeout("_STAT('<%=_stat%>')", 2000);
</script>

</html>

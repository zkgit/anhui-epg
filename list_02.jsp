<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.vstartek.epg.utils.HttpLinkUtils"%>
<%@page import="com.vstartek.epg.pojo.ProgramType"%>
<%@page import="com.vstartek.epg.action.SeriesAction"%>
<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String programType=RequestUtil.getString("programType", request);
	programType="".equals(programType)?"film":programType;
	
	String focus_id=RequestUtil.getString("focus_id", request);
	String programa_id=RequestUtil.getString("programa_id", request);
	String perv_num=RequestUtil.getString("perv_num", request);
	int perv_count=RequestUtil.getInt("perv_count", request);
	String pf_focus_id=RequestUtil.getString("pf_focus_id", request);
	String home_focus_id=RequestUtil.getString("home_focus_id", request);
	String home_from=RequestUtil.getString("home_from", request);
    String model_plugin_id=RequestUtil.getString("model_plugin_id", request);
    String tradeInfo=RequestUtil.getString("tradeInfo", request);
	String backUrl=RequestUtil.getString("backUrl", request);//接受backUrl
	String backUrl_encode=URLEncoder.encode(backUrl,"UTF-8");

	List<ProgramType>  perlist=SeriesAction.getProgramType2(programType);
	
	String programType_ZH=HttpLinkUtils.getProgramType_ZH(programType);
			
	Long totalrecords=SeriesAction.totalrecordsMap.get(programType);
	
	if(totalrecords==null){totalrecords=0L;}
	
	if("".equals(pf_focus_id)){
		pf_focus_id="bt_pf0";
	}
	String itu_code="";
	List<ProgramType> programTypeList=new ArrayList<ProgramType>();
	
	for(ProgramType pt:perlist){
		if("推荐".equals(pt.getName())){
			itu_code=pt.getCode();
			break;
		}
	}
	if("".equals(focus_id)){
		if("arts".equals(programType)){
			focus_id="bt_pf"+("".equals(itu_code)?"0":"2");
		}else{
			focus_id="bt_pf"+("".equals(itu_code)?"0":"1");
		}
// 		focus_id="bt_pf0";
	}
	
	if(!"".equals(programa_id)){
		int currenti=0;
		for(int i=0;i<perlist.size();i++){
			ProgramType p=perlist.get(i);
			if(p.getCode().equals(programa_id)){
				currenti=i;
				break;
			}
		}
		if(currenti>4){
			if(currenti<perlist.size()-4){
				currenti=currenti-4;
			}else{
				currenti=perlist.size()-9;
			}
			for(int i=currenti;i<perlist.size();i++){
				programTypeList.add(perlist.get(i));
			}
			for(int i=0;i<currenti;i++){
				programTypeList.add(perlist.get(i));
			}
		}else{
			programTypeList.addAll(perlist);
		}
	}else{
		programTypeList.addAll(perlist);
	}
	String pervUrl="&back=list&focus_id="+focus_id+"&programa_id="+programa_id+"&perv_num="+perv_num+"&perv_count="+(perv_count+1)+"&pf_focus_id="+pf_focus_id+"&backUrl="+backUrl_encode;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
    <meta content="IE=5.0000" http-equiv="X-UA-Compatible">
    <meta name="page-view-size" content="1280*720">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <jsp:include page="/common/top_0718.jsp" >
		<jsp:param name="t" value="<%=System.currentTimeMillis() %>"/>
	</jsp:include>
	<script src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/webxiri_1.0.8.js" type="text/javascript"></script>
    <style type="text/css">
        .p0 {
            font-size: 20px
        }

        .p1 {
            font-size: 20px
        }
    </style>
    <meta name="GENERATOR" content="MSHTML 11.00.10570.1001">
</head>

<body  onload="initdatas()">
    <!--挽留弹窗 -->
    <img id="vipCard" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-toast1.png" style="display:none;position:absolute;left:0px;top:0px;width:1280px;height:720px;z-index: 120">
    <!--订购弹窗 -->
    <div id="couponCard" style="display:none;">
        <img id="md_f1" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"  style="position:absolute;left:328px;top:486px;width:auto;height:auto;z-index: 121">
        <img id="md_f2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"  style="position:absolute;left:553px;top:486px;width:auto;height:auto;z-index: 121">
        <img id="md_f3" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png"  style="position:absolute;left:769px;top:486px;width:auto;height:auto;z-index: 121">
        <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-couponCard2.png" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;z-index: 120">    
    </div>
    <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-bg.jpg" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;">
    <div style="position:absolute;left:75px;top:60px; z-index:1;">
        <div style="position:relative; left:0px; top:0px; text-align:left; font-size:40px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;"><%=programType_ZH %></div>
        <p style="position:absolute; left:-70px; top:50px; width:110px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">共<%=totalrecords %>部</p>
        <div id="n_p" style="position:absolute; left:30px; top:50px; width:110px; text-align:center; font-size:20px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">/总<%=totalrecords%10==0?totalrecords/10:((int)(totalrecords/10)+1)%>页</div>
    </div>
    <div id='DIV_F' style='position:absolute;left:0px;top:0px;z-index:11'>
        <img id='IMG_F' src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdgd" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;" />
    </div>
    <div style="position:absolute;left:90px;top:128px;">
        <img id="bt_search" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:20px;top:13px;width:74px;height:59px;" />
        <img id="ss_img" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-icon-search.png" style="position: absolute;left:29px;top:20px;width:61px;height:44px;" />
    </div>
    <div style="position:absolute;left:25px;top:128px;">
        <img id="bt_sx" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:25px;top:13px;width:74px;height:59px;" />
        <img id="sx_img" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-icon-filter.png" style="position: absolute;left:29px;top:20px;width:61px;height:44px;" />
    </div>
    <%
    	for(int i=0;i<programTypeList.size();i++){
    		ProgramType pt= programTypeList.get(i);
    %>
    <!--<%=pt.getName()%> -->
    <div style="position:absolute;left:75px;top:<%=i*50+200 %>px; width:120px;height:40px;z-index:1;">
        <p id="bt_wzf<%=i %>" style="position:absolute; left:0px; top:0px; width:120px; height:40px; line-height:40px; text-align:left; font-size:24px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;"><%=pt.getName()%></p>
        <img id="im_pfjb<%=i %>" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:50px;top:0px;width:40px;height:26px;" />
    </div>
    <div style="position:absolute;left:185px;top:<%=i*49+124%>px;">
        <img id="bt_pF<%=i %>" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;width:67px;height:197px;" />
    </div>
    <div style="position:absolute;left:35px;top:<%=i*50+182%>px;">
        <img id="bt_pf<%=i %>" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;width:171px;height:81px;" />
    </div>
   
    <%
    	if(i==8){break;}
    } 
    %>

    <img id="index-icon-more" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:87px;top:650px;width:25px;height:23px;" />

    <div id="itempage" style="display: none;">
        <div id="div_f0" style="position:absolute;left:256px;top:68px; display:none;">
            <img id="bt_s0" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jb0" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_f0" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bg0" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbr0" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_p0" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sc0" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_f1" style="position:absolute;left:449px;top:68px; display:none;">
            <img id="bt_s1" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jb1" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_f1" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bg1" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbr1" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_p1" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sc1" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_f2" style="position:absolute;left:642px;top:68px; display:none;">
            <img id="bt_s2" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jb2" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_f2" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bg2" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbr2" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_p2" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sc2" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_f3" style="position:absolute;left:835px;top:68px; display:none;">
            <img id="bt_s3" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jb3" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_f3" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bg3" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbr3" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_p3" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sc3" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_f4" style="position:absolute;left:1028px;top:68px; display:none;">
            <img id="bt_s4" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jb4" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_f4" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bg4" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbr4" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_p4" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sc4" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_f5" style="position:absolute;left:256px;top:353px; display:none;">
            <img id="bt_s5" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jb5" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_f5" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bg5" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbr5" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_p5" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sc5" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_f6" style="position:absolute;left:449px;top:353px; display:none;">
            <img id="bt_s6" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jb6" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_f6" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bg6" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbr6" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_p6" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sc6" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_f7" style="position:absolute;left:642px;top:353px; display:none;">
            <img id="bt_s7" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jb7" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_f7" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bg7" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbr7" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_p7" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sc7" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_f8" style="position:absolute;left:835px;top:353px; display:none;">
            <img id="bt_s8" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jb8" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_f8" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bg8" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbr8" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_p8" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sc8" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_f9" style="position:absolute;left:1028px;top:353px; display:none;">
            <img id="bt_s9" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jb9" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_f9" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bg9" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbr9" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_p9" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sc9" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_b0" style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat:no-repeat;background-size:100%;background-position:0px 176px;width:176px;height:258px;position: absolute;left:256px;top:461px;display: none;">
            <img id="im_b0" style="position: absolute;left:0px;top:177px;width:61px;height:60px;z-index:10;" src="">
            <img id="im_jb0" style="position: absolute;left:124px;top:177px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        </div>
        <div id="div_b1" style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat:no-repeat;background-size:100%;background-position:0px 176px;width:176px;height:258px;position: absolute;left:449px;top:461px;display: none;">
            <img id="im_b1" style="position: absolute;left:0px;top:177px;width:61px;height:60px;z-index:10;" src="">
            <img id="im_jb1" style="position: absolute;left:124px;top:177px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        </div>
        <div id="div_b2" style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat:no-repeat;background-size:100%;background-position:0px 176px;width:176px;height:258px;position: absolute;left:642px;top:461px;display: none;">
            <img id="im_b2" style="position: absolute;left:0px;top:177px;width:61px;height:60px;z-index:10;" src="">
            <img id="im_jb2" style="position: absolute;left:124px;top:177px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        </div>
        <div id="div_b3" style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat:no-repeat;background-size:100%;background-position:0px 176px;width:176px;height:258px;position: absolute;left:835px;top:461px;display: none;">
            <img id="im_b3" style="position: absolute;left:0px;top:177px;width:61px;height:60px;z-index:10;" src="">
            <img id="im_jb3" style="position: absolute;left:124px;top:177px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        </div>
        <div id="div_b4" style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat:no-repeat;background-size:100%;background-position:0px 176px;width:176px;height:258px;position: absolute;left:1028px;top:461px;display: none;">
            <img id="im_b4" style="position: absolute;left:0px;top:177px;width:61px;height:60px;z-index:10;" src="">
            <img id="im_jb4" style="position: absolute;left:124px;top:177px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
        </div>
        <div style="position: absolute;left:1026px;top:10px;">
            <div id="n_s" style="position:absolute; left:0px; top:0px; width:220px; height:35px; line-height:35px; text-align:left; font-size:23px; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;"></div>
        </div>
    </div>

    <!-- 第一屏 -->
    <div id="partone" style="display: none;">
       
            <div id="div_fi0" style="position:absolute;left:256px;top:68px; display:none;">
                <img id="bt_si0" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
                <img id="bt_jbi0" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
                <img id="bt_fi0" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <img id="bt_bgi0" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
                <img id="bt_jbir0" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <p id="bt_pi0" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
                <p id="bt_sci0" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            </div>
            <div id="div_fi1" style="position:absolute;left:449px;top:68px; display:none;">
                <img id="bt_si1" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
                <img id="bt_jbi1" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
                <img id="bt_fi1" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <img id="bt_bgi1" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
                <img id="bt_jbir1" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <p id="bt_pi1" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
                <p id="bt_sci1" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            </div>
            <div id="div_fi2" style="position:absolute;left:642px;top:68px; display:none;">
                <img id="bt_si2" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
                <img id="bt_jbi2" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
                <img id="bt_fi2" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <img id="bt_bgi2" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
                <img id="bt_jbir2" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <p id="bt_pi2" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
                <p id="bt_sci2" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            </div>
            <div id="div_fi3" style="position:absolute;left:835px;top:68px; display:none;">
                <img id="bt_si3" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
                <img id="bt_jbi3" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
                <img id="bt_fi3" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <img id="bt_bgi3" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
                <img id="bt_jbir3" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <p id="bt_pi3" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
                <p id="bt_sci3" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            </div>
            <div id="div_fi4" style="position:absolute;left:1028px;top:68px; display:none;">
                <img id="bt_si4" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
                <img id="bt_jbi4" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
                <img id="bt_fi4" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <img id="bt_bgi4" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
                <img id="bt_jbir4" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <p id="bt_pi4" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
                <p id="bt_sci4" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            </div>
            <div id="div_fi5" style="position:absolute;left:256px;top:353px; display:none;">
                <img id="bt_si5" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
                <img id="bt_jbi5" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
                <img id="bt_fi5" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <img id="bt_bgi5" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
                <img id="bt_jbir5" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <p id="bt_pi5" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
                <p id="bt_sci5" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            </div>
            <div id="div_fi6" style="position:absolute;left:449px;top:353px; display:none;">
                <img id="bt_si6" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
                <img id="bt_jbi6" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
                <img id="bt_fi6" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <img id="bt_bgi6" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
                <img id="bt_jbir6" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <p id="bt_pi6" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
                <p id="bt_sci6" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            </div>
            <div id="div_fi7" style="position:absolute;left:642px;top:353px; display:none;">
                <img id="bt_si7" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
                <img id="bt_jbi7" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
                <img id="bt_fi7" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <img id="bt_bgi7" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
                <img id="bt_jbir7" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <p id="bt_pi7" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
                <p id="bt_sci7" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            </div>
            <div id="div_fi8" style="position:absolute;left:835px;top:353px; display:none;">
                <img id="bt_si8" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
                <img id="bt_jbi8" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
                <img id="bt_fi8" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <img id="bt_bgi8" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
                <img id="bt_jbir8" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <p id="bt_pi8" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
                <p id="bt_sci8" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            </div>
            <div id="div_fi9" style="position:absolute;left:1028px;top:353px; display:none;">
                <img id="bt_si9" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
                <img id="bt_jbi9" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
                <img id="bt_fi9" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <img id="bt_bgi9" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
                <img id="bt_jbir9" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
                <p id="bt_pi9" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
                <p id="bt_sci9" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            </div>
            <div id="div_bi0" style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat:no-repeat;background-size:100%;background-position:0px 176px;width:176px;height:258px;position: absolute;left:256px;top:461px;display: none;">
                <img id="im_bi0" style="position: absolute;left:0px;top:177px;width:61px;height:60px;z-index:10;" src="">
                <img id="im_jb0" style="position: absolute;left:124px;top:177px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            </div>
            <div id="div_bi1" style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat:no-repeat;background-size:100%;background-position:0px 176px;width:176px;height:258px;position: absolute;left:449px;top:461px;display: none;">
                <img id="im_bi1" style="position: absolute;left:0px;top:177px;width:61px;height:60px;z-index:10;" src="">
                <img id="im_jbi1" style="position: absolute;left:124px;top:177px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            </div>
            <div id="div_bi2" style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat:no-repeat;background-size:100%;background-position:0px 176px;width:176px;height:258px;position: absolute;left:642px;top:461px;display: none;">
                <img id="im_bi2" style="position: absolute;left:0px;top:177px;width:61px;height:60px;z-index:10;" src="">
                <img id="im_jbi2" style="position: absolute;left:124px;top:177px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            </div>
            <div id="div_bi3" style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat:no-repeat;background-size:100%;background-position:0px 176px;width:176px;height:258px;position: absolute;left:835px;top:461px;display: none;">
                <img id="im_bi3" style="position: absolute;left:0px;top:177px;width:61px;height:60px;z-index:10;" src="">
                <img id="im_jbi3" style="position: absolute;left:124px;top:177px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            </div>
            <div id="div_bi4" style="background-image:url('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png');background-repeat:no-repeat;background-size:100%;background-position:0px 176px;width:176px;height:258px;position: absolute;left:1028px;top:461px;display: none;">
                <img id="im_bi4" style="position: absolute;left:0px;top:177px;width:61px;height:60px;z-index:10;" src="">
                <img id="im_jbi4" style="position: absolute;left:124px;top:177px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            </div>
       
    </div>
    <div id="parttwo" style="display: none;">
        <div id="div_fi10" style="position:absolute;left:256px;top:68px; display:none;">
            <img id="bt_si10" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jbi10" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_fi10" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bgi10" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbir10" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_pi10" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sci10" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_fi11" style="position:absolute;left:449px;top:68px; display:none;">
            <img id="bt_si11" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jbi11" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_fi11" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bgi11" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbir11" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_pi11" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sci11" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_fi12" style="position:absolute;left:642px;top:68px; display:none;">
            <img id="bt_si12" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jbi12" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_fi12" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bgi12" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbir12" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_pi12" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sci12" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_fi13" style="position:absolute;left:835px;top:68px; display:none;">
            <img id="bt_si13" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jbi13" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_fi13" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bgi13" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbir13" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_pi13" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sci13" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_fi14" style="position:absolute;left:1028px;top:68px; display:none;">
            <img id="bt_si14" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jbi14" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_fi14" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bgi14" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbir14" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_pi14" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sci14" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_fi15" style="position:absolute;left:256px;top:353px; display:none;">
            <img id="bt_si15" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jbi15" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_fi15" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bgi15" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbir15" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_pi15" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sci15" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_fi16" style="position:absolute;left:449px;top:353px; display:none;">
            <img id="bt_si16" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jbi16" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_fi16" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bgi16" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbir16" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_pi16" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sci16" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_fi17" style="position:absolute;left:642px;top:353px; display:none;">
            <img id="bt_si17" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jbi17" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_fi17" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bgi17" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbir17" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_pi17" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sci17" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_fi18" style="position:absolute;left:835px;top:353px; display:none;">
            <img id="bt_si18" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jbi18" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_fi18" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bgi18" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbir18" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_pi18" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sci18" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
        <div id="div_fi19" style="position:absolute;left:1028px;top:353px; display:none;">
            <img id="bt_si19" style="position: absolute;left:0px;top:0px;width:176px;height:258px;z-index:1;" src="">
            <img id="bt_jbi19" style="position: absolute;left:0px;top:0px;width:61px;height:60px;z-index:10;" src="">
            <img id="bt_fi19" style="position: absolute;left:-20px;top:-20px;width:216px;height:299px;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <img id="bt_bgi19" style="position:absolute;left:0px;top:0px;width:176px;height:258px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-poster-bg.png">
            <img id="bt_jbir19" style="position: absolute;left:124px;top:0px;width:56px;height:29px;z-index:10;" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png">
            <p id="bt_pi19" class="p1" style="position:absolute; left:5px; top:232px; width:130px; height:23px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;z-index:100"></p>
            <p id="bt_sci19" class="p1" style="position:absolute; left:138px; top:232px; width:37px; height:25px; line-height:25px; text-align:left; font-family:微软雅黑; font-weight:normal; color:#FF9224; overflow:hidden; margin:0; padding:0;z-index:100"></p>
        </div>
    </div>


    <img id="bt_prev_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px; width:1px;height:1px" />
    <img id="bt_next_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px; width:1px;height:1px" />
    <div style="position:absolute;left:290px;top:12px; width:33px;height:45px;z-index:10;"></div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg_f" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;" />
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg_e" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;" />
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg_g" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;" />
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg_h" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;" />
    </div>
    <div style="position:absolute;left:0px;top:0px;">
        <img id="bt_pdg_i" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;" />
    </div>
    <div style="position:absolute;left:0px;top:1px;">
        <img id="bt_pfgd" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;" />
    </div>
    <div style="position:absolute;left:0px;top:2px;">
        <img id="bt_pfgd2" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:0px;top:0px;" />
    </div>
    <img id="visitRecord" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" style="position: absolute;left:1px;top:1px" />

    <div id="test" style="position: absolute;left:20px;top:300px;font-size:30px;color:#FF0000;">
    	 <img id="stat" style="left: 1px; top: 1px; position: absolute;" src=""> 
    </div>
</body>
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
    //默认键值
    function keyStill(KV){
        if ('F_SHOW' in window) {
            F_SHOW(KV);
        }
        if (KV == KEY_G_0) {           
            if ('F_KEY_G_0' in window) {
                currentCount++
                if(currentCount>=2){F_KEY_G_0();}
                if(once&&'<%=programType%>'=='arts'?true:false){//*弹窗*,返回键监听，弹窗挽留
                    ModelPlugin.initHandle() 
                    once=false;
                    return false
                }
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
        if(ModelPlugin.iskey){//*弹窗*,插件key判断切换键盘
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
            _SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['focusImage'];
            if (_BS[focus_id]['focusImage'] != 'Pixel.png') {
                var gb = _SELECT(focus_id);
                _SELECT("DIV_F").style.left = gb.getBoundingClientRect().left + "px";
                _SELECT("DIV_F").style.top = gb.getBoundingClientRect().top + "px";
                //	_SELECT("IMG_F").src ='http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'+_BS[focus_id]['focusImage'];
            }
            DOBUTTONFOCUSFUN(focus_id);
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

            _SELECT(focus_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/' + _BS[focus_id]['blurImage'];
            DOBUTTONBLURFUN(focus_id);
            if (focus_id.indexOf('bt_f') >= 0) {
                var show_id = focus_id.replace('f', 's');
                var black_id = focus_id.replace('f', 'bg');
                var jb_id = focus_id.replace('f', 'jb');
                //bt_jbi10海报部分还原
                _TF(show_id, 1.0);
                // bt_bgi10文字部分渐变图还原
                _TF(black_id, 1.0);
                // bt_jbi10海报左上免费\会员还原
                _FD(jb_id, 1.0, 1.0);
            } else if (focus_id.indexOf('bt_lmf') >= 0) {
                var show_id = focus_id.replace('f', 's');
                var lmblack_id = focus_id.replace('f', 'm');
                _TF(show_id, 1.0);
                _TF(lmblack_id, 1.0);
                _TF('DIV_F', 1.0);
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
                    _TF('DIV_F', 1.055);
                    var show_id = focus_id.replace('f', 's');
                    var black_id = focus_id.replace('f', 'bg');
                    var jb_id = focus_id.replace('f', 'jb');
                    _TF(show_id, 1.05);
                    _TF(black_id, 1.05);
                    _FD(jb_id, 1.144, 1.23);
                } else if (focus_id.indexOf('bt_lmf') >= 0) {
                    var show_id = focus_id.replace('f', 's');
                    var lmblack_id = focus_id.replace('f', 'm');
                    _TF(show_id, 1.05);
                    _TF(lmblack_id, 1.05);
                    _TF('DIV_F', 1.05);
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
    // 宽高调试放大缩放
    function _FD(_t, _s, y) {
        
        var _f = _SELECT(_t);
        if (_s && _f) {
            _f.style.zIndex = 10;
            _f.style.transform = "scale(" + _s + "," + y + ")";
            _f.style.webkitTransform = "scale(" + _s + "," + y + ")";
        }
    }
    //整体放大缩放
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
    //向左触发事件,并改变移入位置的样式，_BS[focus_id]['leftButtonId']为新选中元素的id，下边三个方法同理
    function F_KEY_G_4() {
        
        if (_BS[focus_id] != undefined && _BS[focus_id]['leftButtonId'] != '') {
            _H_F(_BS[focus_id]['leftButtonId']);
        }
        return;
    }
    //向上触发事件
    function F_KEY_G_5() {
        
        if (_BS[focus_id] != undefined && _BS[focus_id]['upButtonId'] != '') {
            _H_F(_BS[focus_id]['upButtonId']);
        }
        return;
    }
    //向右触发事件
    function F_KEY_G_6() {
        
        if (_BS[focus_id] != undefined && _BS[focus_id]['rightButtonId'] != '') {
            _H_F(_BS[focus_id]['rightButtonId'])
        };
        return;
    }
    //向下触发事件
    function F_KEY_G_7() {
        
        if (_BS[focus_id] != undefined && _BS[focus_id]['downButtonId'] != '') {
            _H_F(_BS[focus_id]['downButtonId'])
        };
        return;
    }
    //blurFun
    function DOBUTTONBLURFUN(_id) { //dobuttonblurfun
        
        if (_BS[_id] != undefined && _BS[_id]['blurFun'] != undefined && _BS[_id]['blurFun'] != '') {
            var _b = _BS[_id];
            var fun = _b['blurFun'];
            eval("(" + fun + ")")();
        }
    }
    //focusFun
    function DOBUTTONFOCUSFUN(_id) { //dobuttonfocusfun
        
        if (_BS[_id] != undefined && _BS[_id]['focusFun'] != undefined && _BS[_id]['focusFun'] != '') {
            var _b = _BS[_id];
            var fun = _b['focusFun'];
            eval("(" + fun + ")")();
        }
    }
    //enterFun
    function DOBUTTONENTERFUN(_id) { //dobuttonenterfun
        
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

    function F_KEY_N_0() {
    	F_KEY_G_0();
    }
    // 广告
   function GET_INFO_IN(CN) {
        var _INFO =eval("({\"checkInterval\": 0,\"infoItem\": [],\"resultCode\": \"000000\",\"resultCount\": 1,\"resultDesc\": \"success\",\"sessionId\": \"1539951054222\"})");
        if(CN=="推荐下线"){
        	$.get(webset.api+'ad/getInfo.json?clientId='+userId+'&catagoryId='+ '<%=programType_ZH %>'+CN +'&deviceType='+stbModel+'&infoGroupId=104&contentId=&infoId=0',
                function (e) {
                 _INFO = eval("("+e+")")
                }, false);
        }
        return _INFO
    }


    var buttons = [
        //左边光标

        {
            id: 'bt_pf0',
            upButtonId: 'bt_search',
            downButtonId: 'bt_pf1',
            leftButtonId: '',
            rightButtonId: 'bt_pdg_h',
            blurFun: 'F_E_BLUR0',
            focusFun: 'F_E_PF0',
            enterFun: '',
            focusImage: 'index-tag-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_pf1',
            upButtonId: 'bt_pf0',
            downButtonId: 'bt_pf2',
            leftButtonId: '',
            rightButtonId: 'bt_f0',
            blurFun: 'F_E_BLUR0',
            focusFun: 'F_E_PF0',
            enterFun: '',
            focusImage: 'index-tag-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_pf2',
            upButtonId: 'bt_pf1',
            downButtonId: 'bt_pf3',
            leftButtonId: '',
            rightButtonId: 'bt_f0',
            blurFun: 'F_E_BLUR0',
            focusFun: 'F_E_PF0',
            enterFun: '',
            focusImage: 'index-tag-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_pf3',
            upButtonId: 'bt_pf2',
            downButtonId: 'bt_pf4',
            leftButtonId: '',
            rightButtonId: 'bt_f0',
            blurFun: 'F_E_BLUR0',
            focusFun: 'F_E_PF0',
            enterFun: '',
            focusImage: 'index-tag-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_pf4',
            upButtonId: 'bt_pfgd2',
            downButtonId: 'bt_pfgd',
            leftButtonId: '',
            rightButtonId: 'bt_f0',
            blurFun: 'F_E_BLUR0',
            focusFun: 'F_E_PF0',
            enterFun: '',
            focusImage: 'index-tag-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_pf5',
            upButtonId: 'bt_pf4',
            downButtonId: 'bt_pf6',
            leftButtonId: '',
            rightButtonId: 'bt_f0',
            blurFun: 'F_E_BLUR0',
            focusFun: 'F_E_PF0',
            enterFun: '',
            focusImage: 'index-tag-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_pf6',
            upButtonId: 'bt_pf5',
            downButtonId: 'bt_pf7',
            leftButtonId: '',
            rightButtonId: 'bt_f0',
            blurFun: 'F_E_BLUR0',
            focusFun: 'F_E_PF0',
            enterFun: '',
            focusImage: 'index-tag-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_pf7',
            upButtonId: 'bt_pf6',
            downButtonId: 'bt_pf8',
            leftButtonId: '',
            rightButtonId: 'bt_f0',
            blurFun: 'F_E_BLUR0',
            focusFun: 'F_E_PF0',
            enterFun: '',
            focusImage: 'index-tag-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_pf8',
            upButtonId: 'bt_pf7',
            downButtonId: 'bt_pf9',
            leftButtonId: '',
            rightButtonId: 'bt_f0',
            blurFun: 'F_E_BLUR0',
            focusFun: 'F_E_PF0',
            enterFun: '',
            focusImage: 'index-tag-f.png',
            blurImage: 'Pixel.png'
        },

        {
            id: 'bt_pfgd',
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_PFCHANGE',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_pfgd2',
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_PFCHANGE2',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        //右边光标
        {
            id: 'bt_f0',
            upButtonId: 'bt_prev_f',
            downButtonId: 'bt_pdg_f',
            leftButtonId: 'bt_pdgd',
            rightButtonId: 'bt_f1',
            blurFun: 'F_B_F00',
            focusFun: 'F_E_RF',
            enterFun: 'F_E_F0',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f1',
            upButtonId: 'bt_prev_f',
            downButtonId: 'bt_pdg_f',
            leftButtonId: 'bt_f0',
            rightButtonId: 'bt_f2',
            blurFun: 'F_B_F00',
            focusFun: 'F_E_RF',
            enterFun: 'F_E_F0',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f2',
            upButtonId: 'bt_prev_f',
            downButtonId: 'bt_pdg_f',
            leftButtonId: 'bt_f1',
            rightButtonId: 'bt_f3',
            blurFun: 'F_B_F00',
            focusFun: 'F_E_RF',
            enterFun: 'F_E_F0',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f3',
            upButtonId: 'bt_prev_f',
            downButtonId: 'bt_pdg_f',
            leftButtonId: 'bt_f2',
            rightButtonId: 'bt_f4',
            blurFun: 'F_B_F00',
            focusFun: 'F_E_RF',
            enterFun: 'F_E_F0',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f4',
            upButtonId: 'bt_prev_f',
            downButtonId: 'bt_pdg_f',
            leftButtonId: 'bt_f3',
            rightButtonId: 'bt_f5',
            blurFun: 'F_B_F00',
            focusFun: 'F_E_RF',
            enterFun: 'F_E_F0',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        }, //第二行下一ID跳转bt_next_f
        {
            id: 'bt_f5',
            upButtonId: 'bt_f0',
            downButtonId: 'bt_next_f',
            leftButtonId: 'bt_pdgd',
            rightButtonId: 'bt_f6',
            blurFun: 'F_B_F00',
            focusFun: 'F_E_RF',
            enterFun: 'F_E_F0',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f6',
            upButtonId: 'bt_f1',
            downButtonId: 'bt_next_f',
            leftButtonId: 'bt_f5',
            rightButtonId: 'bt_f7',
            blurFun: 'F_B_F00',
            focusFun: 'F_E_RF',
            enterFun: 'F_E_F0',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f7',
            upButtonId: 'bt_f2',
            downButtonId: 'bt_next_f',
            leftButtonId: 'bt_f6',
            rightButtonId: 'bt_f8',
            blurFun: 'F_B_F00',
            focusFun: 'F_E_RF',
            enterFun: 'F_E_F0',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f8',
            upButtonId: 'bt_f3',
            downButtonId: 'bt_next_f',
            leftButtonId: 'bt_f7',
            rightButtonId: 'bt_f9',
            blurFun: 'F_B_F00',
            focusFun: 'F_E_RF',
            enterFun: 'F_E_F0',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_f9',
            upButtonId: 'bt_f4',
            downButtonId: 'bt_next_f',
            leftButtonId: 'bt_f8',
            rightButtonId: '',
            blurFun: 'F_B_F00',
            focusFun: 'F_E_RF',
            enterFun: 'F_E_F0',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        //第一个栏目的节目id
        // ----新增
        {
            id: 'bt_fi0',
            upButtonId: '',
            downButtonId: 'bt_fi5',
            leftButtonId: 'bt_pdgd',
            rightButtonId: 'bt_fi1',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi1',
            upButtonId: '',
            downButtonId: 'bt_fi6',
            leftButtonId: 'bt_fi0',
            rightButtonId: 'bt_fi2',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi2',
            upButtonId: '',
            downButtonId: 'bt_fi7',
            leftButtonId: 'bt_fi1',
            rightButtonId: 'bt_fi3',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi3',
            upButtonId: '',
            downButtonId: 'bt_fi8',
            leftButtonId: 'bt_fi2',
            rightButtonId: 'bt_fi4',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi4',
            upButtonId: '',
            downButtonId: 'bt_fi9',
            leftButtonId: 'bt_fi3',
            rightButtonId: 'bt_fi5',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        // -----------
        {
            id: 'bt_fi5',
            upButtonId: 'bt_fi0',
            downButtonId: 'bt_pdg_e',
            leftButtonId: 'bt_pdgd',
            rightButtonId: 'bt_fi6',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi6',
            upButtonId: 'bt_fi1',
            downButtonId: 'bt_pdg_e',
            leftButtonId: 'bt_fi5',
            rightButtonId: 'bt_fi7',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi7',
            upButtonId: 'bt_fi2',
            downButtonId: 'bt_pdg_e',
            leftButtonId: 'bt_fi6',
            rightButtonId: 'bt_fi8',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi8',
            upButtonId: 'bt_fi3',
            downButtonId: 'bt_pdg_e',
            leftButtonId: 'bt_fi7',
            rightButtonId: 'bt_fi9',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi9',
            upButtonId: 'bt_fi4',
            downButtonId: 'bt_pdg_e',
            leftButtonId: 'bt_fi8',
            rightButtonId: 'bt_pdg_e',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        // --------------------分割线，partone(0-4)和parttwo(5-14)，--------------------------
        {
            id: 'bt_fi10',
            upButtonId: 'bt_pdg_g',
            downButtonId: 'bt_fi15',
            leftButtonId: 'bt_pdgd',
            rightButtonId: 'bt_fi11',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi11',
            upButtonId: 'bt_pdg_g',
            downButtonId: 'bt_fi16',
            leftButtonId: 'bt_fi10',
            rightButtonId: 'bt_fi12',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi12',
            upButtonId: 'bt_pdg_g',
            downButtonId: 'bt_fi17',
            leftButtonId: 'bt_fi11',
            rightButtonId: 'bt_fi13',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi13',
            upButtonId: 'bt_pdg_g',
            downButtonId: 'bt_fi18',
            leftButtonId: 'bt_fi12',
            rightButtonId: 'bt_fi14',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi14',
            upButtonId: 'bt_pdg_g',
            downButtonId: 'bt_fi19',
            leftButtonId: 'bt_fi13',
            rightButtonId: '',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        // ------最热（15-19）
        {
            id: 'bt_fi15',
            upButtonId: 'bt_fi10',
            downButtonId: 'bt_pdg_i',
            leftButtonId: 'bt_pdgd',
            rightButtonId: 'bt_fi16',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi16',
            upButtonId: 'bt_fi11',
            downButtonId: 'bt_pdg_i',
            leftButtonId: 'bt_fi15',
            rightButtonId: 'bt_fi17',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi17',
            upButtonId: 'bt_fi12',
            downButtonId: 'bt_pdg_i',
            leftButtonId: 'bt_fi16',
            rightButtonId: 'bt_fi18',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi18',
            upButtonId: 'bt_fi13',
            downButtonId: 'bt_pdg_i',
            leftButtonId: 'bt_fi17',
            rightButtonId: 'bt_fi19',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        {
            id: 'bt_fi19',
            upButtonId: 'bt_fi14',
            downButtonId: 'bt_pdg_i',
            leftButtonId: 'bt_fi18',
            rightButtonId: '',
            blurFun: 'F_B_F00_I',
            focusFun: 'F_E_RF_I',
            enterFun: 'F_E_F0_i',
            focusImage: 'index-poster-f.png',
            blurImage: 'Pixel.png'
        },
        //出发查询按钮上下左右
        {
            id: 'bt_search',
            upButtonId: '',
            downButtonId: 'bt_pf0',
            leftButtonId: 'bt_sx',
            rightButtonId: 'bt_pdg_h',
            blurFun: 'SS_BLUR',
            focusFun: 'SS_FOCUS',
            enterFun: 'F_TOSEARCH',
            focusImage: 'Pixel.png', //zyjh_search_f.png
            blurImage: 'Pixel.png'
        },
        {
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
        //itemtemplate 向下分页时传入id事件
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
        //右边模块焦点跳到左边“最热”时传入的id事件
        {
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
        },
        //itemtemplate模块第一行元素跳转到第二行元素时的id事件 
        {
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
        },
        //partone向parttwo 跳转时的id
        {
            id: 'bt_pdg_e',
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_F_PFG_E',
            // focusFun: 'F_KEY_G_3',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        //parttwo向partone 跳转时的id
        {
            id: 'bt_pdg_g',
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_F_PFG_G',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        //从左边“最热”跳到右边热门推荐第一个元素的id事件
        {
            id: 'bt_pdg_h',
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_F_PFG_H',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        //parttwo进入itemtemplate第一行第一个时传入的id事件
        {
            id: 'bt_pdg_i',
            upButtonId: '',
            downButtonId: '',
            leftButtonId: '',
            rightButtonId: '',
            blurFun: '',
            focusFun: 'F_F_PFG_I',
            enterFun: '',
            focusImage: 'Pixel.png',
            blurImage: 'Pixel.png'
        },
        //筛选按钮id及进入周围元素事件id
        {
            id: 'bt_sx',
            upButtonId: '',
            downButtonId: 'bt_pf0',
            leftButtonId: '',
            rightButtonId: 'bt_search',
            blurFun: 'SX_BLUR',
            focusFun: 'SX_FOCUS',
            enterFun: 'F_TOSX',
            focusImage: 'Pixel.png', //index-tag-f.png
            blurImage: 'Pixel.png'
        }
    ]

    var timeboolean = 1;
    var nowid = "";

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
    <%
	String nowid="";
	if(perlist.size()>0){
		nowid=programTypeList.get(0).getCode();
	%>
    var _programa_id_left_first = "<%=perlist.get(0).getCode()%>";
    var _programa_id_left_last = "<%=perlist.get(programTypeList.size()-1).getCode()%>";
    <%}%>
    
    var item_id = new Array();
    var itemid = new Array();
    var item_id_i = new Array();
    var programa_id = new Array();
    var programa_url = new Array();
    var seriesCp_cpCode = new Array();
    var seriesCp_cpCode_i = new Array();
    var history_item_id = new Array();
    var history_seriesCp_cpCode = new Array();
    var programa_id_left = "<%="".equals(programa_id)?nowid:programa_id%>";//链接参数programa_id
    var p = "<%="".equals(perv_num)?"1":perv_num%>";//链接参数perv_num
    var _programa_id_left = new Array();
    var _programa_name_left = new Array();
    var _GONOW = 'N';
    var zt_programa_id = new Array();
    var zt_programa_url = new Array();
    // 除电影外，更新至集数处理
    var UPDATE_NUM_SET=new Array()
    //广告
    var _INFO_RES ;
    var _INFO_RES_NUM =new Array();

    <%
    for(ProgramType programt:programTypeList){%>
    _programa_id_left.push('<%=programt.getCode()%>');
    _programa_name_left.push('<%=programt.getName()%>');
    <%}%> 

	
    // 全局专题id
    var _zt_id = '25ac308705da4fd189e9df3dcb087882'
    var _pf_f = "<%=pf_focus_id%>";//链接参数pf_focus_id
    //全局推荐位id 
    var _iti_id= '<%=itu_code%>';
    function F_E_PF0() {
        
        if (focus_id == 'bt_pf0') {
            //解决快速切换最热，右键无焦点
            if (_SELECT("parttwo").style.display == "none") {
                _SELECT("itempage").style.display = "none";
                _SELECT("partone").style.display = "block";
            }else{
                _SELECT("itempage").style.display = "none";
                _SELECT("partone").style.display = "none";
                _SELECT("parttwo").style.display == "block"
            }
            F_E_PF00();
            return;
        } else if (focus_id == "bt_search") {
            F_E_PF00();
            return;
        }
        if (focus_id.indexOf("bt_pf") >= 0) {
            _pf_f = focus_id;
        }
        _SELECT("itempage").style.display = "block";
        _SELECT("partone").style.display = "none";
        _SELECT("parttwo").style.display = "none";
        var bg = pf_focus_id;
        var upid = bg.replace("f", "F"); //上一个栏目对应的光标id;
        _SELECT(upid).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
        var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
        _SELECT(upwzid).style.color = "#ffffff"; //将上一个元素的字体设置为白色
        var p_id = _pf_f.replace("p", "wz");
        _SELECT(p_id).style.color = "#65c7ff"; //将当前原素的字体设置为蓝色
        var _i = _pf_f.replace("bt_pf", "");
        var imgsrc = _SELECT("bt_pF" + _i).src; //“最热”的背景图片src
        imgsrc = imgsrc.substring(imgsrc.indexOf('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'));
        if (imgsrc == "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" && focus_id != "bt_search") {
            _SELECT("bt_pF" + _i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-tag-ff.png"; //设置左侧元素对应位置的亮点效果的图片
        }
        nowid = _programa_id_left[_i]; //'';
        //	_SELECT("test").innerHTML=timeboolean;
        //	_SELECT("test2").innerHTML=_GONOW;
        if (timeboolean == 1 && _GONOW == 'N') {
            if (programa_id_left != nowid) {
                timecount(F_E_PF0, nowid);
            }
        } else {
            if (programa_id_left != nowid) {
                timeboolean = 1;
                _GONOW = 'N';
                item_id = [];
                itemid = [];
                UPDATE_NUM_SET = [];
                UPDATE_NUM_SET = [];                
                seriesCp_name = [];
                poster_name=[]
                pf_focus_id = 'bt_pf' + _i;
                F_GET_JQUERY(nowid);
                
                programa_id_left = nowid;
                var now_wzid = pf_focus_id.replace("p", "wz");
                _SELECT(now_wzid).style.color = "#65c7ff";
            }
        }
    }


    function F_E_PF00() {
        
        var bg = pf_focus_id;
        var upid = bg.replace("f", "F"); //上一个栏目对应的光标id;
        _SELECT(upid).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
        var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
        _SELECT(upwzid).style.color = "#ffffff";
        var p_id = focus_id.replace("p", "wz");
        _SELECT(p_id).style.color = "#65c7ff";
        var imgsrc = _SELECT("bt_pF0").src;
        imgsrc = imgsrc.substring(imgsrc.indexOf('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'));
        if (imgsrc == "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" && focus_id != "bt_search") {
            _SELECT("bt_pF" + 0).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-tag-ff.png";
        }
        nowid = '<%=nowid%>';
        if (timeboolean == 1 && _GONOW == 'N') {
            if (programa_id_left != nowid) {
                timecount(F_E_PF00, nowid);
            }

        } else {
            if (programa_id_left != nowid) {
                item_id = [];
                itemid = [];
                UPDATE_NUM_SET = [];
                seriesCp_name = [];
                poster_name=[]
                pf_focus_id = 'bt_pf0';
                GET_JQUERY_FIRST(nowid);
                programa_id_left = nowid;
                var now_wzid = pf_focus_id.replace("p", "wz");
                _SELECT(now_wzid).style.color = "#65c7ff";
                _GONOW = 'N';
            }
        }
    }

    var pro_num = 0;
    //判断左边第4条定点效果的切换判断条件
    var _changeLeft = 'N';

    // 左边标签执行到第4条时候执行此方法
    function F_CHANGE_LEFT() {
        
        if (_programa_id_left[8] != _programa_id_left_last) {
            //删除第一条数据，插入最后一行
            var arr1 = _programa_id_left.shift();
            _programa_id_left.push(arr1);
            var arr2 = _programa_name_left.shift();
            _programa_name_left.push(arr2);
            for (var i = 0; i < 9; i++) {
                _SELECT("bt_wzf" + i).innerHTML = _programa_name_left[i];
            }
            _changeLeft = 'Y';
        }
    }
    //判断左边第4条定点效果的切换判断条件
    var _changeLeft2 = 'N';

    // 左边标签4+时候上键
    function F_CHANGE_LEFT2() {
        
        if (_programa_id_left[0] != _programa_id_left_first) {
            var arr1 = _programa_id_left.pop();
            _programa_id_left.unshift(arr1);
            var arr2 = _programa_name_left.pop();
            _programa_name_left.unshift(arr2);
            for (var i = 0; i < 9; i++) {
                _SELECT("bt_wzf" + i).innerHTML = _programa_name_left[i];
            }
            _changeLeft2 = 'Y';
        }
    }

    function F_CHANGE_LEFT3() {
        
        for (var i = 0; i < 9; i++) {
            if (_programa_id_left[i] == '25ac308705da4fd189e9df3dcb087882') {
                //	_SELECT("im_pfjb"+i).src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/pfjb_new.png";
                _SELECT("im_pfjb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
            } else {
                _SELECT("im_pfjb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
            }
        }
    }
    var jt_display = "block";

    function F_JT() {
        
        if (_programa_id_left[8] != _programa_id_left_last) {
            _SELECT("index-icon-more").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-icon-more.png";
            jt_display = "block";
        } else {
            _SELECT("index-icon-more").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
            jt_display = "none";
        }
    }
    //  ID为bt_pfgd的focusFun执行方法
    function F_PFCHANGE() {
        
        F_CHANGE_LEFT();
        if (_changeLeft == 'Y') {
            _H_F("bt_pf4");
            _changeLeft = 'N';
        } else {
            _H_F("bt_pf5");
        }
        if (16 > 9) {
            F_JT();
        }
    }

    function F_PFCHANGE2() {
        
        F_CHANGE_LEFT2();
        if (_changeLeft2 == 'Y') {
            _H_F("bt_pf4");
            _changeLeft2 = 'N';
        } else {
            _H_F("bt_pf3");
        }
        if (16 > 9) {
            F_JT();
        }
    }
    var pageSum;

    function F_GET_JQUERY(arg) {
        
        var _arg_i = _programa_id_left.indexOf(arg);
        if (_arg_i > 8) {
            _arg_i = 0;
        }
        // 广告插入
        var _NAME_LEFT_CN = _programa_name_left[_arg_i]
        // 广告位end
        var programa_id_left_next = _programa_id_left[_arg_i];
        var parentfile = _interceptTwo(programa_id_left_next);
        // ajax区别专题url链接
        var url
        if(arg == _zt_id){
            url = webset.apiStatic + "topic/<%=programType%>/topic_1.json"
        }else if(arg == _iti_id){
            url = webset.api + "rec/itu.json?userId="+userId+"&programType=<%=programType%>&pageNo=1&pageSize=10"
        }else{
            url = webset.apiStatic + "programType/<%=programType%>/" + parentfile + "/" + programa_id_left_next + "_" + "1" + ".json";         
        }
        _arg_i++;
        // 广告插入
        _INFO_RES_NUM=[];
        _INFO_RES = GET_INFO_IN(_NAME_LEFT_CN).infoItem
        $.each(_INFO_RES,function(k,item){
            var str = _INFO_RES[k].postionId, _p_Id = str.substring(str=='010'?1:2, str.length)
            _INFO_RES_NUM.push(parseInt(_p_Id)-1)                
        })
        $.get(url, function (result) {
            var json = eval('(' + result + ')');
            //	_SELECT("itempage").innerHTML = json[0];
            p = json.res.currentPage;
            pageSum = json.res.totalPage;
            //隐藏所有右边影片
            F_NONEAllDIV();
            //F_threeDIV();
            zt_programa_id = [];
            zt_programa_url = [];
            $.each(json.res.currentPageList, function (i, item) {
                blockDiv("div_f" + i);
                poster_name.push(item.title)
                if (arg == '25ac308705da4fd189e9df3dcb087882') { //专题
                    _SELECT("bt_s" + i).src = item.posterUrl2;
                    _SELECT("bt_p" + i).innerHTML = item.title;
                    zt_programa_id.push(item.id);
                    zt_programa_url.push(item.topictemplate);
                    item_id.push(item.code);
                    itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                    
                    _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                    _SELECT("bt_sc" + i).innerHTML = "";
                    _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                } else {
                    // 广告位start
                    console.info(_INFO_RES_NUM,i)
                    if(_INFO_RES_NUM.indexOf(i)>-1){
                        var _k= _INFO_RES_NUM.indexOf(i)
                        console.info(_k)
                        _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                        _SELECT("bt_p" + i).innerHTML = _INFO_RES[_k].contentName;
                        _SELECT("bt_s" + i).src = _INFO_RES[_k].infoURL;
                        _SELECT("bt_sc" + i).innerHTML = '';
                        UPDATE_NUM_SET.push(_SELECT("bt_p" + i).innerHTML)    
                        item_id.push(item.code);                
                        return false
                    }
                    // 广告位end
                    _SELECT("bt_s" + i).src = item.imagetv;
                    if (item.bcharging == '1') {
                        _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                    } else {
                        _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                    }
                    _SELECT("bt_p" + i).innerHTML = item.title;
                    item_id.push(item.code);
                    itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                    
                    seriesCp_name.push(item.cpCode);
                    // var scores = item.seriesCp_item_score / item.seriesCp_pointPerson;
                    var score = item.score
                    if (score < 10) {
                        score = Number(score)
                        score = score.toFixed(1);
                        if (score == 0) {
                            score = 7.1;
                        }   
                    } else if (score >= 10) {
                        score = 9.9;
                    }
                    _SELECT("bt_sc" + i).innerHTML = score;
                    // _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                    //     ".png";
                }
            });
            F_threeDIV();
            if (json.res.nextPreloadPageList != "") {
                $.each(json.res.nextPreloadPageList, function (i, item) {
                    if (i < 5) {
                        blockDiv("div_b" + i);
                        if (arg == '25ac308705da4fd189e9df3dcb087882') { //专题
                            _SELECT("div_b" + i).style.backgroundImage = "url(" +
                                item.posterUrl2 + ")";
                            _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                            _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                        } else {
                            _SELECT("div_b" + i).style.backgroundImage = "url('" + item.imagetv +
                                "')";
                            if (item.bcharging == '1') {
                                _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                            } else {
                                _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                            }
                            // _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                            //     ".png";
                        }
                    }
                });
            }
            _SELECT("n_s").innerHTML = "当前第" + json.res.currentPage + "页/共" + json.res.totalPage +
                "页";

        }, false);
        FYY();
       
    }

    function GET_JQUERY_FIRST(arg) {
        
        _SELECT("itempage").style.display = "none";
        _SELECT("partone").style.display = "block";
        getHotprograma();
        getHotitems();
        FYY();
        
    }

    function initdatas() {
        
        if ("bt_pf0" == pf_focus_id || "bt_search" == focus_id || "bt_sx" == focus_id) {
            getHotprograma();
            getHotitems();
            if (focus_id.indexOf("bt_pf0") >= 0) {
                _SELECT("partone").style.display = "block";
            } else if (focus_id.indexOf("bt_lmf") >= 0) {
                _SELECT("partone").style.display = "block";
                _SELECT("parttwo").style.display = "none";
                _SELECT("itempage").style.display = "none";
            } else if (focus_id.indexOf("bt_fi") >= 0) {
                var i = parseInt(focus_id.replace("bt_fi", ""));
                if (i < 10) {
                    _SELECT("partone").style.display = "block";
                    _SELECT("parttwo").style.display = "none";
                    _SELECT("itempage").style.display = "none";
                } else {
                    _SELECT("parttwo").style.display = "block";
                    _SELECT("partone").style.display = "none";
                    _SELECT("itempage").style.display = "none";
                }
            } else if ("bt_search" == focus_id || "bt_sx" == focus_id) {
                _SELECT("partone").style.display = "block";
                _SELECT("parttwo").style.display = "none";
                _SELECT("itempage").style.display = "none";
            }
            init();
            FYY();
        } else {
            _SELECT("parttwo").style.display = "none";
            _SELECT("partone").style.display = "none";
            _SELECT("itempage").style.display = "block";
            item_id = [];
            itemid = [];
            UPDATE_NUM_SET = [];
            seriesCp_name = [];
            poster_name=[]
            zt_programa_id = [];
            zt_programa_url = [];
            var _arg_i = _programa_id_left.indexOf(programa_id_left);
            if (_arg_i > 8) {
                _arg_i = 0;
            }
            var programa_id_left_next = _programa_id_left[_arg_i];
            var parentfile = _interceptTwo(programa_id_left_next);
            
            // 广告插入
            var _NAME_LEFT_CN 
            if(p==1){_NAME_LEFT_CN = _programa_name_left[_arg_i]}
            // 广告位end
            
            
            // ajax区别专题url链接
            var url
            if( programa_id_left == _zt_id){
                url = webset.apiStatic + "topic/<%=programType%>/topic_" + p + ".json"
            }else if(programa_id_left == _iti_id){
                 url = webset.api + "rec/itu.json?userId="+userId+"&programType=<%=programType%>&pageNo="+p+"&pageSize=10"
            }else{
                 url = webset.apiStatic + "programType/<%=programType%>/" + parentfile + "/" + programa_id_left_next + "_" + p + ".json";        
            }
            _arg_i++;

            // 广告插入
            if(p==1){
                _INFO_RES_NUM=[];
                _INFO_RES = GET_INFO_IN(_NAME_LEFT_CN).infoItem
                $.each(_INFO_RES,function(k,item){
                    var str = _INFO_RES[k].postionId, _p_Id = str.substring(str=='010'?1:2, str.length)
                    _INFO_RES_NUM.push(parseInt(_p_Id)-1)                
                })
            }
            
            $.get(url, function (result) {
                var json = eval('(' + result + ')');
                //	_SELECT("itempage").innerHTML = json[0];
                p = json.res.currentPage;
                pageSum = json.res.totalPage;
                F_NONEAllDIV();
                //F_threeDIV();
                $.each(json.res.currentPageList, function (i, item) {
                    blockDiv("div_f" + i);
                    poster_name.push(item.title)
                    if (programa_id_left == '25ac308705da4fd189e9df3dcb087882') { //专题
                        _SELECT("bt_s" + i).src = item.posterUrl2;
                        _SELECT("bt_p" + i).innerHTML = item.title;
                        zt_programa_id.push(item.id);
                        zt_programa_url.push(item.topictemplate);
                        item_id.push(item.code);
                        itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                        
                        _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                        _SELECT("bt_sc" + i).innerHTML = "";
                        _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                    } else {
                        // 广告
                        if(_INFO_RES_NUM.indexOf(i)>-1){
                            var _k= _INFO_RES_NUM.indexOf(i)
                            _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                            _SELECT("bt_p" + i).innerHTML = _INFO_RES[_k].contentName;
                            _SELECT("bt_s" + i).src = _INFO_RES[_k].infoURL;
                            _SELECT("bt_sc" + i).innerHTML = '';
                            UPDATE_NUM_SET.push(_SELECT("bt_p" + i).innerHTML)  
                            item_id.push(item.code);
                            return false
                        }
                        // 广告end
                        _SELECT("bt_s" + i).src = item.imagetv;                    
                        if (item.bcharging == '1') {
                            _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                        } else {
                            _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                        }
                        _SELECT("bt_p" + i).innerHTML = item.title;
                        item_id.push(item.code);
                        itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                        
                        seriesCp_name.push(item.cpCode);
                        // var scores = item.seriesCp_item_score / item.seriesCp_pointPerson;
                        var score = item.score
                        if (score < 10) {
                            score = Number(score)
                            score = score.toFixed(1);
                            if (score == 0) {
                            score = 7.1;
                        }   
                        } else if (score >= 10) {
                            score = 9.9;
                        }
                        _SELECT("bt_sc" + i).innerHTML = score;
                        // _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                        //     ".png";
                    }
                });
                F_threeDIV();
                if (json.res.nextPreloadPageList != "") {
                    $.each(json.res.nextPreloadPageList, function (i, item) {
                        if (i < 5) {
                            blockDiv("div_b" + i);
                            if (programa_id_left == '25ac308705da4fd189e9df3dcb087882') { //专题
                                _SELECT("div_b" + i).style.backgroundImage = "url(" +
                                    item.posterUrl2 + ")";
                                _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                                _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                            } else {
                                _SELECT("div_b" + i).style.backgroundImage = "url('" + item.imagetv +
                                    "')";
                                if (item.bcharging == '1') {
                                    _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                                } else {
                                    _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                                }
                                // _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                                //     ".png";
                            }
                        }
                    });
                }
                _SELECT("n_s").innerHTML = "当前第" + json.res.currentPage + "页/共" + json.res
                    .totalPage + "页";
            }, false);
            FYY();
            
            init();
            _H_F(focus_id);
        }
        // getItemCounts();
        F_CHANGE_LEFT3();

         //*弹窗*,显示推荐会员弹窗入口
         if(<%="".equals(programa_id)?true:false%>&&'<%=programType%>'=='arts'?true:false){
            ModelPlugin.initOrder()
        }
    }
    //});
    //   最热专题海报
    function getHotprograma() {
        
    }
    //   最热数据
    function getHotitems() {
        
        itemid = [];
        UPDATE_NUM_SET = [];
        var parentfile = _interceptTwo(_programa_id_left_first);
        var url = webset.apiStatic + "programType/<%=programType%>/" + parentfile + "/" + _programa_id_left_first + "_1.json";
        $.get(url, function (result) {
            var json = eval('(' + result + ')');
            
            //分页预留
            //  p = json.res.currentPage;
            //  pageSum = json.res.totalPage;
            //隐藏所有右边影片
            $.each(json.res.currentPageList, function (i, item) {
                _SELECT("div_fi" + i).style.display = "block";
                _SELECT("bt_si" + i).src = item.imagetv;
                _SELECT("bt_pi" + i).innerHTML = item.title;
                fi_name.push(item.title);
                if (item.bcharging == '1') {
                    _SELECT("bt_jbi" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                } else {
                    _SELECT("bt_jbi" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                }
               
                if (json.res.nextPreloadPageList != "") {
                    $.each(json.res.nextPreloadPageList, function (i, item) {
                        _SELECT("div_bi" + i).style.display = "block";
                    _SELECT("div_bi" + i).style.backgroundImage = "url('" + item.imagetv + "')";
                    if (item.bcharging == '1') {
                        _SELECT("im_bi" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                    } else {
                        _SELECT("im_bi" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                    }
                    // _SELECT("im_jbi" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                    // 	".png";
                    });
                }
                item_id_i.push(item.code);
                itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                
                seriesCp_cpCode_i.push(item.cpCode);
                // var scores = item.seriesCp_item_score / item.seriesCp_pointPerson;
                var score = item.score
                if (score < 10) {
                    score = Number(score)
                    score = score.toFixed(1);
                    if (score == 0) {
                            score = 7.1;
                    }   
                } else if (score >= 10) {
                    score = 9.9;
                }
                _SELECT("bt_sci" + i).innerHTML = score;
                // _SELECT("bt_jbir" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                // 	".png";

            });
        },false);
    }

    function F_E_F0() {
        
        if (programa_id_left == '25ac308705da4fd189e9df3dcb087882') { 
            var i = parseInt(focus_id.replace('bt_f', ''));
            //专题JSP修改
            window.location.href = "special_"+zt_programa_url[i]+".jsp?back=list&programType=<%=programType%>&id=" +zt_programa_id[i] + 
                "&programa_id=" + programa_id_left +"&pf_focus_id=" +pf_focus_id +"&focus_id=" + focus_id+"&perv_num="+p+"&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>";
        } else {
            var i = parseInt(focus_id.replace('bt_f', ''));
             // 广告
             if(_INFO_RES_NUM.indexOf(i)>-1&&p==1){
                var _k= _INFO_RES_NUM.indexOf(i)
                try{
                    var _backurl = serverBaseStatic+'itv-epg/list.jsp?'+ "programType=<%=programType%>&programa_id=" + programa_id_left +"&pf_focus_id=" +pf_focus_id +"&focus_id=" + focus_id+"&perv_num="+p+"&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>"
                    var _url = _INFO_RES[_k].href
                    if(_url.indexOf('?')>-1){
                        _url = _INFO_RES[_k].href+'&backurl=' + encodeURIComponent(_backurl)
                    }else{
                        _url = _INFO_RES[_k].href+'?backurl=' + encodeURIComponent(_backurl)
                    }
                    window.location.href = _url
                }catch(e){}
                return false
            }
            // 广告end
            var _k = _programa_id_left.indexOf(programa_id_left);
            var programa_name_left = _programa_name_left[_k];
            programa_name_left = encodeURI(encodeURI(programa_name_left));
            var _programa_poster_name = poster_name[i]
            // 调起播放器参数
            var _cpcode = seriesCp_name[i],
                _code = item_id[i],
                _id = itemid[i],
                _programType='<%=programType%>',
                _programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
            //日志上报
            USER_UPDATA_LOG(itemid[i],"EPG_PROGRAM",i,_programType2+'-'+_programa_name_left[_k])        
            switch (_programType) {
                case 'anime':
                    commen_play(_id,_programType,_programType2,_code,_cpcode,"&back=list&programa_id=" + programa_id_left +"&pf_focus_id=" +pf_focus_id +"&focus_id=" + focus_id+"&perv_num="+p+"&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>");
                    break;
                default:
                    window.location.href = "detail<%=programType.equals("documentary")?"_tv":"_"+programType%>.jsp?back=list&programType=<%=programType%>&code=" + item_id[i] + "&id=" + itemid[i] +
                "&cpcode=" + seriesCp_name[i]+ "&programa_id=" + programa_id_left +"&programa_name=" + programa_name_left+"&pf_focus_id=" +pf_focus_id +"&focus_id=" + focus_id+"&perv_num="+p+"&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>";
            }
            

        }
    }

    function F_E_F0_i() {
        
        var i = parseInt(focus_id.replace('bt_fi', ''));
        var programa_name_left = _programa_name_left[0];
        programa_name_left = encodeURI(encodeURI(programa_name_left));
        var _programa_poster_name =  fi_name[i]
        // 调起播放器参数
        var _cpcode = seriesCp_cpCode_i[i],
                _code = item_id_i[i],
                _id = itemid[i],
                _programType='<%=programType%>',
                _programType2='<%=HttpLinkUtils.getProgramType_ZH(programType)%>';
        //日志上报
        USER_UPDATA_LOG(itemid[i],"EPG_PROGRAM",i,_programType2+'-'+_programa_name_left[0])        
        switch (_programType) {
            case 'anime':
                var _stat="影视聚合-动画-"+ decodeURI(decodeURI(programa_name_left))+"-"+_programa_poster_name;
                setTimeout("_STAT('"+_stat+"')", 1);
                commen_play(_id,_programType,_programType2,_code,_cpcode,"back=list&programa_id=" + programa_id_left +"&pf_focus_id=" +pf_focus_id +"&focus_id=" + focus_id+"&perv_num="+p+"&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>");
                break;
            default:
                window.location.href = "detail<%=programType.equals("documentary")?"_tv":"_"+programType%>.jsp?back=list&programType=<%=programType%>&code=" + item_id_i[i] + "&id=" + itemid[i] +
            "&cpcode=" + seriesCp_cpCode_i[i]+ "&programa_id=" + programa_id_left +"&programa_name=" + programa_name_left + "&pf_focus_id=" +pf_focus_id +"&focus_id=" + focus_id+"&perv_num="+p+"&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>";
        }
    }

    function F_TOHOT_ZT() {
        
        var i = parseInt(focus_id.replace('bt_lmf', ''));
        //专题JSP修改
        window.location.href = "special_"+programa_url[i]+".jsp?back=list&programType=<%=programType%>&id=" +programa_id[i] + 
                "&programa_id=" + programa_id_left +"&pf_focus_id=" +pf_focus_id +"&focus_id=" + focus_id+"&perv_num="+p+"&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>";
    }
    //获得焦点处理事件 向上翻页
    function F_KEY_G_2() {
        
        if ((p - 1) > 0) {
            item_id = [];
            itemid = [];
            UPDATE_NUM_SET = [];
            seriesCp_name = [];
            poster_name=[]
            zt_programa_id = [];
            zt_programa_url = [];
            var _arg_i = _programa_id_left.indexOf(programa_id_left);
            if (_arg_i > 8) {
                _arg_i = 0;
            }
            var programa_id_left_next = _programa_id_left[_arg_i];
            var parentfile = _interceptTwo(programa_id_left_next);

             var _NAME_LEFT_CN //广告坐标
            if((p - 1)==1){_NAME_LEFT_CN = _programa_name_left[_arg_i]}


            // ajax区别专题url链接
            var url
            if( programa_id_left == _zt_id){
                url = webset.apiStatic + "topic/<%=programType%>/topic_" + (p - 1) + ".json" 
            }else if(programa_id_left == _iti_id){
                 url = webset.api + "rec/itu.json?userId="+userId+"&programType=<%=programType%>&pageNo="+(p - 1)+"&pageSize=10"
            }else{
                url = webset.apiStatic + "programType/<%=programType%>/" + parentfile + "/" + programa_id_left_next + "_" + (p - 1) +".json"       
            }
            _arg_i++;
            
            // 广告插入
            _INFO_RES_NUM=[];
            if((p - 1)==1){
                _INFO_RES = GET_INFO_IN(_NAME_LEFT_CN).infoItem
                $.each(_INFO_RES,function(k,item){
                    var str = _INFO_RES[k].postionId, _p_Id = str.substring(str=='010'?1:2, str.length)
                    _INFO_RES_NUM.push(parseInt(_p_Id)-1)                
                })
            }

            
            $.get(url, function (result) {
                var json = eval('(' + result + ')');
                p = json.res.currentPage;
                pageSum = json.res.totalPage;
                F_NONEAllDIV();
                //F_threeDIV();
                $.each(json.res.currentPageList, function (i, item) {
                    blockDiv("div_f" + i);
                    poster_name.push(item.title)
                    if (programa_id_left == '25ac308705da4fd189e9df3dcb087882') { //专题
                        _SELECT("bt_s" + i).src = item.posterUrl2;
                        _SELECT("bt_p" + i).innerHTML = item.title;
                        zt_programa_id.push(item.id);
                        zt_programa_url.push(item.topictemplate);
                        item_id.push(item.code);
                        itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                        
                        _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                        _SELECT("bt_sc" + i).innerHTML = "";
                        _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                    } else {
                        // 广告
                        if(_INFO_RES_NUM.indexOf(i)>-1){
                            var _k= _INFO_RES_NUM.indexOf(i)
                            _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                            _SELECT("bt_p" + i).innerHTML = _INFO_RES[_k].contentName;
                            _SELECT("bt_s" + i).src = _INFO_RES[_k].infoURL;
                            _SELECT("bt_sc" + i).innerHTML = '';
                            UPDATE_NUM_SET.push(_SELECT("bt_p" + i).innerHTML)  
                            item_id.push(item.code);
                            return false
                        }
                        // 广告end
                        _SELECT("bt_s" + i).src = item.imagetv;
                        if (item.bcharging == '1') {
                            _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                        } else {
                            _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                        }
                        _SELECT("bt_p" + i).innerHTML = item.title;
                        item_id.push(item.code);
                        itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                        
                        seriesCp_name.push(item.cpCode);
                        // var scores = item.seriesCp_item_score / item.seriesCp_pointPerson;
                        var score = item.score
                        if (score < 10) {
                            score = Number(score)
                            score = score.toFixed(1);
                            if (score == 0) {
                            score = 7.1;
                        }   
                        } else if (score >= 10) {
                            score = 9.9;
                        }
                        _SELECT("bt_sc" + i).innerHTML = score;
                        // _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                        //     ".png";
                    }
                });
                F_threeDIV();
                if (json.res.nextPreloadPageList != "") {
                    $.each(json.res.nextPreloadPageList, function (i, item) {
                        if (i < 5) {
                            blockDiv("div_b" + i);
                            if (programa_id_left == '25ac308705da4fd189e9df3dcb087882') { //专题
                                _SELECT("div_b" + i).style.backgroundImage = "url(" +
                                    item.posterUrl2 + ")";
                                _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                                _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                            } else {
                                _SELECT("div_b" + i).style.backgroundImage = "url('" + item.imagetv +
                                    "')";
                                if (item.bcharging == '1') {
                                    _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                                } else {
                                    _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                                }
                                // _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                                //     ".png";
                            }
                        }
                    });
                }
                _SELECT("n_s").innerHTML = "当前第" + json.res.currentPage + "页/共" + json.res
                    .totalPage + "页";
            }, false);
            FYY();
            
            var i = parseInt(pf_f.replace('bt_f', ''));
            
            if (item_id.length > i) {
                _H_F("bt_f" + i);
            } else {
                _H_F("bt_f" + (item_id.length - 1));
            }
        } else {
            var i = parseInt(pf_focus_id.replace('bt_pf', ''));
            
            var j = i - 1;
            if (j < 0) {
                _H_F(pf_f);
                return;
                //	j=15;
            } else {
                if (j == 0) {
                    _SELECT("itempage").style.display = "none";
                    _SELECT("partone").style.display = "block";
                    focus_id = "bt_pf0";
                    F_E_PF0();
                    _H_F("bt_fi0");
                } else {
                    item_id = [];
                    itemid = [];
                    UPDATE_NUM_SET = [];
                    seriesCp_name = [];
                    poster_name=[]
                    _GONOW = 'Y';
                    SWITCHFUN(j);
                }
            }
        }
    }
    //获得焦点处理事件 向下翻页
    function F_KEY_G_3() {
        
        _SELECT("partone").style.display = "none";
        _SELECT("parttwo").style.display = "none";
        _SELECT("itempage").style.display = "block";
        if ((p + 1) <= pageSum) {
            item_id = [];
            itemid = [];
            UPDATE_NUM_SET = [];
            seriesCp_name = [];
            poster_name=[]
            zt_programa_id = [];
            zt_programa_url = [];
            var _arg_i = _programa_id_left.indexOf(programa_id_left);
            if (_arg_i > 8) {
                _arg_i = 0;
            }
            var programa_id_left_next = _programa_id_left[_arg_i];
            var parentfile = _interceptTwo(programa_id_left_next);
            // var url = webset.apiStatic + "programType/film/" + parentfile + "/" + programa_id_left_next + "_" + (p + 1) +
            //     ".json";
            // ajax区别专题url链接
            var url
            if( programa_id_left == _zt_id){
                url = webset.apiStatic + "topic/<%=programType%>/topic_" + (p + 1) + ".json" 
            }else if(programa_id_left == _iti_id){
                 url = webset.api + "rec/itu.json?userId="+userId+"&programType=<%=programType%>&pageNo="+(p + 1)+"&pageSize=10"
            }else{
                url = webset.apiStatic + "programType/<%=programType%>/" + parentfile + "/" + programa_id_left_next + "_" + (p + 1) +".json";       
            }
            _arg_i++;
            $.get(url, function (result) {
                var json = eval('(' + result + ')');
                //	_SELECT("itempage").innerHTML = json[0];
                p = json.res.currentPage;
                pageSum = json.res.totalPage;
                F_NONEAllDIV();
                //F_threeDIV();
                $.each(json.res.currentPageList, function (i, item) {
                    blockDiv("div_f" + i);
                    poster_name.push(item.title)
                    if (programa_id_left == '25ac308705da4fd189e9df3dcb087882') { //专题
                        _SELECT("bt_s" + i).src = item.posterUrl2;
                        _SELECT("bt_p" + i).innerHTML = item.title;
                        zt_programa_id.push(item.id);
                        zt_programa_url.push(item.topictemplate);
                        item_id.push(item.code);
                        itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                        
                        _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                        _SELECT("bt_sc" + i).innerHTML = "";
                        _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                    } else {
                        _SELECT("bt_s" + i).src = item.imagetv;
                        
                        if (item.bcharging == '1') {
                            _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                        } else {
                            _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                        }
                        _SELECT("bt_p" + i).innerHTML = item.title;
                        item_id.push(item.code);
                        itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                        
                        seriesCp_name.push(item.cpCode);
                        // var scores = item.seriesCp_item_score / item.seriesCp_pointPerson;
                        var score = item.score
                        if (score < 10) {
                            score = Number(score)
                            score = score.toFixed(1);
                            if (score == 0) {
                            score = 7.1;
                        }   
                        } else if (score >= 10) {
                            score = 9.9;
                        }
                        _SELECT("bt_sc" + i).innerHTML = score;
                        // _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                        //     ".png";
                    }
                });
                F_threeDIV();
                if (json.res.nextPreloadPageList != "") {
                    $.each(json.res.nextPreloadPageList, function (i, item) {
                        if (i < 5) {
                            blockDiv("div_b" + i);
                            if (programa_id_left == '25ac308705da4fd189e9df3dcb087882') { //专题
                                _SELECT("div_b" + i).style.backgroundImage = "url(" +
                                    item.posterUrl2 + ")";
                                _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                                _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                            } else {
                                _SELECT("div_b" + i).style.backgroundImage = "url('" + item.imagetv +
                                    "')";
                                if (item.bcharging == '1') {
                                    _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                                } else {
                                    _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                                }
                                // _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                                //     ".png";
                            }
                        }
                    });
                }
                _SELECT("n_s").innerHTML = "当前第" + json.res.currentPage + "页/共" + json.res
                    .totalPage + "页";
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
         
        } else {
            var i = parseInt(pf_focus_id.replace('bt_pf', ''));
            var j = i + 1;

            if(programa_id_left==_programa_id_left_last){
                _H_F(pf_focus_id) //处理末标签末页的焦点
                return            
            }
            item_id = [];
            itemid = [];
            UPDATE_NUM_SET = [];
            seriesCp_name = [];
            poster_name=[]
            _GONOW = 'Y';
            SWITCHFUN(j);
        }
    }

    function F_KEY_GO_PAGE(index1) {
        
        if (index1 > 0) {
            _SELECT("partone").style.display = "none";
            _SELECT("parttwo").style.display = "none";
            _SELECT("itempage").style.display = "block";
            item_id = [];
            itemid = [];
            UPDATE_NUM_SET = [];
            seriesCp_name = [];
            poster_name=[]
            zt_programa_id = [];
            zt_programa_url = [];
            var _arg_i = _programa_id_left.indexOf(programa_id_left);
            if (_arg_i > 8) {
                _arg_i = 0;
            }

            var programa_id_left_next = _programa_id_left[_arg_i];
            var parentfile = _interceptTwo(programa_id_left_next);
            var url
            if( programa_id_left == _zt_id){
                url = webset.apiStatic + "topic/<%=programType%>/topic_" + index1 + ".json"
            }else if(programa_id_left == _iti_id){
                 url = webset.api + "rec/itu.json?userId="+userId+"&programType=<%=programType%>&pageNo="+(p + 1)+"&pageSize=10"
            }else{
                url = webset.apiStatic + "programType/<%=programType%>/" + parentfile + "/" + programa_id_left_next + "_" + index1 +".json";       
            }
            _arg_i++;

            $.get(url, function (result) {
                var json = eval('(' + result + ')');
                //	_SELECT("itempage").innerHTML = json[0];
                p = json.res.currentPage;
                pageSum = json.res.totalPage;
                F_NONEAllDIV();
                //F_threeDIV();
                $.each(json.res.currentPageList, function (i, item) {
                    blockDiv("div_f" + i);
                    poster_name.push(item.title)
                    if (programa_id_left == '25ac308705da4fd189e9df3dcb087882') { //专题
                        _SELECT("bt_s" + i).src = item.posterUrl2;
                        _SELECT("bt_p" + i).innerHTML = item.title;
                        zt_programa_id.push(item.id);
                        zt_programa_url.push(item.topictemplate);
                        item_id.push(item.code);
                        itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                        
                        _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                        _SELECT("bt_sc" + i).innerHTML = "";
                        _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                    } else {
                        _SELECT("bt_s" + i).src = item.imagetv;
                        
                        if (item.bcharging == '1') {
                            _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                        } else {
                            _SELECT("bt_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                        }
                        _SELECT("bt_p" + i).innerHTML = item.title;
                        item_id.push(item.code);
                        itemid.push(item.id);
                    UPDATE_NUM_SET.push(NUM_TRANS_F(item.currentCount,item.volumnCount,'<%=programType%>'))                        
                        seriesCp_name.push(item.cpCode);
                        // var scores = item.seriesCp_item_score / item.seriesCp_pointPerson;
                        var score = item.score
                        if (score < 10) {
                            score = Number(score)
                            score = score.toFixed(1);
                            if (score == 0) {
                            score = 7.1;
                        }   
                        } else if (score >= 10) {
                            score = 9.9;
                        }
                        _SELECT("bt_sc" + i).innerHTML = score;
                        // _SELECT("bt_jbr" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                        //     ".png";
                    }
                });
                F_threeDIV();
                if (json.res.nextPreloadPageList != "") {
                    $.each(json.res.nextPreloadPageList, function (i, item) {
                        if (i < 5) {
                            blockDiv("div_b" + i);
                            if (programa_id_left == '25ac308705da4fd189e9df3dcb087882') { //专题
                                _SELECT("div_b" + i).style.backgroundImage = "url(" +
                                    item.posterUrl2 + ")";
                                _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                                _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
                            } else {
                                _SELECT("div_b" + i).style.backgroundImage = "url('" + item.imagetv +
                                    "')";
                                if (item.bcharging == '1') {
                                    _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-hy.png";
                                } else {
                                    _SELECT("im_b" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/poster-mf.png";
                                }
                                // _SELECT("im_jb" + i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/jb_" + item.item_corner +
                                //     ".png";
                            }
                        }
                    });
                }
                _SELECT("n_s").innerHTML = "当前第" + json.res.currentPage + "页/共" + json.res
                    .totalPage + "页";
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
        var _ii = parseInt(focus_id.replace('bt_f', ''));
        if('<%=programType%>'!='film'){
            _SELECT(focus_id.replace('f', 'p')).innerHTML = UPDATE_NUM_SET[_ii]
        }
        var bg = pf_focus_id.replace('pf', 'pd');
        var lm_id = pf_focus_id.replace("f", "F");
        _SELECT(lm_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-tag-ff.png';
        var p_id = pf_focus_id.replace("p", "wz");
        _SELECT(p_id).style.color = "#65c7ff";
    }

    function F_B_F00() {
        
        _SELECT(focus_id.replace('f', 'p')).innerHTML = '' + item_name + "";
    }

    function F_E_RF0() {
        
        pf_f = focus_id;
    }

    function F_B_F0() {}

    var pf_focus_id = '<%=pf_focus_id%>';//链接参数pf_focus_id
    var focus_id = '<%=focus_id%>';//链接参数focus_id
    var pf_f = '<%=pf_focus_id%>';//链接参数pf_focus_id

    function F_KEY_G_1() {
        
        DOBUTTONENTERFUN(focus_id);
    }

    function F_E_BLUR0() {
        if(focus_id!='bt_pf0'){
            fi_name = []       
        }
        var p_id = focus_id.replace("p", "wz");
        _SELECT(p_id).style.color = "#ffffff";
        //_SELECT("bt_pF"+).className="";
        var _i = focus_id.replace("bt_pf", "");
        if (focus_id.indexOf("bt_pf") >= 0) {
            _SELECT("bt_pF" + _i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
        }
    }

    function F_TOSEARCH() {
        // window.location.href = "action.jsp?action=search&back=index&record=no&prev_focus_id=" + focus_id;
        window.location.href = "search.jsp?back=list&programType=<%=programType%>&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>";
    //programa_id参数获取
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
        
        F_E_PFF(i);
        return;
       
    }


    function F_E_PFO0() {
        
        var bg = pf_focus_id;
        _SELECT(bg).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png';
        var upid = bg.replace("f", "F"); //上一个栏目对应的光标id;
        _SELECT(upid).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
        var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
        _SELECT(upwzid).style.color = "#ffffff";
        if (focus_id != 'bt_prev_f') {
            var p_id = focus_id.replace("p", "wz");
            _SELECT(p_id).style.color = "#65c7ff";
        }
        var imgsrc = _SELECT("bt_pF0").src;
        imgsrc = imgsrc.substring(imgsrc.indexOf('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'));
        if (imgsrc == "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" && focus_id != "bt_search") {
            _SELECT("bt_pF" + 0).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-tag-ff.png";
        }
        nowid = '<%=nowid%>';
        if (programa_id_left != nowid) {
            item_id = [];
            itemid = [];
            UPDATE_NUM_SET = [];
            seriesCp_name = [];
            poster_name=[]
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
            _GONOW == 'N'
        }
    }

    function F_E_PFF(_i) {
        
        if (_i == 0) {
            F_E_PFO0();
            return;
        }
        var bg = pf_focus_id;
        _SELECT(bg).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png';
        var upid = bg.replace("f", "F"); //上一个栏目对应的光标id;
        _SELECT(upid).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png";
        var upwzid = bg.replace("p", "wz"); //上一个栏目对应的文字id;
        _SELECT(upwzid).style.color = "#ffffff";
        if (focus_id != 'bt_prev_f') {
            var p_id = focus_id.replace("p", "wz");
            _SELECT(p_id).style.color = "#65c7ff";
        }
        var imgsrc = _SELECT("bt_pF" + _i).src;
        //alert(imgsrc);
        imgsrc = imgsrc.substring(imgsrc.indexOf('http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/'));
        if (imgsrc == "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" && focus_id != "bt_search") {
            _SELECT("bt_pF" + _i).src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-tag-ff.png";
        }
        //	alert(_programa_name_left[_i]);
        nowid = _programa_id_left[_i]; //'';
        if (programa_id_left != nowid) {
            item_id = [];
            itemid = [];
            UPDATE_NUM_SET = [];
            seriesCp_name = [];
            poster_name=[]
            pf_focus_id = 'bt_pf' + _i;
            F_GET_JQUERY(nowid);
            programa_id_left = nowid;
            var now_wzid = pf_focus_id.replace("p", "wz");
            _SELECT(now_wzid).style.color = "#65c7ff";
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
            //_H_F("bt_f0");
            _GONOW == 'N'
        } else {
            var i = parseInt(pf_f.replace('bt_f', ''));
            
            _H_F("bt_f" + i);

        }
    }

    function F_NONEAllDIV() { //隐藏所有节目
        
        for (var i = 0; i < 10; i++) {
            noneDiv("div_f" + i);
        }
    }

    function F_threeDIV() {
        
        for (var i = 0; i < 5; i++) {
            noneDiv("div_b" + i);
        }
    }
    //partone第一行的最后一个模块向右的时候跳parttwo的第一行的最后一个
    function F_F_PFG_E() {
        
        _SELECT("partone").style.display = "none";
        _SELECT("parttwo").style.display = "block";
        
        if ("bt_fi5" == pf_f) {
            _H_F("bt_fi10");
        } else if ("bt_fi6" == pf_f) {
            _H_F("bt_fi11");
        } else if ("bt_fi7" == pf_f) {
            _H_F("bt_fi12");
        } else if ("bt_fi8" == pf_f) {
            _H_F("bt_fi13");
        } else if ("bt_fi9" == pf_f) {
            _H_F("bt_fi14");
        }
    }
    //partone第一行的任一模块向下的时候跳parttwo的第一行的对应的位置触发，进入S_F(),改变跳转后对应位置的样式

    function F_F_PFG_G() {
        
        _SELECT("partone").style.display = "block";
        _SELECT("parttwo").style.display = "none";
        
        if ("bt_fi10" == pf_f) {
            _H_F("bt_fi5");
        } else if ("bt_fi11" == pf_f) {
            _H_F("bt_fi6");
        } else if ("bt_fi12" == pf_f) {
            _H_F("bt_fi7");
        } else if ("bt_fi13" == pf_f) {
            _H_F("bt_fi8");
        } else if ("bt_fi14" == pf_f) {
            _H_F("bt_fi9");
        }
    }

    var item_name_i = '';

    function F_E_RF_I() {
        
        pf_f = focus_id;
        item_name_i = _SELECT(focus_id.replace('f', 'p')).innerHTML;
        if (item_name_i.length > 6) {
            _SELECT(focus_id.replace('f', 'p')).innerHTML = '<marquee direction="left">' + item_name_i +
                "</marquee>";
        }
        var _ii = parseInt(focus_id.replace('bt_fi', ''));        
        if('<%=programType%>'!='film'){
            _SELECT(focus_id.replace('f', 'p')).innerHTML = UPDATE_NUM_SET[_ii]
        }
        var bg = pf_focus_id.replace('pf', 'pd');
        var lm_id = pf_focus_id.replace("f", "F");
        _SELECT(lm_id).src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-tag-ff.png';
        var p_id = pf_focus_id.replace("p", "wz");
        _SELECT(p_id).style.color = "#65c7ff";
    }

    function F_B_F00_I() {
        
        _SELECT(focus_id.replace('f', 'p')).innerHTML = '' + item_name_i + "";
    }

    function F_F_PFG_H() {
        
        if (_SELECT("partone").style.display == "block") {
            _H_F("bt_fi0");
        } else if (_SELECT("parttwo").style.display == "block") {
            _H_F("bt_fi10");
        }
    }

    function F_LM() {
        
        _SELECT("bt_pF0").src = 'http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-tag-ff.png';
        _SELECT("bt_wzf0").style.color = "#65c7ff";
    }
    //parttwo的第二行的任一元素向下时跳转到itemtemplate的第一行的对应位置执行相关处理

    function F_F_PFG_I() {
        
        _SELECT("partone").style.display = "none";
        _SELECT("parttwo").style.display = "none";
        _SELECT("itempage").style.display = "block";
        focus_id = "bt_pf1";
        var pf_f2 = pf_f;
        SWITCHFUN(1);
        //focus_id="bt_f0";
        var i = parseInt(pf_f2.replace("bt_fi", ""));
        
        i = i - 15;
        _H_F("bt_f" + i);
    }



    function F_TOSX() {
        window.location.href = "filter.jsp?back=list&programType=<%=programType%>&home_focus_id=<%=home_focus_id%>&home_from=<%=home_from%>&backUrl=<%=backUrl_encode%>";
    // programa_id参数获取
    }

    function SX_FOCUS() {
        
        _SELECT("sx_img").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-filter-f.png";
    }

    function SX_BLUR() {
        
        _SELECT("sx_img").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-icon-filter.png";
    }

    function SS_FOCUS() {
        
        _SELECT("ss_img").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-search-f.png";
    }

    function SS_BLUR() {
        
        _SELECT("ss_img").src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-icon-search.png";
    }

    ////////////////////////////分割线
    var lmf_name = new Array();
    var fi_name = new Array();
    var seriesCp_name = new Array();
    var poster_name = new Array();
    var callback = function (intent) {
            var _command = intent['_command'];
            if (_command == '_PAGE') {
                var action = intent['_action'];
                if (action == 'NEXT') {//跳到下一页
                    fi_name.length==0?_command = "bt_next_f":_command = "bt_pdg_i"
                } else if (action == 'PREV') {//跳到上一页
                    _command = "bt_prev_f";
                } else if (action == 'INDEX') {//跳到指定页
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
        
        <%
	    	String textc="";
            String txtb="";
	    	for(int i=0;i<programTypeList.size();i++){
	    		ProgramType pt= programTypeList.get(i);
	    		textc+="\"bt_pf"+i+"\": [\""+pt.getName()+"\"],";
	    		txtb+="\"bt_pf"+i+"\": '跳到"+pt.getName()+"',";
	    		if(i==8){break;}
	    	}
	  	%>  
        var scene = {
            _scene: "com.iflytek.xiri.MGTV",//场景标识，命名规则为前面是应用包名，后面是场景名
            _commands: {//命令描述，包含发回给应用的命令和说法，以键值对形式存储
            	<%=textc%>
		   		"bt_lmf0": ["" + lmf_name[0] + ""],
                "bt_lmf1": ["" + lmf_name[1] + ""],
                "bt_lmf2": ["" + lmf_name[2] + ""],
                "bt_fi0": ["" + fi_name[0] + ""],
                "bt_fi1": ["" + fi_name[1] + ""],
                "bt_fi2": ["" + fi_name[2] + ""],
                "bt_fi3": ["" + fi_name[3] + ""],
                "bt_fi4": ["" + fi_name[4] + ""],
                "bt_fi5": ["" + fi_name[5] + ""],
                "bt_fi6": ["" + fi_name[6] + ""],
                "bt_fi7": ["" + fi_name[7] + ""],
                "bt_fi8": ["" + fi_name[8] + ""],
                "bt_fi9": ["" + fi_name[9] + ""],
                "bt_fi10": ["" + fi_name[10] + ""],
                "bt_fi11": ["" + fi_name[11] + ""],
                "bt_fi12": ["" + fi_name[12] + ""],
                "bt_fi13": ["" + fi_name[13] + ""],
                "bt_fi14": ["" + fi_name[14] + ""],
                "bt_f0": ["" + poster_name[0] + ""],
                "bt_f1": ["" + poster_name[1] + ""],
                "bt_f2": ["" + poster_name[2] + ""],
                "bt_f3": ["" + poster_name[3] + ""],
                "bt_f4": ["" + poster_name[4] + ""],
                "bt_f5": ["" + poster_name[5] + ""],
                "bt_f6": ["" + poster_name[6] + ""],
                "bt_f7": ["" + poster_name[7] + ""],
                "bt_f8": ["" + poster_name[8] + ""],
                "bt_f9": ["" + poster_name[9] + ""],
                "bt_search": ["搜索"],
                "bt_sx": ["筛选"],
                "_PAGE": ["$P(_PAGE)"],//预定义槽
                "bt_prev_f": ["上一页"],
                "bt_next_f": ["下一页"],
                "test1": ["测试1"],
                "test2": ["测试2"]
            },
            _feedbacks: {//回显信息，其中键是"_commands"中key，值为要会显的信息字符串（预定义槽无需提供回显信息）。

                <%=txtb%>

                "bt_lmf0": '打开' + lmf_name[0] + '',
                "bt_lmf1": '打开' + lmf_name[1] + '',
                "bt_lmf2": '打开' + lmf_name[2] + '',
                "bt_fi0": '打开' + fi_name[0] + '',
                "bt_fi1": '打开' + fi_name[1] + '',
                "bt_fi2": '打开' + fi_name[2] + '',
                "bt_fi3": '打开' + fi_name[3] + '',
                "bt_fi4": '打开' + fi_name[4] + '',
                "bt_fi5": '打开' + fi_name[5] + '',
                "bt_fi6": '打开' + fi_name[6] + '',
                "bt_fi7": '打开' + fi_name[7] + '',
                "bt_fi8": '打开' + fi_name[8] + '',
                "bt_fi9": '打开' + fi_name[9] + '',
                "bt_fi10": '打开' + fi_name[10] + '',
                "bt_fi11": '打开' + fi_name[11] + '',
                "bt_fi12": '打开' + fi_name[12] + '',
                "bt_fi13": '打开' + fi_name[13] + '',
                "bt_fi14": '打开' + fi_name[14] + '',
                "bt_f0": '打开' + poster_name[0] + '',
                "bt_f1": '打开' + poster_name[1] + '',
                "bt_f2": '打开' + poster_name[2] + '',
                "bt_f3": '打开' + poster_name[3] + '',
                "bt_f4": '打开' + poster_name[4] + '',
                "bt_f5": '打开' + poster_name[5] + '',
                "bt_f6": '打开' + poster_name[6] + '',
                "bt_f7": '打开' + poster_name[7] + '',
                "bt_f8": '打开' + poster_name[8] + '',
                "bt_f9": '打开' + poster_name[9] + '',
                "bt_search": '搜索',
                "bt_sx": '筛选',
                "bt_prev_f": '上一页',
                "bt_next_f": '下一页',
                "test1": '为你测试1',
                "test2": '为你测试2'
            }
        };
        
       
        listener.regist(scene);//注册scene(公用实体---当前场景信息）
    }
   
    function _STAT(_stat) { //用户点击行为上报
	    _stat = encodeURI(encodeURI(_stat));
	    var _url = 'http://sta.jisu8.cn/stat?category=' + _stat +'&contid=&style=&label=&id=6955&action=click&account='+userId+'&plat=&vlauncher=&vterminal=';
	    _SELECT('stat').src = _url;
    }
    ////////////////////////////
    function initjt() {
		
        F_JT()
    }
</script>
<script type="text/javascript">
    initjt();
    
</script>

</html>
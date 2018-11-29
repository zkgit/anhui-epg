<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
 	String action= RequestUtil.getString("t", request);
%>
<script src="config/config.js" type="text/javascript"></script>
<script src="js/public_animation.js" type="text/javascript"></script>
<script src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/ajax.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/js/webxiri_1.0.8.js"></script>
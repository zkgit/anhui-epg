<%@page import="com.vstartek.epg.utils.RequestUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String programType=RequestUtil.getString("programType", request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta name="page-view-size" content="1280*720">
	<title>Welcome</title>
	<style>
		a,area {
			blr: expression(this.onFocus=this.blur());
			cursor: pointer;
		}

		/* for IE */
		:focus {
			-moz-outline-style: none;
		}

		/* for Firefox */

		a {
			outline: none;
		}

		a:link,
		a:visited,
		a:hover,
		a:active {
			blr: expression(this.onFocus=this.blur());
		}
	</style>
	<script type="text/javascript">
		function F_KEY_G_0() {
			window.location.href = "exit.jsp?programType=<%=programType%>";
		}
	</script>
</head>

<body >
	<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/error-bg.jpg" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;">
	<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/error-xk.png" style="position:absolute;left:330px;top:200px;">
	<img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/error-back.png" style="position:absolute;left:550px;top:430px;">
	<div style="position:absolute;left:470px;top:250px; z-index:1;">
		<div style="position:relative; left:0px; top:20px; width:380px; text-align:center; font-size:25px;font-family:微软雅黑; font-weight:600; color:#ffffff; overflow:hidden; margin:0; padding:0;">对不起，该节目加载失败</div>
		<div style="position:relative; left:-50px; top:50px; width:480px; text-align:center; font-size:25px;font-family:微软雅黑; font-weight:600; color:#ffffff; overflow:hidden; margin:0; padding:0;">请尝试重新加载或观看其他精彩内容！500</div>
	</div>
	<div style="position:absolute;left:210px; top:220px;">
	</div>
	<a id="a0" href="javascript:F_KEY_G_0()" style="position:absolute;left:247px; top:280px;">
		<img id="img0" src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/Pixel.png" border="0" width="1" height="1">
	</a>
	<script type="text/javascript">
		document.getElementById('a0').focus();
	</script>


</body>

</html>
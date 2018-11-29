<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<body>
	<script type="text/javascript" src="http://epgpic.itvengine.com.lv1.vcache.cn/itv-epg/js/jquery.min.js"></script>
	<script type="text/javascript" src="config/config.js"></script>
	<script>
	//在android代码中调用此方法  
	function showInfoFromJava(msg){
		var stbModel = "";
		try {
		    stbModel = Authentication.CTCGetConfig("stbModel");
		} catch (ex) {}
		//android退出时调用此方法，H5拿到传入值做出相应的处理
		var url=webset.api+"usr/demand_bofangqi.json";
		$.post(url,{"msg":msg,"stbModel":stbModel}, function (result) {
			
		});
	}  
    </script>    
</body>
</html>

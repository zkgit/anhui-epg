<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="1280*720 text/html; charset=utf-8" />
    <script type="text/javascript" src="js/public.js"></script>
    <style type="text/css">
        .p0 {
            font-size: 20px
        }

        .p1 {
            font-size: 20px
        }
    </style>
</head>

<body>
    <img src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/bg1.png" style="position:absolute;left:0px;top:0px;width:1280px;height:720px;">
   
    <div id='DIV_F' style='position:absolute;left:0px; top:0px;z-index:11'>
        <img id='IMG_F' src="http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/index-tag-f.png">
    </div>
    <div style="position:absolute; left:506px; top:0px; text-align:center; font-size:40px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;">统一播放器测试入口</div>
    <div id="input" style="position:absolute; left:506px;right: auto; top:200px;border: 1px solid #fff;width: 300px;height: 50px; text-align:center; font-size:40px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:0;"></div>    
    <div id="submit" style="position:absolute; left:584px; top:300px; text-align:center; font-size:32px;font-family:微软雅黑; font-weight:normal; color:#ffffff; overflow:hidden; margin:0; padding:14px 46px 0px;">确定</div>
</body>
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
        }     
    };
    var gb = _SELECT("submit");
    _SELECT("DIV_F").style.left = gb.getBoundingClientRect().left+"px";
    _SELECT("DIV_F").style.top = gb.getBoundingClientRect().top+"px";
    var i=1
    var e=1
    var max 
    function F_KEY_G_5(){
        noneDiv("DIV_F") ;
        _SELECT("input").style.border="1px solid #00ff0c";
        e++
    }
    function F_KEY_G_7(){
        blockDiv("DIV_F") ;
        _SELECT("input").style.border="1px solid #fff";
        i++
        max =i*e
        
    }
    function F_KEY_G_1(){
        if(max==10){
            window.location.href = "./TEST_F_T_A_C_D.html?programType=tv&v=<%=System.currentTimeMillis() %>";
        }
        if(max==12){
            window.location.href = "./TEST_F_T_A_C_D.html?programType=tv&v=<%=System.currentTimeMillis() %>";
        }
        if(max==14){
            window.location.href = "./stbxmpp-2.0/index_itv.html?v=<%=System.currentTimeMillis() %>";
        } 
    }

    

</script>
</html>

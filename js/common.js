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

function visitRecord() {
    document.getElementById('visitRecord').width = 0;
    document.getElementById('visitRecord').height = 0;
    var t = (new Date()).valueOf();
    document.getElementById('visitRecord').src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/record.png?action=visitRecord&t=" + t + "&record=yes&programa_id=&item_id=";
}

function visitUrlRecord() {
    var visitPathname = window.location.pathname;
    visitPathname = encodeURIComponent(encodeURIComponent(visitPathname));
    var visitSearch = window.location.search;
    visitSearch = encodeURIComponent(encodeURIComponent(visitSearch));
    var t = (new Date()).valueOf();
    document.getElementById('visitRecord').src = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/record.png?action=visitUrlRecord&visitPathname=" + visitPathname + "&visitSearch=" + visitSearch + "&t=" + t;
}

function getUrl() {
   /* var path = window.location.pathname + window.location.search;
    var url = "jquery.jsp?action=getPrePath&prev=index";
    $.get(url, function (result){
        backUrl = result;
    }, false);
    var pathObj = GetRequest(path);
    var backUrlObj = GetRequest(backUrl)
    if (path == backUrl){
        getUrl();
    } else if (pathObj.itemid == backUrlObj.itemid && pathObj.programa_id == backUrlObj.programa_id) {
        getUrl();
    }*/
}

function getPrevUrl(){
    /*var url = "/zyjh/jquery.jsp?action=getPrevUrl&prev=index";
    $.get(url,function(result){
        backUrl=result;
    },false);*/
}

function F_KEY_G_0(){ //back
    window.frames["smallWidow"].updateWatchRecord();
    if ('Q' == go_order_div){//全文
        QW_BACK();
    } else if ('XX' == go_order_div){//星星评分
        F_E_CANEL_F();
    }else if ('dx' == 'dx'){ //电信推荐位进来按返回，弹出挽留
        window.history.go(-1)
            // getUrl();
            // window.location.href = backUrl;
    // } else {
    //     getUrl();
    //     window.location.href = backUrl;
    }
}

function F_KEY_G_1() { //确定键 enter
    //        window.frames["smallWidow"].updateWatchRecord();
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
/***************相关推荐***************/
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
                //                    var black_id = focus_id.replace('f', 'bg');//what
                var jb_id = focus_id.replace('f', 'jb');
                //                    var jbr_id = focus_id.replace('f', 'jbr');//what
                _TF(show_id, 1.1);
                //                    _TF(black_id,1.1);
                _FD(jb_id, 1.3, 1.4);
                //                    _FD(jbr_id,1.0,1.0);
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

function _SELECT(id) {
    if (id == '' || id == null) {
        return false;
    } else {
        return document.getElementById(id);
    }
}
var imgurl = "http://epgpic.kanketv.com.ahct.lv1.vcache.cn/itv-epg/images/";

function decreaseStar(star) { //减星星
    switch (star) {
        case 1:
            _SELECT("xx_01").src = imgurl + 'score-left.png';
            _SELECT("xx_02").src = imgurl + 'Pixel.png';
            _SELECT("xx_03").src = imgurl + 'Pixel.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第一颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-f.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 2:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'Pixel.png';
            _SELECT("xx_03").src = imgurl + 'Pixel.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第一颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-f.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 3:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-left.png';
            _SELECT("xx_03").src = imgurl + 'Pixel.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            _SELECT("xx_03_f").src = imgurl + 'score-f.png';
            //第二颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-f.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 4:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'Pixel.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第二颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-f.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 5:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-left.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第三颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-f.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 6:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-full.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第三颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-f.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 7:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-full.png';
            _SELECT("xx_04").src = imgurl + 'score-left.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第四颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-f.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 8:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-full.png';
            _SELECT("xx_04").src = imgurl + 'score-full.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第四颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-f.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 9:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-full.png';
            _SELECT("xx_04").src = imgurl + 'score-full.png';
            _SELECT("xx_05").src = imgurl + 'score-left.png';
            //第五颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-f.png';
            break;
        case 10:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-full.png';
            _SELECT("xx_04").src = imgurl + 'score-full.png';
            _SELECT("xx_05").src = imgurl + 'score-full.png';
            //第五颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-f.png';
            break;
        default:
            ;
    }
}

function increaseStar(star) { //加星星
    switch (star) {
        case 1:
            _SELECT("xx_01").src = imgurl + 'score-left.png';
            _SELECT("xx_02").src = imgurl + 'Pixel.png';
            _SELECT("xx_03").src = imgurl + 'Pixel.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';

            //第一颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-f.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 2:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'Pixel.png';
            _SELECT("xx_03").src = imgurl + 'Pixel.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第一颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-f.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 3:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-left.png';
            _SELECT("xx_03").src = imgurl + 'Pixel.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第二颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-f.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 4:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'Pixel.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第二颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-f.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 5:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-left.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第三颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-f.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 6:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-full.png';
            _SELECT("xx_04").src = imgurl + 'Pixel.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第三颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-f.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 7:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-full.png';
            _SELECT("xx_04").src = imgurl + 'score-left.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第四颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-f.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 8:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-full.png';
            _SELECT("xx_04").src = imgurl + 'score-full.png';
            _SELECT("xx_05").src = imgurl + 'Pixel.png';
            //第四颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-f.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 9:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-full.png';
            _SELECT("xx_04").src = imgurl + 'score-full.png';
            _SELECT("xx_05").src = imgurl + 'score-left.png';
            //第五颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-f.png';
            break;
        case 10:
            _SELECT("xx_01").src = imgurl + 'score-full.png';
            _SELECT("xx_02").src = imgurl + 'score-full.png';
            _SELECT("xx_03").src = imgurl + 'score-full.png';
            _SELECT("xx_04").src = imgurl + 'score-full.png';
            _SELECT("xx_05").src = imgurl + 'score-full.png';
            //第五颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-f.png';
            break;
        default:
            ;
    }
}

function focusStar(star) {
    switch (star) {
        case 1:
            //第一颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-f.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 2:
            //第一颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-f.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 3:
            //第二颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-f.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 4:
            //第二颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-f.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 5:
            //第三颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-f.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 6:
            //第三颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-f.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 7:
            //第四颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-f.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 8:
            //第四颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-f.png';
            _SELECT("xx_05_f").src = imgurl + 'score-null.png';
            break;
        case 9:
            //第五颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-f.png';
            break;
        case 10:
            //第五颗星星闪光
            _SELECT("xx_01_f").src = imgurl + 'score-null.png';
            _SELECT("xx_02_f").src = imgurl + 'score-null.png';
            _SELECT("xx_03_f").src = imgurl + 'score-null.png';
            _SELECT("xx_04_f").src = imgurl + 'score-null.png';
            _SELECT("xx_05_f").src = imgurl + 'score-f.png';
            break;
        default:
            ;
    }

}

function blurStar() {
    _SELECT("xx_01_f").src = imgurl + 'score-null.png';
    _SELECT("xx_02_f").src = imgurl + 'score-null.png';
    _SELECT("xx_03_f").src = imgurl + 'score-null.png';
    _SELECT("xx_04_f").src = imgurl + 'score-null.png';
    _SELECT("xx_05_f").src = imgurl + 'score-null.png';
}

function GO_ORDERJSP(item_cp, item_id) {
  
}

function GO_ORDERJSP(item_cp, item_id, item_name) {
   
}

function removeSeesionFrom(url) {
    $.get(url, function (result) {});
}

function F_NONEAllDIV() { //隐藏所有节目
    for (var i = 0; i < 10; i++) {
        noneDiv("div_f" + i);
    }
}

function F_threeDIV() { //隐藏第三行
    for (var i = 0; i < 6; i++) {
        noneDiv("d_b" + i);
    }
}
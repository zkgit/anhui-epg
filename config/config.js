// 上线请更改
// var serverBaseApi="http://api.itvengine.com.lv1.vcache.cn/";//api主域名  ---------上线请更改
// var serverBaseStatic='http://apkpic.kanketv.com.ahct.lv1.vcache.cn/';//静态文件域名----------上线请更改

var serverBaseApi="http://zzb.kanketv.com/";//api主域名  ---------本地调试
var serverBaseStatic='http://zzb.kanketv.com/';//静态文件域名----------本地调试

var webset = {
    apibase:serverBaseApi,//api主域名
    staticbase:serverBaseStatic,//静态文件域名
    api:serverBaseApi+"itv-epg-api/api/v1/",//默认api接口路径-------切换cdn
    // api:serverBaseApi+"itv-api/api/v1/",   //-------切换cdn请注释
    solo:serverBaseApi+"itv-api/api/v1/",//针对搜索筛选接口路径
    authentication:serverBaseApi+"itv-epg-api/api/",//鉴权api接口路径
    apiStatic:serverBaseStatic+"jsonfile/"//静态文件路径
};
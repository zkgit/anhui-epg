var $ = {
    init: function (b) {
        var a = {
            url: "",
            method: "get",
            data: {},
            success: function () {},
            complete: function () {},
            error: function (c) {},
            async: true
        };
        a.url = b.url;
        a.method = b.method || a.method;
        a.data = $.params(b.data) || $.params(a.data);
        b.async == false ? a.async = b.async : a.async = a.async;
        a.complete = b.complete || a.complete;
        a.success = b.success || a.success;
        a.error = b.error || a.error;
        return a
    },
    createXHR: function () {
        if (window.XMLHttpRequest) {
            return new XMLHttpRequest();
        } else {
            if (window.ActiveXObject) {
                var b = ["MSXML2.XMLHttp", "Microsoft.XMLHTTP"];
                for (var c = 0, a = b.length; c < a; c++) {
                    try {
                        return new ActiveXObject(version[c]);
                        break;
                    } catch (d) {}
                }
            } else {
                throw new Error("浏览器不支持XHR对象！");
            }
        }
    },
    params: function (c) {
        var a = [];
        for (var b in c) {
            a.push(encodeURIComponent(b) + "=" + encodeURIComponent(c[b]));
        }
        return a.join("&")
    },
    callback: function (a, b) {
        if (b.status == 200) {
            a.success(b.responseText);
        } else {
            a.error();
        }
    },
    ajax: function (a) {
        if (a.method === "post") {
            $.post(a);
        } else {
            $.get(a);
        }
    },
    post: function (b, t, r) {
        var c = $.createXHR();
        var e = {
            method: "post",
            url: b,
            data: t,
            success: r,
        };
        var a = $.init(e);
        if (a.async === true) {
            c.onreadystatechange = function () {
                if (c.readyState == 4) {
                    $.callback(a, c)
                }
            }
        }
        c.open(a.method, a.url, a.async);
        c.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        c.send(a.data);
        if (a.async === false) {
            $.callback(a, c)
        }
    },
    get: function (a, d, c, error) {
        var f = $.createXHR();
        var e = {};
        e.url = a;
        e.success = d;
        e.error = error;
        if (c == false) {
            e.async = c;
        }
        var b = $.init(e);
        f.open(b.method, b.url, b.async);
        f.onreadystatechange = function () {
            if (f.readyState == 4) {
                $.callback(e, f);
            }
        };
        f.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        f.send(null);
    },
    ajaxSetup: function (a) {},
    each: function (b, c) {
        var a = 0;
        for (var a = 0; a < b.length; a++) {
            c(a, b[a]);
        }
    }
};

window.JSONP = (function (w, d) {
    return function (_conf) {
        if (undefined == _conf.url) {
            return "not defiend url"
        }
        if (_conf.cb == undefined) {
            cb = "fn" + Math.random().toString().split(".")[1]
        } else {
            cb = _conf.cb
        }
        window[cb] = function (data) {
            if (undefined != _conf.success) {
                _conf.success(data)
            }
        };
        if (undefined == _conf.cbkey) {
            _conf.cbkey = "callback"
        }
        _conf.url = _conf.url + "?" + _conf.cbkey + "=" + cb;
        if (undefined != _conf.params) {
            for (var k in _conf.params) {
                _conf.url += "&" + k + "=" + _conf.params[k]
            }
        }
        var _s = d.createElement("script");
        _s.src = _conf.url;
        document.body.appendChild(_s)
    }
})(window, document);
$.ajaxSetup({
    async: false
});

var Utils = new Object();

Utils.htmlEncode = function (text) {
    return text.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}

Utils.trim = function (text) {
    if (typeof (text) == "string") {
        return text.replace(/^\s*|\s*$/g, "");
    }
    else {
        return text;
    }
}

Utils.isEmpty = function (val) {
    switch (typeof (val)) {
        case 'string':
            return Utils.trim(val).length == 0 ? true : false;
            break;
        case 'number':
            return val == 0;
            break;
        case 'object':
            return val == null;
            break;
        case 'array':
            return val.length == 0;
            break;
        default:
            return true;
    }
}

Utils.isNumber = function (val) {
    var reg = /^[\d|\.|,]+$/;
    return reg.test(val);
}

Utils.isInt = function (val) {
    if (val == "") {
        return false;
    }
    var reg = /\D+/;
    return !reg.test(val);
}

Utils.isEmail = function (email) {
    var reg1 = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;

    return reg1.test(email);
}

Utils.isTel = function (tel) {
    var reg = /^[\d|\-|\s|\_]+$/; //只允许使用数字-空格等

    return reg.test(tel);
}

Utils.isTime = function (val) {
    var reg = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}$/;

    return reg.test(val);
}

Utils.checkPicExt = function (oid) {
    var obj = document.getElementById(oid);
    var ff = obj.value;
    if (ff == null || ff == "") {
        return false;
    }
    photo_flag = true;
    var fileType;
    var filePath;
    if (obj.files) { // webkit, mozilla... (jq:$.support.boxModel)   // ff  &  chrome
        var reader = new FileReader();
        var thisFile = obj.files[0];
        var isFirefox = navigator.userAgent.indexOf("Firefox");    //ff 下获取图片大小
        fileType = thisFile.type;
        reader.readAsDataURL(thisFile);
    } else {   //   ie
        obj.select();
        obj.blur();
        var path = document.selection.createRange().text;
        var fileType = path.substring(path.length - 4, path.length);
    }

    if (fileType != ".jpg" && fileType != ".JPG" && fileType != "image/jpeg") {//image/jpeg
        //alert('图片格式错误！');
        photo_flag = false;
    }

    return photo_flag;
}

Utils.setImagePreview = function (fileId, previewId, pw, ph) {
    var docObj = document.getElementById(fileId);
    var imgObjPreview = document.getElementById(previewId);
    if (docObj.files && docObj.files[0]) {
        //火狐下，直接设img属性  
        imgObjPreview.style.display = 'block';
        imgObjPreview.style.width = pw + "px";
        imgObjPreview.style.height = ph + "px";
        //imgObjPreview.src = docObj.files[0].getAsDataURL();  

        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式    
        imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
    } else {
        //IE下，使用滤镜  
        docObj.select();
        var imgSrc = document.selection.createRange().text;
        var localImagId = document.getElementById("localImag");
        //必须设置初始大小  
        localImagId.style.width = pw + "px";
        localImagId.style.height = ph + "px";
        //图片异常的捕捉，防止用户修改后缀来伪造图片  
        try {
            localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
            localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
        } catch (e) {
            alert("您上传的图片格式不正确，请重新选择!");
            return false;
        }
        imgObjPreview.style.display = 'none';
        document.selection.empty();
    }
    return true;
}

Utils.ajax = function (url, data, sucFun, errFun) {
    $.ajax({
        type: 'post',
        url: url,
        data: data,
        success: function (obj) {
            if (obj.Success) {
                if (sucFun)
                    sucFun(obj);
            } else {
                if (errFun)
                    errFun(obj);
            }
        }
    });
}
// require imageBrowser UIMediaScanner imageFilter


(function(window){
    var imageApi = {
    };
    imageApi.UploadImages = function (host,ownerId,imageId,imageUrl,callback)
    {
        var values = {};
        var files = {};

        values["ItemId"+0] = imageId;
        values["OwnerId"+0] = ownerId;
        values["FileName"+0] = this.getImageName(imageUrl);

        files["File"+0] = imageUrl;

        values["Count"] = 1;

        values["__secret"]="notoken";

        api.ajax({
            url:'http://'+host+'/uploadImages',//TServerInfo.getCompanyCode()
            method:'post',
            charset:'UTF-8',
            cache: false,
            timeout: 30,
            dataType: 'json',
            data:{
                values:values,
                files:files
            }
        },function(ret,err){
            if (ret) {
                if(ret.Code == 0){
                    callback();
                }else{
                    api.toast({
                        msg : ('错误码：'+ret.Code+'；错误信息：'
                            +ret.Msg),
                        duration : 2000,
                        location : 'bottom'
                    });
                }
            } else {
                api.toast({
                    msg : ('错误码：'+err.code+';错误信息：'
                        +err.msg+';网络状态码：'+err.statusCode),
                    duration : 2000,
                    location : 'bottom'
                });

            };
        });
    }



    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    imageApi.getImageName =  function(filePath) {
        return filePath.substring(filePath.lastIndexOf('/') + 1);
    }

	imageApi.getFileExt =  function(fileName) {
        return fileName.substring(fileName.lastIndexOf('.') + 1);
	}

	imageApi.selectImage =  function(options,callback){
		var _this = this;
		api.actionSheet({
	                    title : '选择图片来源',
	                    buttons : ['拍照', '相册']
	            }, function(ret, err) {
	                    var index = ret.buttonIndex;
	                    switch(index) {
	                    	 case 1:  _this.imageFromCam(options,callback);break;
	                    	 case 2:  _this.imageFromMedia(options,callback);break;
	                    }
	            });
	}

	imageApi.imageFromCam =  function(options,callback){
		var _this = this;

		api.getPicture({
	            sourceType : "camera",
	            encodingType : "jpg",
	            destinationType : "url",
	            mediaValue : "pic",
	            quality : 50,
	            saveToPhotoAlbum : true
	    }, function(ret, err) {
	        if (ret && ret.data) {
	                // 拍照返回的本地路径
	            var returnUrl = ret.data;

	            _this.imgCompress(returnUrl, 0.5, 0.5, _this.getFileExt(returnUrl), function(compressImg) {
	                if(callback)
	                	callback(compressImg);
	            });
	        } else {
	            api.toast({
				      msg : '选择出错'+err,
						duration : 2000,
						location : 'bottom'
				    });
	        }
	    });
	}


	imageApi.imageFromMedia =  function(options,callback){//tplId,nodeId,flag
		var _this = this;
		var uiMediaScanner = api.require('UIMediaScanner');
		uiMediaScanner.open({
	        type : 'picture',
	        column : 4,
	        classify : true,
	        max : 6,
	        sort : {
	                key : 'time',
	                order : 'desc'
	        },
	        texts : {
	                stateText : '已选*项',
	                cancelText : '取消',
	                finishText : '完成'
	        },
	        styles : {
	                bg : '#fff',
	                mark : {
	                        icon : '',
	                        position : 'bottom_left',
	                        size : 20
	                },
	                nav : {
	                        bg : '#0066ff',
	                        stateColor : '#fff',
	                        stateSize : 18,
	                        cancelBg : 'rgba(0,0,0,0)',
	                        cancelColor : '#fff',
	                        cancelSize : 18,
	                        finishBg : 'rgba(0,0,0,0)',
	                        finishColor : '#fff',
	                        finishSize : 18
	                }
	        }
	    }, function(ret) {
	        if (ret && ret.list) {
	        	var cImageUrls = [];
	        	for (var i = 0; i < ret.list.length; i++) {
            		var selectImg = ret.list[i];
            		_this.imgCompress(selectImg.path, 0.5, 0.5, _this.getFileExt(selectImg.path), function(compressImg) {
                		cImageUrls.push(compressImg);

                		if(cImageUrls.length == ret.list.length){
                			if(callback)
                				callback(cImageUrls);
                		}
		            });
                }
	        }
	    });
	}

	imageApi.openImageBrowser = function (imgs) {
		var imageBrowser = api.require("imageBrowser");
        imageBrowser.openImages({
                imageUrls : imgs,
                showList : false,
                activeIndex : 0
        });
	}

	imageApi.addImagePress = function(obj) {
		var _this = this;
        // 获取目前长按的对象
        var hammertime = new Hammer(obj);
        // 绑定长按对象
        hammertime.on("press", function(e) {
                api.confirm({
                        title : '温馨提示',
                        msg : '您确定要删除该图片吗？',
                        buttons : [ '取消', '确定']
                }, function(ret, err) {
                        if (ret.buttonIndex == 2) {
                                // 移除自己
                                $(obj).parent().remove();
                                api.toast({
                                        msg : '删除成功！'
                                });
                        }
                });
        });

        hammertime.on("tap", function(e) {
        	_this.openImageBrowser([obj.src]);
        });

	}

	// 图片压缩
	// imgsrc：源图片的路径
	// quality：图片压缩质量，一般建议0.5
	// scale：图片压缩比例，也是建议0.5
	// ext：源图片拓展名
	// callback：转换成功之后回调函数
	imageApi.imgCompress = function(imgsrc, quality, scale, ext, callback) {
	        // 压缩文件的保存目录
	        var savePath = api.cacheDir + "/" + new Date().Format("yyyy-MM-dd") + "/";
	        // 压缩文件生成的随机文件名称
	        var savename = GetUuid() + "." + ext;
	        var imageFilter = api.require("imageFilter");
	        imageFilter.compress({
	                img : imgsrc,
	                quality : quality,
	                scale : quality,
	                save : {
	                        album : false,
	                        imgPath : savePath,
	                        imgName : savename
	                }
	        }, function(ret, err) {
	                if (ret) {
	                        callback(savePath + savename);
	                } else {
	                        //alert(JSON.stringify(err));
	                }
	        });
	}

    window.ImageApi = imageApi;

})(window);

function GetUuid() {
    var s = [];
    var hexDigits = "0123456789abcdef";
    for (var i = 0; i < 36; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
    s[8] = s[13] = s[18] = s[23] = "";

    var uuid = s.join("");
    return uuid;
}
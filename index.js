"use strict";
var Eventor = require('eventor');
var Cycle = function(opt) {
	this.init(opt);
	return this;
}
Eventor.mixTo(Cycle);
Cycle.prototype.init = function(opt) {
	var _this = this;
	var opt = opt || _this.opt;
	_this.opt = null;
	_this.classname = opt.classname || "";
	_this.radius = Math.floor((opt.radius || document.body.clientWidth * 0.81 || 259) * 0.91);
	_this.sex = opt.sex || "female";
	_this.token = opt.token || "";
	_this.scale = opt.scale || [];
	_this.enter = opt.enter || "javascript:;";
	_this.api = opt.api || '';
	_this.female = {
		outerCircle: "#e3e3e3",
		outerCircle_null: "#B6B6B6",
		innerCircle: "#fff",
		menstrual: "#ff8a7f",
		safe: "#ffee5f",
		ovulation: "#66bb6a"
	};
	_this.male = {
		outerCircle: "#458bc6",
		outerCircle_null: "#115b99",
		innerCircle: "#fff",
		menstrual: "#ff8a7f",
		safe: "#ffee5f",
		ovulation: "#66bb6a"
	};
	_this[_this.sex + "_color"] = _this[_this.sex + "_color"] || [];
	_this.emit("setCycle");
	if (!!_this.error()) return false;
	_this.getApi();
	_this.on("update", function() {
		_this.getApi();
	});
	return this;
}
Cycle.prototype.getApi = function() {
	var _this = this;
	$.ajax({
		url: _this.api,
		type: "get",
		data: {
			token: _this.token
		},
		// xhrFields: {
		// 	withCredentials: true
		// },
		success: function(data) {
			if (!data.data || !data.data.ring) {
				console.log("未初始化用户");
				_this.initNullCss();
				_this.initNullHtml();
				return false;
			}
			delete data.data.record;
			var ring = data.data.ring;
			//ring.plan = data.data.plan;
			var status;
			_this.scale[i] = [];
			for (var i = 0; i < ring.percent.length; i++) {
				_this.scale[i] = ring.percent[i].value * 100;
				if (ring.percent[i].type == 0) {
					_this[_this.sex + "_color"][i] = _this[_this.sex].menstrual;
					//if( ring.plan == 0 ) status = i-1 < 0 ? 3 : i-1;
				} else if (ring.percent[i].type == 1) {
					_this[_this.sex + "_color"][i] = _this[_this.sex].safe;
				} else if (ring.percent[i].type == 2) {
					_this[_this.sex + "_color"][i] = _this[_this.sex].ovulation;
					//if( ring.plan > 0 && ring.plan != 3 ) status = i;
				}
			}

			ring.customStatus = status || -1;
			ring.pregnancyrate = ring.pregnancyrate || 0;
			ring.next = ring.next || 0;
			ring.plan = data.data.plan;
			ring.info = data.data.info[0];
			_this.initCss(data.data.ring);
			_this.initHtml(ring);
			_this.bindEvent();
		},
		error: function(data) {
			console.error("error", data);
			_this.initNullCss();
			_this.initNullHtml();
		}
	});
}
Cycle.prototype.error = function() {
	var _this = this;
	if (!_this.classname || !document.getElementsByClassName(_this.classname)) {
		console.log("classname不能为空或者classname对象不存在");
		return true;
	} else if (!_this.token) {
		console.log(_this.classname, " token不能为空");
		return true;
	} else return false;
}
Cycle.prototype.initNullHtml = function(ring) {
	var _this = this;
	var html = replaceHtml({
		"cyclesex": _this.sex,
		"enter": _this.sex == "female" ? '<a href="' + _this.enter + '" class="item"><span class="null-data">前往记录经期</span>没有记录周期数据</a>' : '<span class="null-data" style="display: inline-block; color: #115b99;">你的老婆没有填写数据</span>'
	}, require("./index_null.tpl"));
	document.getElementsByClassName(_this.classname)[0].innerHTML = html;
}
Cycle.prototype.initHtml = function(ring) {
	var _this = this;
	/*by shofan */
	var cycleText = '';

	switch (ring.status) {
		case 0:
			cycleText = '今天处于<span class="showy">月经期</span>，距安全期还有';
			break;
		case 1:
			if (ring.safe == 1) {
				cycleText = '今天处于<span class="showy">安全期</span>，距排卵期还有';
			} else if (ring.safe == 2) {
				cycleText = '今天处于<span class="showy">安全期</span>，预计来姨妈还有';
			} else {
				console.error('安全期阶段状态异常，Error：safe is ' + ring.safe);
			}
			break;
		case 2:
			cycleText = '今天处于<span class="showy">排卵期</span>，距安全期还有';
			break;
		default:
			console.error('阶段状态异常，Error：status is ' + ring.status);
	}
	/*by shofan end */

	var today = _this.__getYMD();
	var come = _this.__getYMD(ring.info.come);
	var end = _this.__getYMD(ring.info.end);
	console.log( ring.info );
	var menstrualBtn = !ring.info.really ||
						(!!ring.info.really && today.stamp == come.original)
						(!!ring.info.really && today.stamp != come.original && !!ring.info.end && today.stamp > come.original+14*24*60*60) ? 
						'come' : 'end';
	
	menstrualBtn = menstrualBtn.replace('come', '<a class="btn-menstrual-start" href="javascript:void(0);">更新姨妈开始日</a>')
								.replace('end', '<a class="btn-menstrual-end" href="javascript:void(0);">更新姨妈结束日</a>');
	menstrualBtn = _this.sex == "male" ? '' : menstrualBtn;
	//var menstrualBtn = !ring.info.end ? (today.original < come.stamp ? '': '<a class="btn-menstrual-start" href="javascript:void(0);">更新姨妈开始日</a>') :
	//									today.original < come.stamp+24*60*60 ? '' : today.original < end.stamp+14*24*60*60 ? '<a class="btn-menstrual-end" href="javascript:void(0);">更新姨妈结束日</a>' : '<a class="btn-menstrual-start" href="javascript:void(0);">更新姨妈开始日</a>';
	var cycleAvatar = _this.sex != "male" || !_this.scale ? '' : '<img class="cycle-avatar" src="' + ring.icon + '" onerror="this.src=\'http://scdn.bozhong.com/source/resource/img/noavatar_middle.gif\';" alt="老婆头像" />';
	var plan_0 = '<span class="clear-float"></span><div class="mask-' + _this.sex + '-inner" >' + cycleAvatar + '<div class="cycle-text">' + cycleText + '</div><div class="cycle-days"><span class="showy percent">' + ring.next + '</span>天</div>'+menstrualBtn+'</div>';
	var plan_12 = '<span class="clear-float"></span><div class="mask-' + _this.sex + '-inner">' + cycleAvatar + '<div>受孕指数</div><span class="icon-start"><i></i></span>'+menstrualBtn+'</div>';
	var cycleType = ring.plan == 0 ? plan_0 : plan_12;
	var html = replaceHtml({
		"cyclesex": _this.sex,
		"cycletag": (ring.customStatus > 0 ? ring.percent[ring.customStatus].value > 0 ? "" : "nothidden" : ""),
		"notclip-1": (ring.percent[0].value == 0 ? "nothidden" : ring.percent[0].value < 0.5 ? "" : "notclip"),
		"notclip-2": (ring.percent[0].value == 0 ? "nothidden" : ring.percent[1].value < 0.5 ? "" : "notclip"),
		"notclip-3": (ring.percent[0].value == 0 ? "nothidden" : ring.percent[2].value < 0.5 ? "" : "notclip"),
		"notclip-4": (ring.percent[0].value == 0 ? "nothidden" : ring.percent[3].value < 0.5 ? "" : "notclip"),
		"nottransform-1": (ring.percent[0].value == 0 ? "nothidden" : ring.percent[0].value < 0.5 ? "" : "nottransform"),
		"nottransform-2": (ring.percent[0].value == 0 ? "nothidden" : ring.percent[1].value < 0.5 ? "" : "nottransform"),
		"nottransform-3": (ring.percent[0].value == 0 ? "nothidden" : ring.percent[2].value < 0.5 ? "" : "nottransform"),
		"nottransform-4": (ring.percent[0].value == 0 ? "nothidden" : ring.percent[3].value < 0.5 ? "" : "nottransform"),
		"type": cycleType
	}, require("./index.tpl"));
	document.getElementsByClassName(_this.classname)[0].innerHTML = html;
	return this;
}
Cycle.prototype.bindEvent = function(){
	var _this = this;
	$(".btn-menstrual-start").on("click", function(e){
		_this.emit("menstrual_start",e);
	});
	$(".btn-menstrual-end").on("click", function(e){
		_this.emit("menstrual_end",e);
	});
}
Cycle.prototype.initCss = function(ring) {

	var _this = this;
	var positionAbsolute = 'position: absolute;',
		radius = _this.radius // 半径
		,
		width = 'width:' + radius + 'px;' //宽度
		,
		height = 'height:' + radius + 'px;' // 高度
		,
		maskMark = ' top: -' + (radius * 0.9 * 0.05 - 2) + 'px; margin-left: -' + radius * 0.9 * 0.06 + 'px; border-left: ' + radius * 0.9 * 0.06 + 'px solid transparent; border-right: ' + radius * 0.9 * 0.06 + 'px solid transparent; border-bottom: ' + radius * 0.9 * 0.05 + 'px solid white; ',
		clip = 'clip: rect(0, ' + radius + 'px, ' + radius + 'px, ' + radius * 0.5 + 'px);'; // 裁剪正方形
	// 计算当前选中时的箭头指向的位置
	var dayDeg = 360 / ring.cycle;
	var statusDegPointer = dayDeg * ring.day - dayDeg * 0.5;
	var css = require("./style.tpl");
	css = replaceStyle({
		"classname": _this.classname,
		"sex": _this.sex,
		"maskPosition": Math.floor(radius * 0.05),
		"maskRadius": Math.floor(radius * 0.9),
		"statusDegPointer": statusDegPointer,
		"maskMark": maskMark,
		"innerCircle": _this[_this.sex].innerCircle,
		"avatarRadius": Math.floor(_this.radius * 0.2046),
		"realRadius": radius,
		"cycleColor_0": _this[_this.sex + "_color"][0],
		"cycleColor_1": _this[_this.sex + "_color"][1],
		"cycleColor_2": _this[_this.sex + "_color"][2],
		"cycleColor_3": _this[_this.sex + "_color"][3],
		"rotate_1": 360 * 0.01 * _this.scale[0],
		"rotate_2": 360 * 0.01 * (_this.scale[0] + _this.scale[1]),
		"rotate_3": 360 * 0.01 * (_this.scale[0] + _this.scale[1] + _this.scale[2]),
		"rotate_child_0": -360 * 0.01 * (50 - _this.scale[0]),
		"rotate_child_1": -360 * 0.01 * (50 - _this.scale[1]),
		"rotate_child_2": -360 * 0.01 * (50 - _this.scale[2]),
		"rotate_child_3": -360 * 0.01 * (50 - _this.scale[3]),
		"clip": clip,
		"starWidth": Math.floor(_this.radius * 0.55),
		"starHeight": Math.floor(_this.radius * 0.083),
		"pregnancyrate": ring.pregnancyrate * 20 || 0
	}, css);

	if (!!document.getElementsByClassName(_this.classname + "_style_box") && !!document.getElementsByClassName(_this.classname + "_style_box").length > 0) {
		document.getElementsByTagName("body")[0].removeChild(document.getElementsByClassName(_this.classname + "_style_box")[0]);
	}
	var style = document.createElement("style");
	style.className = _this.classname + "_style_box";
	style.innerHTML = css;
	document.body.appendChild(style);
	return this;
}
Cycle.prototype.initNullCss = function(status) {
	var _this = this;
	var css = require("./style_null.tpl");
	css = replaceStyle({
		"classname": _this.classname,
		"sex": _this.sex,
		"outerCircle": _this[_this.sex].outerCircle,
		"outerCircle_null": _this[_this.sex].outerCircle_null
	}, css);
	var style = document.createElement("style");
	style.innerHTML = css;
	document.body.appendChild(style);
	return this;
}
Cycle.prototype.__getYMD = function(timestamp){
	// t是时间戳
	var obj = !!timestamp ? new Date(timestamp*1000) : new Date();
	var obj = {
		year: obj.getFullYear(),
		month: obj.getMonth()+1,
		day: obj.getDate(),
		original: parseInt(obj.getTime()/1000,10),
	};
	obj.ymd = [obj.year, obj.month, obj.day];
	obj.stamp = parseInt(new Date(obj.year, obj.month-1, obj.day).getTime()/1000,10);
	obj.firstStamp = parseInt(new Date(obj.year, obj.month-1, 1).getTime()/1000,10);
	obj.lastStamp = parseInt(new Date(obj.year, obj.month, 0).getTime()/1000,10); 
	return obj;
}

function replaceStyle(json, css) {
	for (var i in json) {
		css = css.replace(new RegExp("\\(\\(" + i + "\\)\\)", "g"), json[i]);
	}
	return css;
}

function replaceHtml(json, html) {
	for (var i in json) {
		html = html.replace(new RegExp("{{" + i + "}}", "g"), json[i]);
	}
	return html;
}
module.exports = Cycle;
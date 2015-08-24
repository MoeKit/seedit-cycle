# seedit-cycle

---

该模块为小蜜桃与大香蕉的周期日历组件

---


## 使用

```js
var Cycle = require('seedit-cycle');
var example = new Cycle({});
```

## 初始化参数
+ sex 男女版, `string`参数，分别为男male、女female，(必选)
+ classname 渲染周期日历的位置-类名，(必选)
+ radius 圆圈宽度，(可选)
+ token `Objectid`参数，用户token
+ enter `URL`参数，跳转填写记录的地址
+ api: 接口地址： exp: http://mitao.office.bzdev.net/api/wechat/ring.json

## 示例
```js
seajs.use(['index'], function(Cycle){
    var cycle = new Cycle({
        sex: "female",
        classname: "cfemale",
        radius: 320,
        token: "555469898cf432da078b4a9f",
        enter: "http://baidu.com/12312",
        api: "http://mitao.office.bzdev.net/api/wechat/ring.json"
    });
    console.log(cycle);
    document.getElementById("btn-get").onclick = function(){
        cycle.trigger("update");
    };
    cycle.on("menstrual_start", function(e){
        console.log("更新姨妈开始日");
    });
    cycle.on("menstrual_end", function(e){
        console.log("更新姨妈结束日");
    });
});
```
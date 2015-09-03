# Demo

---

## 小蜜桃（女版空）
<script type="text/javascript" src="http://scdn.bozhong.com/source/common/js/jquery.min.js"></script>
````javascript

    var seeditCycle = require("seedit-cycle");
    var cycle = new seeditCycle({
        sex: "female",
        classname: "cfemale-null",
        radius: 320,
        token: "55e501c78cf4328a298b45d4",
        enter: "http://baidu.com/12312",
        api: "http://mitao.office.bzdev.net/api/wechat/ring.json"
        //api: "http://huodong.office.bzdev.net/restful/wechat/users.json"
    });
    cycle.on("menstrual_start", function(e){
        console.log("更新姨妈开始日");
    });
    cycle.on("menstrual_end", function(e){
        console.log("更新姨妈结束日");
    });

````
<div class="cfemale-null"></div>
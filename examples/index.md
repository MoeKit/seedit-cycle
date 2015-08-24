# Demo

---

## 小蜜桃（女版空）
<script type="text/javascript" src="http://scdn.bozhong.com/source/common/js/jquery.min.js"></script>
````javascript

    var seeditCycle = require("seedit-cycle");
    var cycle = new seeditCycle({
        sex: "male",
        classname: "cfemale-null",
        radius: 320,
        token: "55d59c96481b9c8f058b459b",
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
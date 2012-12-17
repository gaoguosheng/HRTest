var $GGS={
    //Ajax更新
    ajax:function(url,data){
        var result;
        $.ajax({
            type: "POST",
            url:url,
            data:data,
            async:false,
            success: function(msg){
                result=msg;
            }
        });
        return result;
    } ,

    //获取JSON(同步)
    getJSON:function(url,data){
        var node;
        $.ajax({
            type: "POST",
            url:url,
            data:data,
            async:false,
            dataType:"json",
            success: function(json){
                node=json;
            }
        });
        return node;
    },
    //分钟倒计时
    downCount:function (minutes,fun){
        if(minutes<1)return;
        var min = minutes-1;
        var seconds=60;
        document.write("<span id='downcountDiv'></span>");
        var downcountTimer=setInterval(function (){
            seconds--;
            $("#downcountDiv").html(min+" 分 "+seconds+" 秒");
            if(min==0 && seconds==0){
                window.clearInterval(downcountTimer);
                fun();
            }
            if(seconds==0){
                min--;
                seconds=60;
            }
        },1000);
    }

}
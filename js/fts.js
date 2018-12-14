function j_a(str) {//JOSN转化为对象
    var arr = [];
    if (str == '') { return arr}
    if (typeof str == 'string') {
        try {
            var obj=JSON.parse(str);
            if(typeof obj == 'object' && obj ){
                for(var item in obj){
                    arr.push(obj[item]);
                } 
            }
        } catch(err) {
            console.log('error：非JOSN:'+str);
            alert('系统错误，已自动提交!');
        }
    } else {
        console.log('It is not a string:'+str);
    }
    return arr;
}

//ck_id,窗口class
//biaoti，标题class
window.onload=function (){//拖动窗口
    $('.biaoti').mousedown(
        function(event) {
            var isMove = true;
            var abs_x = event.pageX - $('div.ck_id').offset().left;
            var abs_y = event.pageY - $('div.ck_id').offset().top;
            $(document).mousemove(function(event) {
                if(isMove) {
                    var obj = $('.ck_id');
                    obj.css({
                        'left': event.pageX - abs_x,
                        'top': event.pageY - abs_y
                    });
                }
            }).mouseup(
                function() {
                    isMove = false;
                }
            );
        }
    )
}

function fz(xx) {//复制对象
    if (xx) {
        return JSON.parse(JSON.stringify(xx));
    } else {
        return new Object;;
    }
}
function xs(xx) {//显示对象
    alert(JSON.stringify(xx));
}

function zdd(xx) {//div 滚动条显示最低端
    var nrr = document.getElementById(xx);
    nrr.scrollTop = nrr.scrollHeight;
}
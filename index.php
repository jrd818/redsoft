<!DOCTYPE html>
<html>
<head>
	<title>金瑞得售后服务系统</title>
	<script language="JavaScript" type="text/javascript" src="js/fts.js"></script>
    <script language="JavaScript" type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body style="margin: 0px;">
	<div id="页头" style="height: 66px;background-color: #000;width: 100%;color: #eee;text-align: center;">
		<div style="width: 1200px;margin: 0 auto;padding: 10px;">
			<div style="float: left;">
				<img src="images/logo.png" alt="" style="height: 50px; left: 0px; position: relative; ">
			</div>
			<div  style="float: left; padding: 12px;margin-left: 25px;" >
        		<div id="cd0100" onclick="addxxk (this.id,'/jianshezhong.html')" onmouseover="this.style.cursor='pointer'" style="">首页</div>
        	</div>
        	<div  style="float: left; padding: 12px;margin-left: 25px;" >
        		<div id="cd0200" onclick="addxxk (this.id,'/jrdpc/gdcl.html')" onmouseover="this.style.cursor='pointer'" style="">工单</div>
        	</div>
        	<div  style="float: left; padding: 12px;margin-left: 25px;" >
        		<div id="cd0300" onclick="addxxk (this.id,'/jrdpc/zhishi.html')" onmouseover="this.style.cursor='pointer'" style="">知识</div>
        	</div>
        	<div  style="float: left; padding: 12px;margin-left: 25px;" >
        		<div id="cd0400" onclick="addxxk (this.id,'/jrdpc/wendang.html')" onmouseover="this.style.cursor='pointer'" style="">文档</div>
        	</div>
        	<div  style="float: left; padding: 12px;margin-left: 25px;" >
        		<div id="cd0500" onclick="addxxk (this.id,'/jianshezhong.html')" onmouseover="this.style.cursor='pointer'" style="">下载</div>
        	</div>
        	<div  style="float: left; padding: 12px;margin-left: 25px;" >
        		<div id="cd0600" onclick="addxxk (this.id,'/jianshezhong.html')" onmouseover="this.style.cursor='pointer'" style="">报表</div>
        	</div>
        	<div  style="float: left; padding: 12px;margin-left: 25px;" >
        		<div id="cd0700" onclick="addxxk (this.id,'/jianshezhong.html')" onmouseover="this.style.cursor='pointer'" style="">设置</div>
        	</div>
        	<div  style="float: right; padding: 12px;margin-left: 15px;" >
        		<div  style="font-size: 90%;color: #eee;cursor: pointer;margin-top: 3px;" onclick="tuichudenglu()" id="zhuce"></div>
        	</div>
        	<div  style="float: right; padding: 12px;" >
        		<div  style="cursor: pointer;" id="denglu">欢迎：</div>
        	</div>
        	<script type="text/javascript">
        		function getCookie(name){
        		    var strcookie = decodeURI(document.cookie);//获取cookie字符串
        		    var arrcookie = strcookie.split("; ");//分割
        		    for ( var i = 0; i < arrcookie.length; i++) {
        		        var arr = arrcookie[i].split("=");
        		        if (arr[0] == name){
        		            return arr[1];
        		        }
        		    }
        		    return "";
        		}
        		var user = getCookie("user");
        		if (!user)  {
        		    window.location.href='login.html';
        		} else {
        			document.getElementById('denglu').innerHTML += user;
        			document.getElementById('zhuce').innerHTML = '退出登录';
        		}
        		function tuichudenglu() {//退出登录
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange=function() {
                        if (xmlhttp.readyState==4 && xmlhttp.status==200)
                        {
                            var dd = JSON.parse(xmlhttp.responseText);
                            var arr = [];
                            for(var item in dd){
                                arr.push(dd[item]);
                            }
                            if (arr[0] == 'success') {
                                location.href = document.URL;
                            } else {
                                alert('退出失败！请联系管理员！'+xmlhttp.responseText);
                            }
                        }
                    }
                    xmlhttp.open("POST",'index_do.php',true);
                    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");//想表单一样的POST
                    xmlhttp.send("w=退出登录");
                }
        	</script>
		</div>
	</div>

	<!-- 选项卡、显示菜单 -->
	<div>
		<style type="text/css">
			#xxiangka{ text-align: center;  background-color: #e0e0e0; height: 30px;}
			#xxiangka{height: 30px; width: 1200px; position: relative; left: 0px;  font-size: 12px; margin: 0 auto;}
			#xuanxcd80{padding: 7px 10px 0px 26px; height: 23px;}
			#xxiang00{ position: absolute; left: 6px; top: 7px; }
			.xuanxiangka2{height: 23px; width: outo; text-align: center; position: relative;left: 5px; top: 4px; z-index: 1;
			    background-color: #ffffff; border-radius: 3px; float: left; margin-left: 5px; box-shadow: 0px -2px 0px 0px #1b5c8b;
			    padding: 7px 26px 0px 10px; opacity: 0.7; cursor:default;}
			.xuanxiangka2:hover{ box-shadow: 0px -2px 0px 0px #1b5c8b !important;  opacity: 1 !important;}
			.xuanxiangka3-1{ position: absolute; right: 4px; top: 5px; opacity: 0.4; cursor:pointer;}
			/*这个类会有js产生的，请勿删除*/
			.xuanxiangka3-1:hover{ opacity:  1; }
			.xuanxiangka3-1-1{ position: absolute; right: 0px; top: 0px; display: none;}
			.xuanxiangka3-1:hover>.xuanxiangka3-1-1{ display: block; opacity: 1;}
			#shuaxin{ position: absolute; right: 3px;top: 0px;padding: 7px 10px; }
			#neirong-1{ text-align: center; }
			#neirong{  position: relative; width: 1200px;z-index: 2;margin: 0 auto;}
			iframe{position: absolute; left: 0px; width: 1200px; height: 760px; background-color: #ffffff; border: 0;}
		</style>
		<div id="xxiangka-1">
		    <div id="xxiangka">
		        <div id="shuaxin" onmouseover="this.style.cursor='pointer'" onclick="shuaxin()"><img src="images/shuaxin.png" ></div>
		    </div>
		</div>
		<div id="neirong-1">
		    <div id="neirong"></div>
		</div>
		<script type="text/javascript">
			//点击菜单后添加选项卡和iframe窗口cd0000
			function addxxk (x1,x2) {//选项卡ID获取
			    x1 = x1.substring(2);
			    var xxkid11 = 'xuanx'+x1;
			    var ifr0 = 'ifr'+x1;
			    var ceshi = document.getElementById(ifr0);
			    //获取默认选项卡的ID
			    if ( ceshi == null ) {
			        var gban = "<div class=\"xuanxiangka3-1\" id=\"xuanx"+x1+"-1\"><img src=\"images/guanbitubiao.png\"><div class=\"xuanxiangka3-1-1\"><img src=\"images/yuanquan.png\"></div></div>";
			        var nr =  document.getElementById('cd'+x1).innerHTML+gban;
			        var div0 = document.createElement('div');
			        div0.innerHTML = nr;
			        div0.setAttribute('class','xuanxiangka2');
			        div0.setAttribute('id','xuanx'+x1);
			        div0.setAttribute('onclick','jdsz(this.id)');
			        var xxk = document.getElementById('xxiangka');
			        xxk.appendChild(div0);
			        //以上代码插入选项卡
			        var div1 = document.getElementById('xuanx'+x1+'-1');
			        div1.setAttribute('onclick','gbjdxs (this.id)');
			        //选项卡按钮可同时关闭选项卡和iframe层。
			        var frame0 = document.createElement('iframe');
			        frame0.setAttribute('src',x2);
			        frame0.setAttribute('id',ifr0)
			        var neir = document.getElementById('neirong');
			        neir.appendChild(frame0);
			        //插入内容卡
			    }
			    x1 = 'xuanx' + x1;
			    jdsz(x1);
			}
			//将指定ID选项卡卡对应的焦点显示效果
			function jdsz(x1) {
			    //将指定标签卡对应的内容卡的焦点显示效果xuanx0000
			    var nrid = 'ifr'+x1.substring(5);
			    var nrk = document.getElementsByTagName('iframe');
			    for (var i = nrk.length - 1; i >= 0; i--) {
			        if (nrk[i].id == nrid) {
			            nrk[i].style.zIndex = 5;
			        } else {
			            nrk[i].style.zIndex = 3;
			        }
			    }
			    //将指定ID的选项卡设为焦点
			    var xxk = document.getElementsByTagName('div');
			    for (var i = 0; i < xxk.length; i++) {
			        if (xxk[i].id.length == 9 ) {
			            var xxids = xxk[i].id;
			            var xxid = xxids.substring(0,5);
			            if (xxid == 'xuanx' ) {
			                if ( xxk[i].id ==  x1 ) {
			                    xxk[i].style.boxShadow = '';
			                    xxk[i].style.opacity = '1';
			                } else {
			                    xxk[i].style.opacity = '0.5';
			                    xxk[i].style.boxShadow = '1px 0px 2px 0px #c0c0c0';
			                }
			            }
			        }
			    }
			    //将制定导航按钮设置为选中状态
			    var dhk = document.getElementsByTagName('div');
			    for (var i = 0; i < dhk.length; i++) {
			        if (dhk[i].id.length == 4) {
			            var dhid = dhk[i].id.substring(0,2);
			            var dhid3 = x1.substring(5);
			            var dhid2 = 'cd'+dhid3.substring(0,2);
			            if (dhid == 'cd') {
			                if (dhk[i].id == dhid2) {
			                    dhk[i].style.backgroundColor = '#1b5c8b';
			                } else {
			                    dhk[i].style.backgroundColor = '#206ca4';
			                }
			            }
			        }
			    }
			}
			//关闭某个ID的DIV层
			function gbxxk(x1) {
			    var xxk = document.getElementById(x1);
			    xxk.parentNode.removeChild(xxk);
			}
			//关闭选项卡同时寻找上一个选项卡的IDxuanx0000
			function gbjdxs (x1) {
			    var xxkid = x1.substring(0,9);
			    var xzhaoid = '';
			    //屏蔽底层DIV的事件
			    var dqxxk = document.getElementById(xxkid);
			    dqxxk.setAttribute('onclick','');
			    var xxk = document.getElementsByTagName('div');
			    for (var i = 0; i < xxk.length; i++) {
			        if (xxk[i].id.length == 9) {
			            var xxkid1 = xxk[i].id.substring(0,5);
			            if (xxkid1 == 'xuanx') {
			                if (xxk[i].id == xxkid) {
			                    //当寻找到当前选项卡时，删掉选项卡和iframe表单
			                    var xxkids = xxk[i].id;
			                    var ifrid = xxkids.substring(5);
			                    var ifrid0 = 'ifr'+ifrid;
			                    var ifrid1 = document.getElementById(ifrid0);
			                    ifrid1.parentNode.removeChild(ifrid1);
			                    xxk[i].parentNode.removeChild(xxk[i]);
			                    break;
			                } else {
			                    xzhaoid = xxk[i].id;
			                }
			            }
			        }
			    }
			    if (dqxxk.style.opacity == '1') {jdsz(xzhaoid);}
			}
			//设置刷新按钮的方法
			function shuaxin() {
			    var xxk = document.getElementsByTagName('iframe');
			    for (var i = 0; i < xxk.length; i++) {
			        if (xxk[i].style.zIndex == 5) {
			            var ll = xxk[i].id.substring(3);
			            ll =  ll.substring(0,2);
			            var hh = xxk[i].id.substring(5);
			            if (xxk[i].id.substring(3) == '9999') {
			                xxk[i].src = xxk[i].src;
			            } else {
			                ll = parseInt(ll);
			                hh = parseInt(hh);
			                xxk[i].src = xxk[i].src;
			            }
			            break;
			        }
			    }
			}
			addxxk ('cd0200','/jrdpc/gdcl.html');//默认打开
		</script>
	</div>
	

	 
</body>
</html>
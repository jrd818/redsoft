<?php 
    $mysql_sever_name='192.168.0.158';//内网地址
    $mysql_username = 'redsoft';
    $mysql_password = 'redsoft';
    $mysql_database = 'redsoft5200818';
    //设置浏览器字符集
    header("content-type:text/html;charset=utf-8");
    //建立链接
    $link =	mysqli_connect($mysql_sever_name,$mysql_username,$mysql_password) or die("链接失败</br>".mysqli_connect_errno().":");
    //设置数据库字符集
    mysqli_set_charset($link,'utf8');
    //打开指定数据库
    mysqli_select_db($link, $mysql_database) or die("打开制定数据库失败".mysqli_errno($link));
    //开始查询
?>
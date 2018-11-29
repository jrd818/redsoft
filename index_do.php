<?php 
require_once $_SERVER['DOCUMENT_ROOT']."/functions/gghanshu.php";

if ( $_POST['w'] == '退出登录') {//3
    session_unset();
    setcookie("user","");
    if (isset($_SESSION['user'])) {
        session_destroy();
        cwsj('301','退出登录失败','重要');
    } else {
        $jieguo[0] = 'success';
        $jieguo[1] = '提交成功！';
    }
    echo json_encode($jieguo,JSON_UNESCAPED_UNICODE);
} 

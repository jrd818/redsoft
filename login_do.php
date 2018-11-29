<?
header("Content-type:text/html;charset=utf-8");
require_once "config/db_config.php";//数据库配置文件
require_once "functions/gghanshu.php";//权限以及错误处理
// cwsj('104','提交表单失败','一般');

if ($_POST['zh'] && $_POST['ma']) {
    session_start();
    $_SESSION["user"] = '';
    $bm = $_POST['zh'];
    $mm = $_POST['ma'];
    $sx = time()+24*3600*365;//失效时间
    $cz = 0;
    $sql = "SELECT * FROM 职员信息 ;";
    $reslut = mysqli_query($link,$sql);
    if ($reslut) {
        while ($rows = mysqli_fetch_array($reslut)) {
            if (($rows['工号']==$bm) &&  ($rows['登录密码']==$mm) ) {
                $cz++;
                $_SESSION["user"] = $rows['昵称'];
                $_SESSION["path"] = dirname(__FILE__);
                setcookie("user",$rows['昵称'],$sx);
                $jieguo[0] = "success";
                $jieguo[1] .= "登录成功！";
            } 
        }
    } else {
        $jieguo[0] = "false";
        $jieguo[1] .= "无法访问数据库";
    }
    if ($cz == 0) {
        $jieguo[0] = "false";
        $jieguo[1] .= "账号或者密码错误！";
    }
} else if (!$_POST['zh']) {
    $jieguo[0] = "false";
    $jieguo[1] .= "请输入账号";
} else {
    $jieguo[0] = "false";
    $jieguo[1] .= "请输入登陆密码";
}
echo json_encode($jieguo,JSON_UNESCAPED_UNICODE);
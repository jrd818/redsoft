<?php 
require_once $_SERVER['DOCUMENT_ROOT']."/functions/gghanshu.php";

if ( $_POST['r'] == '查询工单') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    $jg = acc_arr('工单处理','查询');
    if ($jg) {
        foreach ($jg as $key => $value) {
            if ($value[0]['进度'] != '00') {
                $jieguo[1][] = $value;
            }
        }
    }
}   

elseif ( $_POST['r'] == '查询联系人') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    $jg = acc_arr('客户主体','查询所有联系人');
    if ($jg) {
        foreach ($jg as $key => $value) {
            $jieguo[1][] = $value;
        }
    }
}  

elseif ($_POST['w'] == '提交工单') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    $arr = [];
    $arr['TV_ID'] = $_POST['TV_ID'];
    unset($_POST['w']);
    unset($_POST['TV_ID']);
    $_POST['创建时间'] = date("Y-m-d h:i:s");
    $_POST['创建人'] = $_SESSION['user'];
    $_POST['状态'] = '有效';//作废，删除，取消
    $_POST['进度'] = '新建';
    if ($_FILES["图片"]["name"]) {
        move_uploaded_file($_FILES["图片"]["tmp_name"], $_SERVER['DOCUMENT_ROOT']."/tupian/gongdantupian/".$_FILES["图片"]["name"]);
        $_POST['图片'] = "/tupian/gongdantupian/".$_FILES["图片"]["name"];
    }
    acc_arr('工单处理','新增', $_POST);
    //如果不存在联系人，就增加联系人
    
    $arr['QQ号码'] = $_POST['QQ号码'];
    $jg = acc_arr('客户主体','查询联系人',$arr);
    if (!$jg) {
        $arr['QQ群'] = $_POST['QQ群'];
        $arr['QQ备注'] = $_POST['QQ备注'];
        
        acc_arr('客户主体','新增联系人', $arr);
    } else {
        $arr['QQ群'] = $_POST['QQ群'];
        $arr['QQ备注'] = $_POST['QQ备注'];
        
        acc_arr('客户主体','修改联系人', $arr);
    }
}

elseif ($_POST['w'] == '改变工单进度') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    unset($_POST['w']);
    if ($_POST['进度'] == '处理') {
        $_POST['开始处理时间'] = date("Y-m-d h:i:s");
        $_POST['处理人'] = $_SESSION['user'];
    } elseif ($_POST['进度'] == '结束') {
        $_POST['结束处理时间'] = date("Y-m-d h:i:s");
        $_POST['完工人'] = $_SESSION['user'];
    }
    acc_arr('工单处理','修改', $_POST);
}
elseif ( yz('删除工单')) {
    if (acc_arr('工单处理','删除', $_POST)) {
        $jieguo[0] = 'success';
        $jieguo[1] = '删除工单成功！';
    }
}
//工单明细
elseif ( $_POST['w'] == '解决方案') {//新增解决方案
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    move_uploaded_file($_FILES["图片1"]["tmp_name"], $_SERVER['DOCUMENT_ROOT']."/tupian/gongdantupian/".date("Ymd").'/'.$_FILES["图片"]["name"]);
    $arr['处理时间'] = date("Y-m-d h:i:s");
    $arr['处理人'] = $_SESSION['user'];
    $arr['工单编码'] = $_POST['工单编码'];
    $arr['处理内容'] = $_POST['处理内容'];
    if ($_FILES["图片"]["name"]) {
        $arr['图片'] = "/tupian/gongdantupian/".date("Ymd").'/'.$_FILES["图片"]["name"];
    }
    $jieguo[1] .= acc_arr('工单处理','新增明细', $arr);
}
elseif ($_POST['r'] == '获取工单明细') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    $jieguo[1] = acc_arr('工单处理','查询明细',$_POST);
} 

//原始方法提交
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
} else {
    jieshu();
}

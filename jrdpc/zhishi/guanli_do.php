<?php 
require_once $_SERVER['DOCUMENT_ROOT']."/functions/gghanshu.php";

if ( $_POST['r'] == '查询知识') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    $jg = acc_arr('知识库','查询');
    if ($jg) {
        foreach ($jg as $key => $value) {
            if ($value[0]['创建人'] == $_SESSION['user']) {
               $value[0]['内容'] = urldecode($value[0]['内容']);
               $value[0]['内容'] = htmlspecialchars_decode($value[0]['内容']);
               $jieguo[1][] = $value;
            }
        }
    }
}   

elseif ($_POST['w'] == '新增知识') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    unset($_POST['w']);
    unset($_POST['editorValue']);
    $_POST['创建时间'] = date("Y-m-d h:i:s");
    $_POST['创建人'] = $_SESSION['user'];
    $_POST['状态'] = '有效';//作废，删除，取消
    $wenjianjia = "/tupian/zhishitupian/".date("Ymd");
    if (!file_exists($_SERVER['DOCUMENT_ROOT'].$wenjianjia) ) {
        mkdir($_SERVER['DOCUMENT_ROOT'].$wenjianjia, 0777, true);
    } 
    if ($_FILES["图片"]["name"]) {
        move_uploaded_file($_FILES["图片"]["tmp_name"], $_SERVER['DOCUMENT_ROOT'].$wenjianjia."/".$_FILES["图片"]["name"]);
        $_POST['图片'] = $wenjianjia."/".$_FILES["图片"]["name"];
    }
    acc_arr('知识库','新增', $_POST); 
    
}
elseif ($_POST['w'] == '修改知识') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    unset($_POST['w']);
    $wenjianjia = "/tupian/zhishitupian/".date("Ymd");
    if (!file_exists($_SERVER['DOCUMENT_ROOT'].$wenjianjia) ) {
        mkdir($_SERVER['DOCUMENT_ROOT'].$wenjianjia, 0777, true);
    } 
    if ($_FILES["图片"]["name"]) {
        move_uploaded_file($_FILES["图片"]["tmp_name"], $_SERVER['DOCUMENT_ROOT'].$wenjianjia."/".$_FILES["图片"]["name"]);
        $_POST['图片'] = $wenjianjia."/".$_FILES["图片"]["name"];
    }
    acc_arr('知识库','修改', $_POST); 
    
}

elseif ($_POST['w'] == '改变工单进度') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    unset($_POST['w']);
    acc_arr('知识库','修改', $_POST);
}
elseif ( $_POST['w'] == '删除知识') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    unset($_POST['w']);
    if (acc_arr('知识库','删除', $_POST)) {
        $jieguo[0] = 'success';
        $jieguo[1] = '删除知识成功！';
    }
}
//工单明细
elseif ( yz('提交明细')) {
    if ($_FILES["图片1"]["error"] > 0) {
        sb($_FILES["图片1"]["error"]);
    } else {
        move_uploaded_file($_FILES["图片1"]["tmp_name"], $_SERVER['DOCUMENT_ROOT']."/images/gdcl/".$_FILES["图片1"]["name"]);
        $arr['创建时间'] = date("Y-m-d h:i:s");
        $arr['职员名称'] = $_SESSION['user'];
        $arr['工单编码'] = $_POST['工单编码'];
        $arr['回复类容'] = $_POST['回复类容'];
        if ($_FILES["图片1"]["name"]) {
            $arr['图片1'] = "/images/gdcl/".$_FILES["图片1"]["name"];
        }
        acc_arr('知识库','新增明细', $arr);
    }
}
elseif ( yz('获取工单明细')) {
    $jieguo[1] = acc_arr('知识库','查询明细',$_POST);
} 

jieshu();
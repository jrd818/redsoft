<?php 
require_once $_SERVER['DOCUMENT_ROOT']."/functions/gghanshu.php";

if ( $_POST['r'] == '查询知识') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    $jg = acc_arr('知识库','查询');
    if ($jg) {
        foreach ($jg as $key => $value) {
            $jieguo[1][] = $value;
        }
    }
}   

elseif ($_POST['w'] == '新增知识') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    unset($_POST['w']);
    $_POST['创建时间'] = date("Y-m-d h:i:s");
    $_POST['创建人'] = $_SESSION['user'];
    $_POST['状态'] = '有效';//作废，删除，取消
    $_POST['内容'] = htmlentities($_POST['内容']);//SQL存储时候需要编码
    $_POST['内容'] = urlencode($_POST['内容']);//POST 发送时候需要编码
    if ($_FILES["图片"]["name"]) {
        move_uploaded_file($_FILES["图片"]["tmp_name"], $_SERVER['DOCUMENT_ROOT']."/tupian/zhishitupian/".$_FILES["图片"]["name"]);
        $_POST['图片'] = "/tupian/zhishitupian/".$_FILES["图片"]["name"];
    }
    acc_arr('知识库','新增', $_POST);
}

elseif ($_POST['w'] == '改变工单进度') {
    $yz_yc = 0;//确保验证一次，后续使用：yz（）函数的时候，就不需要这个了
    print($_POST);
    // unset($_POST['w']);
    // acc_arr('知识库','修改', $_POST);
}
elseif ( yz('删除工单')) {
    if (acc_arr('知识库','删除', $_POST)) {
        $jieguo[0] = 'success';
        $jieguo[1] = '删除工单成功！';
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
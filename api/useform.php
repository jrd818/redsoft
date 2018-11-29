<?php
include_once $_SERVER['DOCUMENT_ROOT']."/config/db_config.php";
if (!$_POST) { cw(__FILE__.' line '.__LINE__,'没有检测到POST数据','一般');}
elseif (!$_POST['q']) { cw(__FILE__.' line '.__LINE__,'没有检测到"q"请求','一般');}
$js_nr = array();//存放接受的POST['data']
function q($qingqiu) {//请求验证
    global $js_nr;
    if ($_POST['q'] != $qingqiu) {
        return 0;
    } elseif ($_POST['q'] == $qingqiu) {
        if ($_POST['data']) {
            $js_nr = json_decode($_POST['data'],TRUE);
        }
        return 1;
    } else {
        sb('未接收到q请求！');
        return 0;
    }
}
$fanhui = array();//存放请求返回结果 
$cg = 1;//记录是否成功，已经废弃了，有失败就不需要这个了
$cuowu .= '';//存放调试错误信息
function cw($laiyuan,$neirong,$dengji) {//保存并记录错误信息
    global $cuowu,$link,$cg,$shibai;
    $cg = 0;
    $cuowu .= '</br>error：'.$neirong.'，on '.$laiyuan.";\n";
    $sj = date("Y-m-d h-i-s");
    $czy = $_SESSION["user"];
    $neirong = addslashes($neirong);
    $sql =  "INSERT INTO `系统错误记录` (`时间`, `错误内容`, `错误等级`, `错误来源`, `操作员`) VALUES ('$sj', '$neirong', '$dengji', '$laiyuan', '$czy')";
    $reslut = mysqli_query($link, $sql);
    if ( !$reslut) {
        $cuowu .= '</br>error：自动记录错误失败！，on '.__FILE__.' line '.__LINE__.';';
    }
    return 0;
}
$shibai .= '';//存放执行失败的信息
function sb($value='') {//存放失败信息
    global $shibai,$cg;
    $cg = 0;
    $shibai .= $value;
    return 0;
}
function insert($table,$data){//插入数据
    global $link;
    $keys = join(', ',array_keys($data));
    $vals = "'".join("', '",array_values($data))."'";
    $query = "INSERT INTO {$table} ({$keys}) VALUES ({$vals});";
    $res = mysqli_query($link,$query);
    if ($res) {
        return 1;
    } else {
        return cw(__FILE__.' line '.__LINE__,$query,'紧急');
    }
}
function delete($table,$where = null){//删除数据
    global $link;
    $where = $where ? ' WHERE '.$where : '';
    $query = "DELETE FROM {$table}  {$where}";
    $res = mysqli_query($link,$query);
    if ($res) {
        return 1;
    } else {
        echo $query;
        cw(__FILE__.' line '.__LINE__,$query,'紧急');
        return 0;
    }
}
function update($table,$data,$where = null){//修改数据
    global $link;
    foreach ($data as $key => $value) {
        $set .= "{$key} = '{$value}',";
    }
    $set = trim($set,',');
    $where = $where ? ' WHERE '.$where : '';
    $query = "UPDATE {$table} SET {$set} {$where};";
    $res = mysqli_query($link,$query);
    if ($res) {
        return 1;
    } else {
        return cw(__FILE__.' line '.__LINE__,$query,'紧急');
    }
}
function serch($table,$where = null){//查询数据
    global $link;
    $where = $where ? ' WHERE '.$where : '';
    $query = "SELECT * FROM  {$table}  {$where}";
    $res = mysqli_query($link,$query);
    if ($res) {
        $arr = array();
        while ($rows = mysqli_fetch_array($res,MYSQLI_ASSOC)) {
           $arr[] = $rows;
        }
        return $arr;
    } else {
        cw(__FILE__.' line '.__LINE__,$query,'紧急');
        return 0;
    }
}
function begin(){////开始事务
    global $link;
    mysqli_query($link,"BEGIN");
}
function end_api() {//结束事务并返回调用
    global $cuowu,$shibai,$fanhui,$link,$cg;
    if ($cuowu) {
        $fanhui[0] = 'error';
        $fanhui[1] = $cuowu;
    } else {
        if ($shibai) {
            $fanhui[0] = 'false';
            $fanhui[1] = $shibai;
        } else {
            $fanhui[0] = 'success';
        }
    }
    echo json_encode($fanhui,JSON_UNESCAPED_UNICODE);
    if ($cg) {
        mysqli_query($link,"COMMIT");
    } else {
        mysqli_query($link,"ROLLBACK");
    }
}
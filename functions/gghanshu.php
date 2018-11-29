<?php
//设置cookie 失效时间
$time_out = 365*24*60*60;
session_set_cookie_params($time_out);
session_start();
include_once $_SERVER['DOCUMENT_ROOT']."/config/db_config.php";
include_once $_SERVER['DOCUMENT_ROOT']."/functions/table_config.php";
$jieguo = array();//存放请求结果
$cg = 1;//默认执行成功,发生错误或者失败时候自动设置为0
$cuowu = '';//存放程序错误信息
function cw($laiyuan,$neirong) {//保存并记录错误信息
    global $cuowu,$cg;
    $cg = 0;
    if ($neirong == '') {
        $neirong = "【空值】";
    }
    $cuowu .= '</br>error：'.$neirong.'，on '.$laiyuan.';';
    return 0;
}
$shibai = '';//存放执行失败的信息
function sb($value='') {//存放失败信息
    global $shibai,$cg;
    $cg = 0;
    $shibai .= $value;
    return 0;
}
function quanxian($cd ='') { //判断是有有权限,0:未登录，1：非法请求，2：无查询权限，3：查询权限，4：读取权限
    if (isset($_SESSION["user"])) {
        global $link;
        $czr = $_SESSION["user"];
        $cdbm = '';
        $lianjie = '';
        if ($cd != '') {
            $sql2 = "SELECT * FROM 菜单项 WHERE 菜单项名称 = '$cd';";
            $reslut2 = mysqli_query($link,$sql2);
            if ($reslut2) {
                while ($rows2 = mysqli_fetch_array($reslut2)) {
                    $cdbm = $rows2['编码'];
                }
            } else {
                return cw(__FILE__.' line '.__LINE__,'菜单项读取失败','紧急');
            }
        } else {
            $aabb = $_SERVER['HTTP_REFERER'];//上一个页面url
            if ($aabb == 'http://jrd.sijiuen.com' ||  $aabb == '') {
                //前台页面权限验证
                $lianjie = $_SERVER['REQUEST_URI'];
            } else {
                //后台页面权限验证
                $lianjie = substr(strstr($aabb, 'jrd.sijiuen.com'),15);
            }
            $sql2 = "SELECT * FROM 菜单项 WHERE 菜单链接 = '$lianjie';";
            $reslut2 = mysqli_query($link,$sql2);
            if ($reslut2) {
                while ($rows2 = mysqli_fetch_array($reslut2)) {
                    $cdbm = $rows2['编码'];
                }
            } else {
                return cw(__FILE__.' line '.__LINE__,'权限读取失败','紧急');
            }
        }
        if ($cdbm == '') {
            sb('非法链接:'.$_SERVER['HTTP_REFERER']);
            return 1;
        } else {
            $cz = 0;
            $sf = '';
            $sql = "SELECT * FROM 菜单权限关联表 WHERE 被授权昵称 = '$czr' AND 权限编码 = '$cdbm';";
            $reslut = mysqli_query($link,$sql);
            if ($reslut2) {
                while ($rows = mysqli_fetch_array($reslut)) {
                    $cz = 1;
                    $sf = $rows['写入权限'];
                }
            } else {
                return cw(__FILE__.' line '.__LINE__,'权限关联读取失败','紧急');
            }
            if ($cz == 1) {
                if ($sf == '是') {
                    return 4;
                }  else  {
                    return 3;
                }
            } else {
                cw(__FILE__.' line '.__LINE__,'无查询权限','一般');
                return 2;
            }
        }
    } else {
        return sb('未检测到登录状态！');
    }
}
$yz_yc = 1;//确保只验证一次
function yz($value){//判断分析请求参数
    global $yz_yc;
    if ($yz_yc) {
        if (!$_POST['r'] && !$_POST['w']) {
            return sb('没有发现r或w请求！');
        } elseif ($_POST['r'] != $value && $_POST['w'] != $value) {
            return 0;
        } elseif ($_POST['r'] && $_POST['w']) {
            return cw(__FILE__.' line '.__LINE__,'不能同时出现r和w请求！');
        } else {
            $yz_yc = 0;
            $q_x = quanxian();//检测权限
            if ($q_x == 0) {
                return 0;
            } elseif ($q_x == 1) {
                return 0;
            } elseif ($q_x == 2) {
                return sb('权限不够！！');
            } elseif ($q_x >= 3) {
                if ($_POST['r']) {
                    if ($_POST['r'] == $value) {
                        return 1;
                    } else {
                        return 0;
                    }
                } elseif ($_POST['w']) {
                    if ($q_x != 4) {
                        $cuowu .= '权限不够！！';
                        return 0;
                    } else {
                        if ($_POST['w'] == $value) {
                            return 1;
                        } else {
                            return 0;
                        }
                    }
                }
            }
        }
    }
}
function sendPost($url, $datas) {//POST发送数据
    if (!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%
    =~_|]/i",$url)) {
      sb("无效的 URL:".$url);return 0;
    }
    if (!is_array($datas)) {
        sb("无效的 参数:".$datas);return 0;
    }
    $temps = array();   
    foreach ($datas as $key => $value) {
        $temps[] = sprintf('%s=%s', $key, $value);
    }   
    $post_data = implode('&', $temps);
    $url_info = parse_url($url);
    if(empty($url_info['port']))
    {
        $url_info['port']=80;   
    }
    $httpheader = "POST " . $url_info['path'] . " HTTP/1.0\r\n";
    $httpheader.= "Host:" . $url_info['host'] . "\r\n";
    $httpheader.= "Content-Type:application/x-www-form-urlencoded\r\n";
    $httpheader.= "Content-Length:" . strlen($post_data) . "\r\n";
    $httpheader.= "Connection:close\r\n\r\n";
    $httpheader.= $post_data;
    $fd = fsockopen($url_info['host'], $url_info['port']);
    fwrite($fd, $httpheader);
    $gets = "";
    $headerFlag = true;
    while (!feof($fd)) {
        if (($header = @fgets($fd)) && ($header == "\r\n" || $header == "\n")) {
            break;
        }
    }
    while (!feof($fd)) {
        $gets.= fread($fd, 128);
    }
    fclose($fd);
    
    return $gets;
}
function acc_arr($table,$rquire,$data = ''){//发送并接受服务器的数据并转化为数组
    global $tb;
    if (!$table) {
        return cw(__FILE__.' line '.__LINE__,'表单名称不能为空：$table');
    } elseif (!$tb[$table]) {
        return cw(__FILE__.' line '.__LINE__,'表单接口未配置：'.$table);
    } elseif (!$rquire) {
        return cw(__FILE__.' line '.__LINE__,'请求命令不能为空！$rquire');
    } elseif ($arr && !is_array($arr)) {
        return cw(__FILE__.' line '.__LINE__,'$arr应该为数组！$rquire');
    } else {
        $arr = array();
        $arr['q'] = $rquire;
        if ($data) {
            $arr['data'] = json_encode($data);
        }
        $jg = sendPost($tb[$table], $arr);
        $sd = json_decode($jg,true);
        if (!$jg) {
            return cw(__FILE__.' line '.__LINE__,'API请求结果为空！');
        } else if (!$sd) {
            return cw(__FILE__.' line '.__LINE__,'API返回为非JOSN文件！'.$jg);
        } else if (!is_array($sd)) {
            return cw(__FILE__.' line '.__LINE__,'JOSN为数组失败！');
        } else {
            if ($sd[0] == 'success') {
                return $sd[1];
            } else {
                return sb($sd[1]);
            }
        }
    }
}
function jieshu() {//结束一个页面返回结果或者显示错误
    global $cuowu,$shibai,$jieguo,$yz_yc;
    if ($cuowu) {
        $jieguo[0] = 'error';
        $jieguo[1] .= $cuowu;
    } else {
        if ($shibai) {
            $jieguo[0] = 'false';
            $jieguo[1] .= $shibai.';';
        } else {
            if ($yz_yc) {
                $jieguo[0] = 'error';
                $jieguo[1] .= '没有找到指令：'.$_POST['r'].$_POST['w'];
            } else {
                $jieguo[0] = 'success';
            }
        }
    }
    echo json_encode($jieguo,JSON_UNESCAPED_UNICODE);
}
function lsqz($value=''){//临时无权限验证
    global $yz_yc;
    if ($yz_yc) {
        if (!$_POST['r'] && !$_POST['w']) {
            return sb('没有发现r或w请求！');
        } elseif ($_POST['r'] != $value && $_POST['w'] != $value) {
            return 0;
        } elseif ($_POST['r'] && $_POST['w']) {
            return cw(__FILE__.' line '.__LINE__,'不能同时出现r和w请求！');
        } else {
            $yz_yc = 0;
            return 1;
        }
    }
}
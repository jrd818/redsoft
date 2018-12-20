<?
include_once $_SERVER['DOCUMENT_ROOT']."/api/EditTable.php";
begin();//开启事务
$gdcl =  new EditTable('工单处理');
$gdcl_mx =  new EditTable('工单处理明细');
function jiance(){//检测数据完整性
    global $gdcl,$js_nr;
    if (!$js_nr['工单编码']) {
        cw(__FILE__.' line '.__LINE__,'工单编码不存在','紧急');
    } else if (!$js_nr['问题标题']) {
        sb('问题标题名称不能为空！');
    } else if (!$js_nr['QQ号码']) {
        sb('QQ号码不能为空！');
    } else if (!$js_nr['单位名称'] && !$js_nr['群备注']) {
        sb('单位名称和备注昵称不能同时为空！');
    } 
}

function jiancemingxi(){//检测明细数据完整性
    global $js_nr;
    if (!$js_nr['工单编码']) {
        cw(__FILE__.' line '.__LINE__,'工单编码不存在','紧急');
    } else if (!$js_nr['工单明细编码']) {
        sb('工单明细编码不能为空！');
    } else if (!$js_nr['处理人']) {
        sb('处理人不能为空！');
    } else if (!$js_nr['处理时间']) {
        sb('处理时间不能为空！');
    } else if (!$js_nr['处理内容'] && !$js_nr['图片']) {
        sb('处理内容和图片不能同时为空！');
    } 
}

function getId(){//获取ID
    global $gdcl;
    $sup = $gdcl->ser();
    $ID = 10001;
    $xh = 1;
    while ($xh == 1) {
        $xh = 0;
        foreach ($sup as $key => $value) {
            if ($value['工单编码'] == $ID) {
                $ID++;
            }
        }
        foreach ($sup as $key => $value) {
            if ($value['工单编码'] == $ID) {
                $xh = 1;break;
            }
        }
    }
    return $ID;
}
function getId_mx($bm){//获取ID
    global $gdcl_mx;
    $sup = $gdcl_mx->ser();
    $ID = $bm.'101';
    $xh = 1;
    while ($xh == 1) {
        $xh = 0;
        foreach ($sup as $key => $value) {
            if ($value['工单明细编码'] == $ID) {
                $ID++;
            }
        }
        foreach ($sup as $key => $value) {
            if ($value['工单明细编码'] == $ID) {
                $xh = 1;break;
            }
        }
    }
    return $ID;
}
if (q('查询')) {
    $sup = $gdcl->ser();
    $kk = 0;
    foreach ($sup as $key => $value) {
        if ($value['状态'] == '有效') {
            $fanhui[1][$kk][0] = $value;
            $fanhui[1][$kk][1] = $gdcl_mx->ser("工单编码 = '".$value['工单编码']."';");
            $kk++;
        }
    }
}
elseif (q('新增')) {
    $js_nr['工单编码'] = getId();
    $js_nr['进度'] = '新建';
    jiance();
    $gdcl->ins($js_nr);
}
elseif (q('修改')) {
    $where = "工单编码 = '".$js_nr['工单编码']."'";
    $gdcl->upd($js_nr,$where);
}
elseif (q('删除')) {
    $where = "工单编码 = '".$js_nr['工单编码']."'";
    $arr['状态'] = '删除';
    $gdcl->upd($arr,$where);
}


//明细
elseif (q('新增明细')) {
    $js_nr['工单明细编码'] = getId_mx($js_nr['工单编码']);
    jiancemingxi();
    $gdcl_mx->ins($js_nr);
}
if (q('查询明细')) {
    $sup = $gdcl_mx->ser();
    foreach ($sup as $key => $value) {
        if ($value['工单编码'] == $js_nr['工单编码']) {
            $fanhui[1][] = $value;
        }
    }
}
end_api();//结束调用整理参数，并结事务

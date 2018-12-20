<?
include_once $_SERVER['DOCUMENT_ROOT']."/api/EditTable.php";
begin();//开启事务
$gdcl =  new EditTable('客户主体');
$gdcl_mx =  new EditTable('联系人');
function jiance(){//检测数据完整性
    global $gdcl,$js_nr;
    if (!$js_nr['知识ID']) {
        cw(__FILE__.' line '.__LINE__,'知识ID不存在','紧急');
    } else if (!$js_nr['标题']) {
        sb('标题不能为空！');
    } else if (!$js_nr['内容']) {
        sb('内容不能为空！');
    } else if (!$js_nr['创建人']) {
        sb('创建人不能为空！');
    } 
}
function getId(){//获取ID
    global $gdcl;
    $sup = $gdcl->ser();
    $ID = 100001;
    $xh = 1;
    while ($xh == 1) {
        $xh = 0;
        foreach ($sup as $key => $value) {
            if ($value['知识ID'] == $ID) {
                $ID++;
            }
        }
        foreach ($sup as $key => $value) {
            if ($value['知识ID'] == $ID) {
                $xh = 1;break;
            }
        }
    }
    return $ID;
}
function getId_mx(){//获取ID
    global $gdcl_mx;
    $sup = $gdcl_mx->ser();
    $ID = date("Ym").'10001';
    $xh = 1;
    while ($xh == 1) {
        $xh = 0;
        foreach ($sup as $key => $value) {
            if ($value['联系人ID'] == $ID) {
                $ID++;
            }
        }
        foreach ($sup as $key => $value) {
            if ($value['联系人ID'] == $ID) {
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
            $fanhui[1][$kk][1] = $gdcl_mx->ser("知识库ID = '".$value['知识库ID']."';");
            $kk++;
        }
    }
}
elseif (q('新增')) {
    $js_nr['知识ID'] = getId();
    jiance();
    $gdcl->ins($js_nr);
}
elseif (q('修改')) {
    $where = "知识库ID = '".$js_nr['知识库ID']."'";
    $gdcl->upd($js_nr,$where);
}
elseif (q('删除')) {
    $where = "知识库ID = '".$js_nr['知识库ID']."'";
    $arr['状态'] = '删除';
    $gdcl->upd($arr,$where);
}


//明细
elseif (q('新增联系人')) {
    $js_nr['联系人ID'] = getId_mx();
    if (!$js_nr['QQ号码']) {
        sb('请输入QQ号码');
    }
    $gdcl_mx->ins($js_nr);
}
elseif (q('修改联系人')) {
    $js_nr['联系人ID'] = getId_mx();
    if (!$js_nr['QQ号码']) {
        sb('请输入QQ号码');
    }
    $where = "QQ号码 = '".$js_nr['QQ号码']."'";
    $gdcl_mx->upd($js_nr,$where);
}
elseif (q('查询联系人')) {
    $sup = $gdcl_mx->ser();
     $fanhui[1] = 0;
    foreach ($sup as $key => $value) {
        if ($value['QQ号码'] == $js_nr['QQ号码']) {
            $fanhui[1] = 1;
        }
    }
}
elseif (q('查询所有联系人')) {
    $fanhui[1] = $gdcl_mx->ser();
}
end_api();//结束调用整理参数，并结事务

<?
include_once $_SERVER['DOCUMENT_ROOT']."/api/EditTable.php";
begin();//开启事务
$gdcl =  new EditTable('知识库');
$gdcl_mx =  new EditTable('知识库明细');
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
function getId_mx($bm){//获取ID
    global $gdcl_mx;
    $sup = $gdcl_mx->ser();
    $ID = $bm.'101';
    $xh = 1;
    while ($xh == 1) {
        $xh = 0;
        foreach ($sup as $key => $value) {
            if ($value['明细ID'] == $ID) {
                $ID++;
            }
        }
        foreach ($sup as $key => $value) {
            if ($value['明细ID'] == $ID) {
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
        if ($value['作废'] != '作废') {
            $fanhui[1][$kk][0] = $value;
            $fanhui[1][$kk][1] = $gdcl_mx->ser("知识库ID = '".$value['知识ID']."';");
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
    $where = "知识ID = '".$js_nr['知识ID']."'";
    $gdcl->upd($js_nr,$where);
}
elseif (q('删除')) {
    $where = "知识ID = '".$js_nr['知识ID']."'";
    $arr['作废'] = '作废';
    $gdcl->upd($arr,$where);
}


//明细
elseif (q('新增明细')) {
    $js_nr['明细ID'] = getId_mx($js_nr['知识库ID']);
    if (!$js_nr['明细内容']  && !$js_nr['图片']) {
        sb('请输入内容或者上传图片');
    }
    $gdcl_mx->ins($js_nr);
}
if (q('查询明细')) {
    $sup = $gdcl_mx->ser();
    foreach ($sup as $key => $value) {
        if ($value['知识库ID'] == $js_nr['知识库ID']) {
            $fanhui[1][] = $value;
        }
    }
}
end_api();//结束调用整理参数，并结事务

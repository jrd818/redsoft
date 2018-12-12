<?php
// define("fw_url", "http://redsoft868.gnway.cc:88");
define("fw_url", "http://localhost:88");
//财务
$tb = array();
$tb['部门列表'] = fw_url.'/api/xingzheng/bmlb_api.php';
$tb['套帐信息'] = fw_url.'/api/caiwu/tzxx_api.php';
$tb['固定资产'] = fw_url.'/api/caiwu/gdzc_api.php';
$tb['存款账户'] = fw_url.'/api/caiwu/ckzh_api.php';
$tb['采购主体'] = fw_url.'/api/caiwu/cgzt_api.php';
$tb['销售主体'] = fw_url.'/api/caiwu/xszt_api.php';
$tb['科目余额'] = fw_url.'/api/caiwu/kmye_api.php';
$tb['科目列表'] = fw_url.'/api/caiwu/kmlb_api.php';
$tb['凭证列表'] = fw_url.'/api/caiwu/pzlb_api.php';
$tb['期末结账'] = fw_url.'/api/caiwu/qmjz_api.php';

//行政
$tb['职员列表'] = fw_url.'/api/xingzheng/zylb_api.php';

//采购
$tb['供应商管理'] = fw_url.'/api/caigou/gysgl_api.php';
$tb['产品管理'] = fw_url.'/api/caigou/cpgl_api.php';
$tb['采购订单'] = fw_url.'/api/caigou/cgdd_api.php';
$tb['采购退货'] = fw_url.'/api/caigou/cgth_api.php';

//仓储
$tb['产品库存'] = fw_url.'/api/cangchu/cpkc_api.php';
$tb['仓库列表'] = fw_url.'/api/cangchu/cklb_api.php';
$tb['采购入库'] = fw_url.'/api/cangchu/cgrk_api.php';
$tb['采购出库'] = fw_url.'/api/cangchu/cgck_api.php';

//销售
$tb['客户信息'] = fw_url.'/api/xiaoshou/khxx_api.php';
$tb['商品管理'] = fw_url.'/api/xiaoshou/spgl_api.php';
$tb['关联产品'] = fw_url.'/api/xiaoshou/glcp_api.php';
$tb['销售订单'] = fw_url.'/api/xiaoshou/xsdd_api.php';

//售后
$tb['合作安装店'] = fw_url.'/api/shouhou/hzazd_api.php';
$tb['售后订单'] = fw_url.'/api/shouhou/shdd_api.php';

//管理
$tb['工单处理'] = fw_url.'/api/guanli/gdcl_api.php';
$tb['账号管理'] = fw_url.'/api/guanli/zhgl_api.php';

//知识
$tb['知识库'] = fw_url.'/api/zhishi/zhishiku_api.php';
$tb['客户主体'] = fw_url.'/api/zhishi/kehu_api.php';
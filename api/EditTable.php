<?php
include_once $_SERVER['DOCUMENT_ROOT']."/api/useform.php";
/**
* 编辑表单
*/
class EditTable {
    public $table;
    public $data;
    public function __construct($table){
        $this->table = $table;
    }
    public function ser($where = null) {//读取表单
        $cx =  serch($this->table, $where);
        if ($cx == 0  && !is_array($cx)) {
            return cw(__FILE__.' line '.__LINE__,'查询：'.$table.'WHERE'.$where.'失败！','一般');
        } else {
            $this->data = $cx;
            return $cx;
        }
    }
    public function ins($data) {//插入一条数据
        if (!is_array($data)) {
            return cw(__FILE__.' line '.__LINE__,'插入数据时'.$data.'数据格式不对','一般');
        }
        $xz = insert($this->table,$data);
        if ($xz == 0) {
            print_r($data);
            return cw(__FILE__.' line '.__LINE__,'在'.$this->table.'中新增数据失败','一般');
        }
        return 1;
    }
    public function upd($data,$where) {//更新数据
        $gx = update($this->table,$data,$where);
        if ($gx == 0) {
            print_r($data);
            return cw(__FILE__.' line '.__LINE__,'在'.$table.'修改数据失败！条件：'.$where,'一般');
        } else {
            return $gx;
        }
    }
    public function del($where = '') {//删除数据
        $sc =  delete($this->table,$where);
        if ($sc == 0) {
            return cw(__FILE__.' line '.__LINE__,'在'.$table.'删除数据失败：'.$where,'一般');
        } else {
            return $sc;
        }
    }
}
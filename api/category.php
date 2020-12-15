<?php
use Dcblogdev\PdoWrapper\Database as Database;
class category{
//for connect  to database
public $db;
public function __construct(){
    $options=[
        'username'=>'root',
        'database'=>'proflioproj',
        //optional
        'password'=>'',
        'type'=>'mysql',
        'charset'=>'utf8',
        'host'=>'localhost',
        'port'=>'3306'
    ];
    $this->db=new Database($options);

}
    public function all(){
        // echo 'ourall';
        $data=$this->db->run("select * from category")->fetchAll();
        // echo '<pre>';
        // print_r($data);
        return $data;

    }

    public function add($data){
    //    echo 'ouradaaaad';
    $data=$this->db->insert("category",$data);
        return $data;
    }

    public function update($data,$id){
        $data=$this->db->update("category",$data,$id);
        return $data;  
      }


    public function delete($id){
     //   echo 'ourdelete';
        $data=$this->db->delete("category",['$id']);
        return $data;

    }

}
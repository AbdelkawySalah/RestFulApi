<?php 

require_once("database/database.php");
require_once("api/category.php");
$url=explode("/",$_SERVER['QUERY_STRING']);
header('Access-Control-Allow-Origin:application/json');
header('Content-Type:application/json');

// echo '<pre>';
// print_r($_SERVER['QUERY_STRING']);
// var_dump($url);

if($url[1]=='v1'){
    // echo 'v1';
    //category
    if($url[2]=='category'){
        $category=new  category();
        // echo 'category';
        //methods

        if($url[3]=='all'){
            $data=$category->all();
            $res=[
                'status'=>200,
                'data'=>$data
            ];
            // echo json_encode($data);
            echo json_encode($res);

            // echo 'all';
        }
        elseif($url[3]=='delete')
        {
            header('Access-Control-Allow-Methods:DELETE');
            //file_get_contents this ethod get data fro body of postan as json
              $data=file_get_contents("php://input");
              $data_de=json_decode($data,true);
            //   var_dump($data_de);die;
              $id=["id" => $data_de['id'] ];
            $res1=$category->delete($id);    
            // echo 'delete';
            if($res1){
                http_response_code(201);
                $res=[
                    'status'=>201,
                    'msg'=>"Category Deleted"
                ];
            }
                else{
                   
                    http_response_code(400);
                    $res=[
                        'status'=>400,
                        'msg'=>"error"
                    ];
                }
                 // echo json_encode'convert array to json';
            echo json_encode($res);
        
            }
            
        elseif($url[3]=='update'){
             header('Access-Control-Allow-Methods:PUT');
            //file_get_contents this ethod get data fro body of postan as json
              $data=file_get_contents("php://input");
              $data_de=json_decode($data,true);
            //   var_dump($data_de);die;
              $id=["id" => $data_de['id'] ];
              $data=$data_de['category'];
            //   print_r($data);die;
             $res1=$category->update($data,$id);
             if($res1){
                http_response_code(201);
                $res=[
                    'status'=>201,
                    'msg'=>"Category updated"
                ];
            }
                else{
                    http_response_code(400);
                    $res=[
                        'status'=>400,
                        'msg'=>"error"
                    ];
                }
                 // echo json_encode'convert array to json';
            echo json_encode($res);
        
            }

            // echo 'update';
        }elseif($url[3]=='add'){
            header('Access-Control-Allow-Methods:POST');
            //file_get_contents this ethod get data fro body of postan as json
                $data=file_get_contents("php://input");

                //json_decode for convert json to array
            $data_de=json_decode($data,true);
            $res1=$category->add($data_de);
            if($res1){
                http_response_code(201);
                $res=[
                    'status'=>201,
                    'msg'=>"Category Add"
                ];}

                else{
                    http_response_code(400);
                    $res=[
                        'status'=>400,
                        'msg'=>"error"
                    ];
                }
                 // echo json_encode'convert array to json';
            echo json_encode($res);
        
            }
           

    }


    //user

    if($url[2]=='user'){
        echo 'user';
    }

// elseif($url[1]=='v2'){
//     echo 'v2';
// }


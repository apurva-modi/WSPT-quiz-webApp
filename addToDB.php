<?php

function createStudent($conn, $uin){
    $findStudent = "select * from student where uin = '$uin';";
    $result = $conn->query($findStudent);
    
    if($result->num_rows == 0){
        $q = "insert into student(`UIN`,`final_credit`,`banner_credit`) values ('$uin',0,0);";
        $conn->query($q);
    }
}



    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    require 'connection.php';
    $_POST = json_decode(file_get_contents('php://input'), true);
    $uin = $_POST["uin"];
    createStudent($conn, $uin);
    $tabName = $_POST["currTabName"];
    $q = "select id from category where name = '$tabName'";
    $res = $conn->query($q);
    while($row = $res->fetch_assoc()){
        $cat_id = $row["id"];
    }
    $formDataOption = $_POST["formDataOption"];
    $textData = $_POST["textData"];
    foreach($formDataOption as $key => $value){
        $q_id = explode("Question", $value["name"])[1];
        $a_id = explode("Question", $value["option"])[1];
        $q = "select * from response where uin = '$uin' and question_id = $q_id";
        $res = $conn->query($q);
        if($res->num_rows > 0){
            $q = "update response set selected_option_id = $a_id where uin = '$uin' and question_id = $q_id"; 
        } else {
            $q = "insert into response(`uin`, `question_id`, `selected_option_id`, `text_response`) values( '$uin', $q_id, $a_id, ''  );";
        }
        // if ($conn->query($q) === TRUE){} else {
        //     echo "$q failed";  
        // }
        $conn->query($q);
        print_r($conn->error);
    }

    foreach($textData as $key => $value){
        $q_id = explode("Question", $value["name"])[1];
        $answer = $value["value"];
        $q = "select * from response where uin = '$uin' and question_id = $q_id";
        $res = $conn->query($q);
        if($res->num_rows > 0){
            $q = "update response set text_response = '$answer' where uin = '$uin' and question_id = $q_id"; 
        } else {
            $q = "insert into response(`uin`, `question_id`, `selected_option_id`, `text_response`) values( '$uin', $q_id, null, '$answer'  );";
        }
        // if ($conn->query($q) === TRUE){} else {
        //     echo "$q failed";  
        // }
        $conn->query($q);
        print_r($conn->error);
    }
    $sql = "select seen from student_view_status where uin = $uin and category_id = $cat_id";
    $res = $conn->query($sql);
    if($res->num_rows > 0){
        $sql = "update student_view_status set `seen` = 1, `timestamp` = NOW() where `uin` = ". $uin . " and `category_id` = ". $cat_id;
    } else {
        $sql = "insert into student_view_status(`uin`, `category_id`, `seen`, `timestamp`) values ($uin, $cat_id, 1, NOW())";
    }
    if ($conn->query($sql) === TRUE) {
        echo "true";
    } else {
        echo "$sql false";
    }
?>
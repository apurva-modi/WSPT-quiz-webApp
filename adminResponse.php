<?php
require 'connection.php';
?>

<?php
function getAdminResponse($conn, $uin){
    $categoryQuery = "SELECT `id`,`name` from `category`";
    $catResp = $conn->query($categoryQuery);
    while($catRow = $catResp->fetch_assoc()){
        $cat_name = $catRow["name"];
        
        
        $str= "<div class=\"section\" >
        <div class=\"head justify-content-center\">
            <h2 >".$cat_name."</h2>
        </div>";
        echo $str;
        $cat_id = $catRow["id"];
        $question_number = 1;
        $q = "SELECT r.selected_option_id, r.question_id, r.text_response, q.question_type, q.questions from response r, questions q, category c where r.question_id = q.id and q.category_id = c.id and c.id = " . $cat_id . " and r.uin = " . $uin;
        $resp = $conn->query($q);
        while($row = $resp->fetch_assoc()){
            
            // $str = "<div class=\"row\">
            // <div class=\"col\">
            //     <div oninput=\" this.className = ''\" >
            //         <p  class=\"required\">".$question_number.". ".$row["questions"].
            //         "</p>
            //     </div>";

            $str = "<div class=\"row\">
            <div class=\"col\">
                <div oninput=\" this.className = ''\" >
                    <p  class=\"required\"> ".$question_number.". " .$row["questions"]. "</p>
                </div>";
            //echo $row["questions"];
            echo $str;
            switch($row["question_type"]){
                
                case "Select": 
                    $sq = "SELECT o.id, o.options_content, o.option_credit FROM options o where o.question_id = ". $row["question_id"];
                    $subResp = $conn->query($sq);
                    $credit = -1;
                    while($option = $subResp->fetch_assoc()){
                        
                        $str = "<div class=\"custom-control custom-radio\">";
                        if($option["id"] == $row["selected_option_id"]){
                            echo $str."<input type='radio' class=\"custom-control-input\" checked>";
                            $credit = $option["option_credit"];
                        } else {
                            echo  $str."<input type='radio' class=\"custom-control-input\" disabled>";
                        }

                        echo "<label class=\"custom-control-label\" >"
                                .$option["options_content"]. "</label></div>";
          
                    }
                    if($credit < 0){
                        echo "<div class =\"credit\">Credit : Ungraded</div>";
                    } else {
                        echo "<div class =\"credit\">Credit : ". $credit . "</div>";
                    }
                    echo "</div></div>";
                    $question_number = $question_number +1;
                
                break;
                case "Short Answer":
                    echo "<input disabled readonly value= ".$row["text_response"].">";
                    //echo $row["text_response"];
                    //echo "";
                    echo "<div class=\"credit\"> Credit : Ungraded</div>";
                    echo "</div></div>";
                    $question_number = $question_number +1;


                break;
                case "Long Answer":
                    echo "<textarea class=\"form-control min100ta\"  rows=\"10\" disabled readonly>";
                    echo $row["text_response"];
                    echo "</textarea>";
                    echo "<div class =\"credit\">Credit : Ungraded </div>";
                    echo "</div></div>";
                    $question_number = $question_number +1;


                    
                break;
                case "selectOption":
                
                    $str = "<div class=\"custom-control custom-radio\">
                                <select readonly disabled>";
                    echo $str;
                    $sq = "SELECT o.id, o.options_content, o.option_credit FROM options o where o.id = ". $row["selected_option_id"];
                    $subResp = $conn->query($sq);
                    $credit = -1;
                    
                    while($option = $subResp->fetch_assoc()){
                        $str = "<option default>" . $option["options_content"] . "</option>";
                        echo $str;
                        $credit = $option["option_credit"];
                    }
                    
                    echo "</select></div>";
                    
                    
                    if($credit < 0){
                        echo "<div class =\"credit\"> Credit : Ungraded </div>";
                    } else {
                        echo "<div class =\"credit\"> Credit : ". $credit . " </div>";
                    }

                    echo "</div></div>";
                    $question_number = $question_number +1;

                     
                break;
            }
        }
        echo "</div>";
    }
}

function getResp($uin){
    global $conn;
    getAdminResponse($conn, $uin);
}

if(isset($_GET["type"]) && $_GET["type"]="adminView"){
    if(isset($_GET["uin"])){
        getAdminResponse($conn, $_GET["uin"]);
    }
}


?>
<!-- Academic History and Reflection Begins here   -->
<?php 
    $q = "select seen from student_view_status where uin = ". $_SESSION["uin"]. " and category_id = 111" ;
    $seen = $conn->query($q);
    if ($seen->num_rows > 0) {
        while($row = $seen->fetch_assoc()) {
            if($row["seen"] == "1"){
                echo "<script>$('#nextBtn').click()</script>";
                return;
            }
        }
    }
    
?>

 <div class="tab" >
    <div class="head justify-content-center">
        <h2 >Academic History and Reflection</h2>
    </div>

    <?php 
    $question_id = 0;
    $sql = "SELECT * FROM `questions` WHERE `category_id`= 111 " ;
    $questions = $conn->query($sql);

    if ($questions->num_rows > 0) {
        $question_number = 1;
        // output data of each row
        while($question_rows = $questions->fetch_assoc()) 
            {
                if($question_rows["question_type"]=="selectOption")
                {
                    $question_id = $question_rows["id"];
                    $str = "<div class=\"row\">
                                <div class=\"col\">
                                    <div oninput=\" this.className = ''\" >
                                        <p  class=\"required\">".$question_number.". ".$question_rows["questions"].
                                        "</p>
                                    </div>
                                <div class=\"custom-control custom-radio\">
                                    <select name = 'AHR_Question".$question_rows["id"]."' id=\"AHR_Question".$question_rows["id"]."\" 
                                            required=\"required\">";
                    echo $str;
                    $sql = "SELECT * FROM `options` where `question_id` = ".$question_id;
                    $options = $conn->query($sql);
                    echo "<option value='none' selected disabled hidden>Select an Option</option> ";
                    if ($options->num_rows > 0) {
                    // output data of each row
                    while($option_row = $options->fetch_assoc()) 
                        {
                            $str = "<option value='AHR_Question".$option_row["id"]."'>".$option_row["options_content"]."</option>";
                            echo $str;
                        
                        }
                    echo "</select></div>";
                    }
                    
                    echo "</div></div>";
                    $question_number =  $question_number + 1;
                }

                 else if($question_rows["question_type"]=="Select"){
                    $question_id = $question_rows["id"];
                    $str = "<div class=\"row\"><div class=\"col\"><div oninput=\" this.className = ''\" ><p  class=\"required\">".$question_number.". ".$question_rows["questions"]."</p></div>";
                    echo $str;
                    $sql = "SELECT * FROM `options` where `question_id` = ".$question_id;
                    $options = $conn->query($sql);
        
                    if ($options->num_rows > 0) {
                        // output data of each row
                        while($option_row = $options->fetch_assoc()) {
                            $str = "<div class=\"custom-control custom-radio\">
                            <input type=\"radio\"  class=\"custom-control-input\" id=\"AHR_Question".$option_row["id"].
                            "\" name=\"AHR_Question".$option_row["question_id"]."\" required=\"required\"><label class=\"custom-control-label\" for=\"AHR_Question".$option_row["id"]."\">".$option_row["options_content"]."</label></div>";
                            echo $str;
                        
                            }
                    }
                    echo "</div></div>";
                    $question_number =  $question_number + 1;

                 }

                 else if($question_rows["question_type"]=="Short Answer"){
                    $question_id = $question_rows["id"];
                    $str = "<div class=\"row\">
                                <div class=\"col\">
                                    <div oninput=\" this.className = ''\" >
                                        <p  class=\"required\">".$question_number.". ".$question_rows["questions"].
                                        "</p>
                                    </div>
                                    <div class=\" \">
                                        <p><input placeholder=\"Short Answer\" 
                                                  oninput=\"this.className = ''\" 
                                                  name=\"AHR_Question".$question_rows["id"]."\">
                                        </p>
                                    </div>
                                    ";
                    echo $str;

                    echo "</div></div>";
                    $question_number =  $question_number + 1;

                 }

            }    
    }
?>

</div>



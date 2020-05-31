<?php 
    $q = "select seen from student_view_status where uin = ". $_SESSION["uin"]. " and category_id = 4" ;
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



<!-- Reading Assessment Begins here  -->
<div class="tab" >
    <div class="head justify-content-center">
        <h2>Reading Assessment</h2>
    </div>


        <?php 
        $var_passage_id = $_SESSION["uin"]%2+1 ; 
        $passage_sql = "SELECT * FROM `passage` WHERE `id` =".$var_passage_id;
        $passages = $conn->query($passage_sql);
        if ($passages->num_rows > 0) {
            while($passage_rows = $passages->fetch_assoc()) 
            { 
                $passage_Content ="<div class=\"row\">
                <div class=\"col\">
                    <div class=\"justify-content-center\" >
                        <p class=\"required\">1. Reading Diagnostic Passage </p>
                    </div>
                    <div class=\"justify-content-center\">".$passage_rows["passages"].
                    "</div></div></div>";
                echo $passage_Content;
            }
        }
        
        $sql = "SELECT * FROM `questions` WHERE `category_id` = 4 AND `passage_id`=$var_passage_id ORDER BY rand(".$_SESSION["uin"].") limit 5";
        //$sql = "SELECT * FROM `questions` WHERE `category_id` = 4 AND `passage_id`=$var_passage_id";

        $questions = $conn->query($sql);
        if ($questions->num_rows > 0) {
            $question_number = 1;
            // output data of each row
            while($question_rows = $questions->fetch_assoc()) 
            {
                $question_id = $question_rows["id"];
                $str = "<div class=\"row\">
                            <div class=\"col\">
                                <div oninput=\" this.className = ''\" >
                                    <p  class=\"required\">".$question_number.". ".$question_rows["questions"]
                                    ."</p>
                                </div>";
                    echo $str;
                    $sql = "SELECT * FROM `options` where `question_id` = ".$question_id;
                    $options = $conn->query($sql);
        
                    if ($options->num_rows > 0) {
                        // output data of each row
                        while($option_row = $options->fetch_assoc()) {
                            $str = "<div class=\"custom-control custom-radio\">
                            <input type=\"radio\"  class=\"custom-control-input\" id=\"RA_Question".$option_row["id"].
                            "\" name=\"RA_Question".$option_row["question_id"]."\" required=\"required\"><label class=\"custom-control-label\" for=\"RA_Question".$option_row["id"]."\">".$option_row["options_content"]."</label></div>";
                            echo $str;
                        
                            }
                    }
                    echo "</div></div>";
                    $question_number =  $question_number + 1;
            }
        }
        ?>
</div>
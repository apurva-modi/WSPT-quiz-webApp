
<?php 
$q = "select seen from student_view_status where uin = ". $_SESSION["uin"]. " and category_id = 333" ;
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

 
 <!-- Writing Assessment Begins here  -->
        <div class="tab" >
                <div class="head justify-content-center">
                    <h2>Writing Assessment</h2>
                </div>

  <?php 
    $question_id = 0;
    $sql = "SELECT * FROM `questions` WHERE `category_id`= 333" ;
    $questions = $conn->query($sql);

    if ($questions->num_rows > 0) {
        $question_number = 1;
        // output data of each row
        while($question_rows = $questions->fetch_assoc()) {
            $question_id = $question_rows["id"];
            $str = "<div class=\"row\">
                        <div class=\"col\">
                         <div oninput=\" this.className = ''\" >"
                             .$question_rows["questions"].
                           
                         "</div>
    
                        <!-- Text Area - BOX 1 -->
                        <div class=\" \">
                                <textarea class=\"form-control min100ta\" oninput=\"this.className = ''\"
                                          id=\"WA_Question".$question_rows["id"]."\" 
                                          name=\"WA_Question".$question_rows["id"]."\"
                                          placeholder=\"Type your Response here\" 
                                          rows=\"10\"
                                          required></textarea>
                                Total word count:<span class=\"pull-right label label-default\" id=\"countWA_Question".$question_rows["id"]."\"></span>
                        </div>
                     </div>
                </div>";
            echo $str;
        }
        $question_number =$question_number +1;
    }
    ?>
</div>
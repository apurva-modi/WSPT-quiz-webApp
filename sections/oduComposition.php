<?php 
    $q = "select seen from student_view_status where uin = ". $_SESSION["uin"]. " and category_id = 888" ;
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
        <!-- About Odu Compositon begins -->
        <div class="tab" >
            <div class="head justify-content-center">
                <h2>About Composition at ODU</h2>  
            </div>
            <div class="row">
              <div class="col">
                <p style='color: black;'>
                    Please read the following descriptions of the two first-year writing options carefully. At the end of
                    this section, based on your experience with this placement tool and your understanding of
                    ODU’s writing courses, you will be asked to weigh in on which course/s you think you should be
                    placed in.
                </p>
              </div>
              <table class="table">
                <thead>
                  <tr>
                    <th class="" style="text-align: center;" >OPTION 1</th>
                    <th class=""style="text-align: center;" >OPTION 2</th>
                    
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>ENGL 110: English Composition & 
                        ENGL 101: Composition Studio 
                        <p style="text-align: center">6 credits</p>
                        </td>
                    <td>ENGL 110: English Composition
                        <p style="text-align: center">3 credits</p>
                        </td>
                    
                  </tr>
                  <tr>
                    <td>Option 1 includes two courses and is designed for students who seek a more individualized and gradual introduction to first-year writing.</td>
                    <td>Option 2 includes just one course and is designed for students who are prepared to write at the college level and feel confident that they can be successful in a writing course that is accelerated.</td>
                   
                  </tr>
                  <tr>
                    <td>English 101: Composition Studio is a corequisite course that some students will take with English 110: English Composition to provide support as they work to become better, more practiced and confident writers. English 101 provides additional instruction, guided practice, and individualized support to help students be successful in English 110 and navigate university literacy expectations, in general. This class is ideal for students who are unsure about their preparation to write at the college level or who have traditionally  struggled in writing classes. English 101 is a three-credit class and counts as an elective. English 110 is also a three-credit class and counts toward a student's general education requirement. This means that students who take ENGL 101 and ENGL 110 will take six English credits in one semester.</td>
                    <td>ENGL 110 is the best option for students who have experience writing and formatting papers that range between three and six pages, independently drafting papers in response to writing assignment prompts, providing feedback to peers on their writing, and revising their writing based on peer and instructor feedback. ENGL 110 students can expect to write at least four essays over the course of the semester. Students who enroll in only ENGL 110 (i.e., not ENGL 101) may anticipate needing some tutorial support from the Writing Center (all writers can benefit from getting feedback on their work!), but should not necessitate frequent individual meetings with the instructor in order to be successful in the course. Students who take ENGL 110 by itself will take three English credits in one semester.</td>
                    
                  </tr>
                </tbody>
              </table>
            <!-- </div> -->
                <div class="col">
                     <p>
                        For more detailed information about the first-year writing requirement and placement, visit the
                        English Department webpage:
                        <u> <i>https://www.odu.edu/englishdept/general-education/writing-placement.</i></u>
                      </p>
                </div>  
            </div>
            
              <?php 
              $question_id = 0;
              $sql = "SELECT * FROM `questions` where `category_id` = 888";
              $questions = $conn->query($sql);
  
              if ($questions->num_rows > 0) {
                  $question_number = 1;
                  // output data of each row
                  while($question_rows = $questions->fetch_assoc()) {
                      if($question_rows["question_type"]=="Select")
                      {
                          $question_id = $question_rows["id"];
                          $str = "<div class=\"row\"><div class=\"col\"><div oninput=\" this.className = ''\" ><p  class=\"required\">".$question_number.". ".$question_rows["questions"]."</p></div>";
                          echo $str;
                          $sql = "SELECT * FROM `options` where `question_id` = ".$question_id;
                          $options = $conn->query($sql);
              
                          if ($options->num_rows > 0) {
                              // output data of each row
                              while($option_row = $options->fetch_assoc()) {
                                  $str = "<div class=\"custom-control custom-radio\">
                                  <input type=\"radio\"  class=\"custom-control-input\" id=\"odu_Question".$option_row["id"].
                                  "\" name=\"odu_Question".$option_row["question_id"]."\" required=\"required\"><label class=\"custom-control-label\" for=\"odu_Question".$option_row["id"]."\">".$option_row["options_content"]."</label></div>";
                                  echo $str;
                              
                                  }
                          }
                          echo "</div></div>";
                          $question_number =  $question_number + 1;
      
                       }
                      
                      else if($question_rows["question_type"]=="Long Answer")
                      {
                          $question_id = $question_rows["id"];
                          $str = "<div class=\"row\">
                                      <div class=\"col\">
                                          <div oninput=\" this.className = ''\" >
                                              <p  class=\"required\">".$question_number.". ".$question_rows["questions"].
                                              "</p>
                                          </div>
                                          <div class=\" \">
                                            <textarea class=\"form-control\" oninput=\"this.className = ''\"
                                                      id=\"oduComp_Question$question_id\" 
                                                      name=\"oduComp_Question$question_id\"                
                                                      placeholder=\"Type your Response here\" 
                                                      rows=\"10\"
                                                      required></textarea>
                                            Total word count:<span class=\"pull-right label label-default\" id=\"countOdu_Question$question_id\"></span>
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
        <!-- About Odu Compositon Ends -->
        
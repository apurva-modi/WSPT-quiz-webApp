<?php
require 'connection.php';
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>    
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <!-- font awesome icon -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <!-- Project css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Title  -->
    <title>WSPT</title>
  
</head>
  <body>  
    <?php 

        require 'navBar.php';
        session_start();
        // ----  Modal Begins 
        require 'modal.php';
        // ----  Modal Ends 
        $_SESSION["uin"] = 122;
        echo "<script> var uin = ". $_SESSION["uin"]. "; </script>";
    
    ?>


    <div class="container" id= "container" > 
        <form  id="testForm" action="./test.php" method="post">


        <?php
        
                require 'sections/acedmicHistory.php';  
                require 'sections/writingAssessment.php'; 
                require 'sections/writingReflection.php'; 
                require 'sections/readingAssessment.php'; 
                require 'sections/readingReflection.php'; 
                require 'sections/grammarAssessment.php'; 
                require 'sections/grammarReflection.php'; 
                require 'sections/oduComposition.php'; 
        ?>
  
        <div style="overflow:auto;">
            <div style="float:right;">
                <!-- hidden previous section button -->
              <!--button type="button" id="prevBtn" onclick="nextPrev(-1);">Previous</button-->
              
              <!-- complete this section button  -->
              <button type="button" id="nextBtn" onclick="nextPrev(1)">Complete this Section</button>
              
              <!-- info icon inside the button -->
              <button type="button" class="btn-popup" data-toggle="popover" title="Confirm your submission" data-placement="left" 
                      data-content="If you click on complete this section then you will not be able to make changes to the current section again.">
                      <i class="fas fa-question-circle"></i></button> 
                
            </div>
        </div>

         <!-- Circles which indicates the steps of the form:  -->
        <div style="text-align:center;margin-top:40px;margin-bottom:40px; padding-bottom:150px;">
            <span class="step"></span>
            <span class="step"></span>
            <span class="step"></span>
            <span class="step"></span>
            <span class="step"></span>
            <span class="step"></span>
            <span class="step"></span>
            <span class="step"></span>
        </div>

        
        </form>

    </div>

    

    <!-- Footer begins -->
    <footer class="footer">
        <div class="container">
          <!-- <span class="text">Place sticky footer content here.</span> -->
        </div>
    </footer>
    <!-- footer ends -->




    
    
    <!-- External javascript -->
    <script src="js/index.js"></script>
    
    
    <!-- Modal display script -->
    <script type="text/javascript">
        $(function () {
            $('.btn-popup').popover({
                container: 'body'
                //trigger: 'focus';
            })
        })
        $(document).ready(function(){
            $("#myModal").modal('show');
        }); 
        $('#myModal').modal({backdrop: 'static', keyboard: false})
    </script>
    <!-- Modal Script ends here -->
    
    <!-- Script for total word count  -->
    <script>
        $(document).ready(function() {
            $("#WA_Question3006").on('keyup', function() {
                var words = (this.value.match(/\S+/g) || "").length;
                if (words > 200) {
                    // Split the string on first 200 words and rejoin on spaces
                    var trimmed = $(this).val().split(/\s+/, 200).join(" ");
                    // Add a space at the end to keep new typing making new words
                    $(this).val(trimmed + " ");
                }
                else {
                    $('#countWA_Question3006').text(words);
                    //$('#word_left').text(200-words);
                }
            });
        }); 
        $(document).ready(function() {
        $("#WA_Question3007").on('keyup', function() {
                var words = (this.value.match(/\S+/g) || "").length;
                if (words > 500) {
                    // Split the string on first 200 words and rejoin on spaces
                    var trimmed = $(this).val().split(/\s+/, 200).join(" ");
                    // Add a space at the end to keep new typing making new words
                    $(this).val(trimmed + " ");
                }
                else {
                    $('#countWA_Question3007').text(words);
                    //$('#word_left').text(500-words);
                }
            });
        });

        $(document).ready(function() {
        $("#oduComp_Question3005").on('keyup', function() {
                var words = (this.value.match(/\S+/g) || "").length;
                if (words > 500) {
                    // Split the string on first 200 words and rejoin on spaces
                    var trimmed = $(this).val().split(/\s+/, 200).join(" ");
                    // Add a space at the end to keep new typing making new words
                    $(this).val(trimmed + " ");
                }
                else {
                    $('#countOdu_Question3005').text(words);
                    //$('#word_left').text(500-words);
                }
            });
        });

// below function will make a ajax call every 30 seconds and save everything checked in the DB.

// setInterval(function(){ save(null) }, 30000);
    
    
    </script>
</body>
</html>
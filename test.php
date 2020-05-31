
<?php
  // Using the given matirx I calculated the student score
  session_start();
  function add_score($score, $cid, $cscore){
    if($cid == 111){
      return $score + $cscore;
    } elseif($cid ==  222) {
      $val = 0;
      if($cscore > 0.75*1000) $val = 10;
      elseif($cscore >= 0.50*1000) $val = 5;
      return $score + $val;
    } elseif($cid == 4){
      $val = 0;
      if($cscore == 500) $val = 7.5;
      elseif($cscore >= 0.80*500) $val = 5;
      return $score + $val;
    } elseif($cid == 555){
      $val = 0;
      if($cscore > 0.75*700) $val = 7.5;
      elseif($cscore >= 0.50*700) $val = 5;
      return $score + $val;
    } elseif($cid == 6){
      $val = 0;
      if($cscore == 1000) $val = 7.5;
      elseif($cscore >= 0.80*1000) $val = 5;
      return $score + $val;
    } elseif($cid == 777){
      $val = 0;
      if($cscore > 0.75*300) $val = 7.5;
      elseif($cscore >= 0.50*300) $val = 5;
      return $score + $val;
    } elseif($cid == 888){
      return $score + $cscore;
    } else {
      return $score;
    }
  }

  $uin = $_SESSION["uin"];
  require 'connection.php';
  $data = array();
  $q = "select a.question_id as qid, a.selected_option_id as aid, b.category_id as cid,  c.option_credit as oc from response a, questions b, options c where a.uin = '$uin' and a.question_id = b.id and c.id = a.selected_option_id;";
  $res = $conn->query($q);
  if($res->num_rows > 0){
    while($row = $res->fetch_assoc()){
      if($row["oc"] != NULL){
        if(array_key_exists($row["cid"], $data)){
          $data[$row["cid"]] += $row["oc"];
        } else {
          $data[$row["cid"]] = $row["oc"];
        }
      }
    }
  }
  
  $score = 0;
  $banner =0; 
  foreach($data as $key => $val){
    $score = add_score($score, $key, $val);
  }

  if($score>=62) $banner =3;
  else $banner=1;

  $findStudent = "select * from student where uin = '$uin';";
  $result = $conn->query($findStudent);
  
  if($result->num_rows > 0){
    $q = "update student set final_credit = $score , banner_credit = $banner where UIN = '$uin';";
  }
  else{
    $q = "insert into student(`UIN`,`final_credit`,`banner_credit`) values ('$uin',$score,$banner);";
  }

  $conn->query($q);
  // Score variable contains the student score out of 100.



  echo "<script> var score = $score
                var banner = $banner </script>"



?>



<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <!-- Project css -->
    <link rel="stylesheet" href="css/style.css">
    <style>
         .footer{
    background-color: #003057; 
    color: white;
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 100px;
    text-align: center;
 }

  .swal-button {
    border-radius: 0px !important;
    background-color: #003057;
  }
  .swal-button:not([disabled]):hover{
            background-color: #003057;
            opacity: 0.8;
        }

    </style>
    <!-- Title  -->
    <title>WSPT</title>
  
</head>
  <body> 
    <script>
      var text = "You will receive an email in the next \
                  48 hours with your placement and instructions for registration. You can also log back in to the\
                  WSPT to view your score. If you do not have access to your score through the WSPT or in an\
                  email after 72 hours, please email writingplacement@odu.edu."

      swal("Thank you for using the Writing Success Placement Tool.", text, "success");
      //swal("Thank you for using the Writing Success Placement Tool.", text, "success");
    </script>
    <!-- Navbar begins  -->
    <nav class="navbar">
        <div class="container">
            <a class="navbar-brand" href="#" ><img class="navbarLogo" src="img/odulogo1.png" alt="logo"></a>
            <a class="wspt">
                <span>Writing Success Placement Test</span>
            </a>
        </div>
    </nav>
    <!-- Navbar ends -->

    <!-- Modal Begins  -->
    <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#003057; color: white;">
        <h5 class="modal-title" id="exampleModalLongTitle">Thank you for using the Writing Success Placement Tool. </h5>
        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="background-color:#003057; color: white;"> 
          <span aria-hidden="true">&times;</span> -->
        </button>
      </div>
      <div class="modal-body">
        <p>
        You will receive an email in the next 48 hours with your score and placement decision. 
        You can also log back in to the WSPT to view your score. If you do not have access to your score 
        through the WSPT or in an email after 72 hours, please e-mail writingplacement@odu.edu. 
        </p>
      </div>
    </div>
  </div>
</div>
    <!-- Modal Ends -->
    

    <!-- Footer begins -->
    <footer class="footer">
        <div class="container">
          <!-- <span class="text">Place sticky footer content here.</span> -->
        </div>
    </footer>
    <!-- footer ends -->



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    
    <!-- External javascript -->
    <!-- <script src="js/index.js"></script> -->
    
    
    <!-- Modal display script -->
    <script type="text/javascript">
        $(document).ready(function(){
            $("#myModal").modal('show');
        }); 
        $('#myModal').modal({backdrop: 'static', keyboard: false})
    </script>
    <!-- Modal Script ends here -->
    
</body>
</html>
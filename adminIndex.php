<html>
<head>
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
    <style>
    .thead{
        background-color: #D6D5DA;
        color: #003057;
        font-family: sans-serif;

    }
    .section{
        display: block;
        margin: 20px 0;   
    }
    .btn{
        color:#003057;
    }
    .table > tbody > tr > td {
        text-align: center;
     vertical-align: middle;
}

    </style>

<script>
        $(document).ready(function(){
            $(".btn").click(function(){
                var val = $(this).val();
                var btn = document.createElement("a");
                btn.setAttribute("target", "_blank");
                btn.setAttribute("href", "adminUinView.php?uin=" + val);
                btn.click(); 
                // window.location = "adminUinView.php?uin=" + val;
                // $.post({
                //     url: "adminResponse.php?type=adminView&uin=" + val,
                //     success : function(response){
                //         $("#respDiv").html(response);
                        
                //     } 
                // })
            });
        });
    </script>
</head>
<body>

    <?php 

    require 'navBar.php';
    ?>
    <div class="container">
        <div class="section" >
            <div class="head justify-content-center">
            <h2 >Admin Portal</h2>
            </div>
        </div>

    <table class="table table-striped table-bordered" style="margin: 20px 0px;" >
        <thead class='thead'>
            <tr>
                <th class="text-center">UIN</th>
                <th class="text-center"> START TIME</th>
                <th class="text-center"> FINAL CREDIT</th>
                <th class="text-center"> BANNER CREDIT</th>
                <th class="text-center">STATUS</th>
            </tr>
        </thead>
        </tbody>
    <?php
        require 'connection.php';
        $studentQuery = "select * from student";
        $seenQuery = "SELECT uin, min(timestamp) as start_time , COUNT(seen) as seen_count from student_view_status GROUP by uin";
        $studentArr = array();
        $seenData = array();
        $res = $conn->query($studentQuery);
        while($row = $res->fetch_assoc()){
            $studentArr[$row["UIN"]] = $row;
        }
        $res = $conn->query($seenQuery);
        while($row = $res->fetch_assoc()){
            $seenData[$row["uin"]] = $row;
        }
        foreach($studentArr as $key => $val){
            echo "<tr><td > ".$key."</td> ";
            if(array_key_exists($key, $seenData)){
                echo "<td  >". $seenData[$key]["start_time"]. "</td>";
                if($seenData[$key]["seen_count"] == "8"){
                    
                    echo "<td  >".$studentArr[$key]["final_credit"] . "</td> ";
                    echo "<td  >".$studentArr[$key]["banner_credit"] . "</td>";
                    echo "<td   >
                            <button type=\"button\" class=\"btn classBtn\" value=\"".$key."\" 
                                    data-toggle=\"modal\" data-target=\"#exampleModal\">
                                    <u>Completed</u> <i class=\"fas fa-external-link-alt\"></i>
                            </button> 
                          </td> </tr>";
                    
                }
                else {
                    echo "<td  > - </td> <td class=\"text-center\" > - </td> <td class=\"text-center\" >  <button  type=\"button\" class=\"btn \" value=\"".$key."\"> <u>Ongoing </u><i class=\"fas fa-external-link-alt\"></i> </button> </td> </tr>";
                }
            } else {
                echo " <td>   - </td> <td> - </td>  <td>-</td> <td> 'Did not start' </td> </tr>"; 
            }

        }
    ?>
    </tbody>
</table>
</div>

    <!-- Footer begins -->
    <footer class="footer">
        <div class="container">
            <!-- <span class="text">Place sticky footer content here.</span> -->
        </div>
    </footer>
<!-- footer ends -->


</body>
</html>
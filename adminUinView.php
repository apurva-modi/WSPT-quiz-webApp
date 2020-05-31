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

    .section{
        display: block;
        margin: 20px 0;   
    }
    .credit{
        margin: 10px 0px 0px;
        display:block;
        font-style: italic;
        color: #003057;
    }
    .table{
        margin:
    }
    .thead{
        color: #003057;
        font-family: sans-serif;;
    }

    </style>
</head>
<body>

    <?php 

    require 'navBar.php';
    ?>
    <div class="container">
</div>


    <div class= "container" id="respDiv" style="margin-top:40px;margin-bottom:40px; padding-bottom:150px;">
    <!-- You will get the response of student here -->
        <?php 
            require_once 'adminResponse.php';
            getResp($_GET["uin"]);
        ?>
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
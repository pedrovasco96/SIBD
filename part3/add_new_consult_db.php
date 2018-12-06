<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Detailed consult info</title>
</head>
<body>
<?php

    session_start();
    $VAT_owner = $_SESSION['VAT_owner'];
    $VAT_client = $_SESSION['VAT_client'];
    $animal_name = $_SESSION['animal_name'];
    $s = $_REQUEST['s'];
    $o = $_REQUEST['o'];
    $a = $_REQUEST['a'];
    $p = $_REQUEST['p'];
    $weight = $_REQUEST['weight'];
    $VAT_vet = $_REQUEST['VAT_vet'];
    $date_timestamp=date("Y-m-d H:i:sa");

    if(!$s){
        $s = 'NA';
    }
    if(!$o){
        $o = 'NA';
    }
    if(!$a){
        $a = 'NA';
    }
    if(!$p){
        $p = 'NA';
    }

    include 'credentials.php';

    try{
      $connection = new PDO($dsn, $user, $pass);
    }
    catch(PDOException $exception){
      echo("<p>Error: ");
      echo($exception->getMessage());
      echo("</p>");
      exit();
    }

    $sql = "insert into consult values ('$animal_name', '$VAT_owner', '$date_timestamp', :s, :o, :a, :p,
            '$VAT_client', :VAT_vet, :weight);";
    $exec = $connection->prepare($sql);
    $exec->bindParam(':s', $s);
    $exec->bindParam(':o', $o);
    $exec->bindParam(':a', $a);
    $exec->bindParam(':p', $p);
    $exec->bindParam(':VAT_vet', $VAT_vet);
    $exec->bindParam(':weight', $weight, PDO::PARAM_INT);
    $exec->execute();

    echo("New Consult Inserted in Databse \n");

    echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

    $connection = null;
?>
</body>
</html>

<html><meta charset="UTF-8">
<head>
    <title>Casa Açores Vet Clinic</title>
</head>
<body>
<?php

    session_start();
    $VAT_client = $_SESSION['VAT_client'];
    $animal_name = $_SESSION['animal_name'];
    $s = $_REQUEST['s'];
    $o = $_REQUEST['o'];
    $a = $_REQUEST['a'];
    $p = $_REQUEST['p'];
    $weight = $_REQUEST['weight'];
    $VAT_vet = $_REQUEST['VAT_vet'];
    $date_timestamp=date("Y-m-d h:i:sa");

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

    $host="localhost";	// MySQL is hosted in this machine
    $user="root";	// <== replace istxxx by your IST identity
    $password="";	// <== paste here the password assigned by mysql_reset
    $dbname = "vet2";	// Do nothing here, your database has the same name as your username.

    try{
        $connection = new PDO("mysql:host=" . $host. ";dbname=" . $dbname, $user, $password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
    }
    catch(PDOException $exception) {
        echo("<p>Error: ");
        echo($exception->getMessage());
        echo("</p>");
        exit();
    }

    $sql = "SELECT A.VAT_owner FROM animal A
            WHERE A.name='$animal_name'";

    $result = $connection->query($sql);

    foreach($result as $row)
    {
        $VAT_owner=$row["VAT_owner"];
    }

    $sql = "insert into consult values ('$animal_name', '$VAT_owner', '$date_timestamp', '$s', '$o', '$a', '$p', 
            '$VAT_client', '$VAT_vet', '$weight');";

    $result = $connection->query($sql);

    echo("New Consult Inserted in Databse \n");

    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

    $connection = null;
?>
</body>
</html>
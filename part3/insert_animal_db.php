<html><meta charset="UTF-8">
<head>
    <title>Casa Açores Vet Clinic</title>
</head>
<body>
<?php

    session_start();
    $VAT_owner = $_SESSION['VAT_owner'];
    $animal_name = $_SESSION['animal_name'];
    $species_name = $_REQUEST['species_name'];
    $colour = $_REQUEST['colour'];
    $gender = $_REQUEST['gender'];
    $birth_year = $_REQUEST['birth_year'];

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

    $sql = "insert into animal values ('$animal_name',  '$VAT_owner', '$species_name', 
    '$colour', '$gender', '$birth_year', YEAR(CURDATE())-'$birth_year');";

    $result = $connection->query($sql);

    echo("New Animal Inserted in Database \n");
    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

    $connection = null;
?>
</body>
</html>

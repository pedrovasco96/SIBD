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

    $sql = "insert into animal values ('$animal_name',  '$VAT_owner', '$species_name',
    '$colour', '$gender', '$birth_year', YEAR(CURDATE())-'$birth_year');";

    $result = $connection->query($sql);

    echo("New Animal Inserted in Database \n");
    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

    $connection = null;
?>
</body>
</html>

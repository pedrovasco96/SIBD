<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Detailed consult info</title>
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

    $sql = "insert into animal values ('$animal_name',  '$VAT_owner', :species_name,
    :colour, :gender, :birth_year, YEAR(CURDATE())-'$birth_year');";
    $exec = $connection->prepare($sql);
    $exec->bindParam(':species_name', $species_name);
    $exec->bindParam(':colour', $colour);
    $exec->bindParam(':gender', $gender);
    $exec->bindParam(':birth_year', $birth_year);
    $exec->execute();

    echo("New Animal Inserted in Database \n");
    echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

    $connection = null;
?>
</body>
</html>

<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Insert Client</title>
</head>
<body>
<div class='content'>
  <h1>Casa Açores Vet Clinic - Insert Client</h1>
<?php

    session_start();
    $VAT = $_SESSION['VAT'];
    $name = $_REQUEST['name'];
    $city = $_REQUEST['city'];
    $address_street = $_REQUEST['address_street'];
    $address_zip= $_REQUEST['address_zip'];

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

    $vat_string = (string) $VAT;
    if(strlen($vat_string) == 4){
      $sql = "insert into person values ('$VAT',  :name, :city, :address_street, :address_zip);";
      $exec = $connection->prepare($sql);
      $exec->bindParam(':name', $name);
      $exec->bindParam(':city', $city);
      $exec->bindParam(':address_street', $address_street);
      $exec->bindParam(':address_zip', $address_zip);
      $exec->execute();

      $sql = "insert into client values ('$VAT');";
      $exec = $connection->prepare($sql);
      $exec->execute();

      echo("<p>New Client Inserted in Database</p>");
    }else
      echo("<p> Seems like you misstyped. Client VAT should have 4 numbers (e.g. 1001). </p>");

    echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

    $connection = null;
?>
</div>
</body>
</html>

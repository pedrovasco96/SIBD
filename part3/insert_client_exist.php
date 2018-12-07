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
      $VAT = $_SESSION['VAT_client'];
      session_destroy();

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

      $sql = "insert into client values ('$VAT');";
      $exec = $connection->prepare($sql);
      $exec->execute();

      echo("<p> Existing person added as client </p>");

      echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
  ?>
</div>
</body>
</html>

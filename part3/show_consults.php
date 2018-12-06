<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Consult info</title>
</head>
<body>
<div class='content'>
  <h1>Casa Açores Vet Clinic - Results for consult search</h1>
  <?php

      session_start();
      $VAT_owner = $_SESSION['VAT_owner'];
      $animal_name = $_SESSION['animal_name'];

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

      $sql = "SELECT C.date_timestamp, C.VAT_vet FROM consult C
              WHERE C.name='$animal_name'";

      $result = $connection->query($sql);
      $num = $result->rowCount();

      //echo("<p>$num consults found</p>\n");

      if($num>0) {
          echo("<table border=\"1\">\n");
          echo("<tr><td>Date and Time</td><td>VAT Vet</td></tr>\n");
          foreach ($result as $row) {
              echo("<tr><td>");
              $date = $row["date_timestamp"];
              echo "<a href= \"show_detailed_consults.php?date_timestamp=$date&animal_name=$animal_name&VAT_owner=$VAT_owner\"> $date</a>";
              #echo "<a href='show_detailed_consults.php'>$name</a>";
              echo("</td><td>");
              echo($row["VAT_vet"]);
              echo("</td></tr>\n");
          }
          echo("</table>\n");
      }

      echo("<p> </p>\n");
      echo("<button class='button' onclick=document.location.href=\"add_new_consult.php?flag=1\">Add New Consult</button>");
      echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

      $connection = null;
  ?>
</div>
</body>
</html>

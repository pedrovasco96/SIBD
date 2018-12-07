<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Detailed procedure info</title>
</head>
<body>
<div class='content'>
  <h1>Casa Açores Vet Clinic - Procedure details</h1>
  <?php

      $date_timestamp = $_GET['date_timestamp'];
      $animal_name = $_GET['animal_name'];
      $VAT_owner = $_GET['VAT_owner'];
      $op_code = $_GET['op_code'];

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

      $sql = "SELECT C.date_timestamp,
                     C.s, C.o, C.a, C.p,
                     C.VAT_client,
                     C.VAT_vet,
                     C.weight FROM consult C
                  WHERE C.date_timestamp='$date_timestamp' AND C.name='$animal_name' AND C.VAT_owner=$VAT_owner";
      $result = $connection->query($sql);
      $num = $result->rowCount();
      echo("<p>Consult info:</p>\n");
      if($num>0) {
          echo("<table border=\"1\">\n");
          echo("<tr><td>Date/Time</td><td>s</td><td>o</td><td>a</td><td>p</td><td>VAT Client</td><td>VAT Vet</td><td>Weight</td></tr>\n");
          foreach($result as $row)
          {
              echo("<tr><td>");
              echo($row["date_timestamp"]);
              echo("</td><td>\n");
              echo($row["s"]);
              echo("</td><td>\n");
              echo($row["o"]);
              echo("</td><td>\n");
              echo($row["a"]);
              echo("</td><td>\n");
              echo($row["p"]);
              echo("</td><td>\n");
              echo($row["VAT_client"]);
              echo("</td><td>\n");
              echo($row["VAT_vet"]);
              echo("</td><td>\n");
              echo($row["weight"]);
              echo("</td></tr>\n");
          }
          echo("</table>\n");
      }

      $sql = "SELECT R.file FROM radiography R
                      WHERE R.num = $op_code AND R.date_timestamp='$date_timestamp' AND R.name='$animal_name' AND R.VAT_owner=$VAT_owner";
      $result = $connection->query($sql);
      $rad_num = $result->rowCount();
      if($rad_num>0) {
          echo("<h3>Radiography files associated with this consult: ");
          foreach ($result as $row) {
            echo($row["file"]);
            echo("</h3>");
          }
      }

      $sql = "SELECT P.type FROM test_procedure P
                      WHERE P.num = $op_code AND P.date_timestamp='$date_timestamp' AND P.name='$animal_name' AND P.VAT_owner=$VAT_owner";

      $result = $connection->query($sql);
      $test_num = $result->rowCount();
      if($test_num>0) {
          echo("<p>Test procedures and produced indicators associated with this consult:</p>\n");
          foreach ($result as $row) {
            $aux_sql = "SELECT I.indicator_name, I.value FROM produced_indicator I
                            WHERE I.num = $op_code AND I.date_timestamp='$date_timestamp' AND I.name='$animal_name' AND I.VAT_owner=$VAT_owner";

            $aux_result = $connection->query($aux_sql);
            $indicator_num = $aux_result->rowCount();
            if($indicator_num>0) {
                echo("<table border=\"1\">\n");
                echo("<tr><th>Type: ".$row["type"]."</th><th>Value</th></tr>\n");
                foreach ($aux_result as $aux_row) {
                  echo("<tr><td>");
                  echo($aux_row["indicator_name"]);
                  echo("</td><td>\n");
                  echo($aux_row["value"]);
                  echo("</td></tr>\n");
                }
                echo("</table>\n");
            }
          }
      }

      echo("<p>");
      //echo "<a class='button' href= \"add_procedure.php?flag=1&date_timestamp=$date_timestamp&animal_name=$animal_name&VAT_owner=$VAT_owner\"> Add Blood Test To This Consult </a> <p>";
      //echo("<button class='button' onclick=document.location.href=\"add_new_consult.php?flag=1\">Add New Consult</button>");
      echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
  ?>
</div>
</body>
</html>

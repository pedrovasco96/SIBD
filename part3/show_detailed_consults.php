<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Detailed consult info</title>
</head>
<body>
<div class='content'>
  <h1>Casa Açores Vet Clinic - Consult details</h1>
  <?php

      $date_timestamp = $_GET['date_timestamp'];
      $animal_name = $_GET['animal_name'];
      $VAT_owner = $_GET['VAT_owner'];

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

      $sql = "SELECT A.VAT_owner, A.name, A.age, A.gender, A.colour, A.species_name FROM animal A
                  WHERE A.name='$animal_name' AND A.VAT_owner='$VAT_owner'";

      $result = $connection->query($sql);
      $num = $result->rowCount();

      echo("<p>Animal info:</p>\n");

      if($num>0) {
          echo("<table border=\"1\">\n");
          echo("<tr><td>Owner</td><td>Name</td><td>Age</td><td>Gender</td><td>Colour</td><td>Specie</td></tr>\n");
          foreach($result as $row)
          {
              echo("<tr><td>");
              echo($row["VAT_owner"]);
              echo("</td><td>");
              echo($row["name"]);
              echo("</td><td>");
              echo($row["age"]);
              echo("</td><td>");
              echo($row["gender"]);
              echo("</td><td>");
              echo($row["colour"]);
              echo("</td><td>\n");
              echo($row["species_name"]);
              echo("</td></tr>\n");
          }
          echo("</table>\n");
      }

      $sql = "SELECT C.date_timestamp,
                     C.s, C.o, C.a, C.p,
                     C.VAT_client,
                     C.VAT_vet,
                     C.weight FROM consult C
                  WHERE C.date_timestamp='$date_timestamp' AND C.name='$animal_name' AND C.VAT_owner=$VAT_owner";

      $result = $connection->query($sql);
      $num = $result->rowCount();

      //echo("<p>$num consults found</p>\n");
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

      $sql = "SELECT D.code, C.name FROM consult_diagnosis D, diagnosis_code C
                      WHERE D.code = C.code AND D.date_timestamp='$date_timestamp' AND D.name='$animal_name' AND D.VAT_owner=$VAT_owner";

      $result = $connection->query($sql);
      $num = $result->rowCount();

      //echo("<p>$num diagnosis in this consult</p>\n");
      echo("<p>Diagnosis in this consult</p>\n");

      if($num>0) {
          echo("<table border=\"1\">\n");
          echo("<tr><td>Name</td><td>Code</td></tr>\n");
          foreach($result as $row)
          {
              echo("<tr><td>");
              echo($row["name"]);
              echo("</td><td>\n");
              echo($row["code"]);
              echo("</td></tr>\n");
          }
          echo("</table>\n");
      }

      $sql = "SELECT C.name, P.med_name, P.dosage, P.lab, P.regime FROM prescription P, diagnosis_code C
                      WHERE C.code = P.code AND P.date_timestamp='$date_timestamp' AND P.name='$animal_name' AND P.VAT_owner=$VAT_owner";

      $result = $connection->query($sql);
      $num = $result->rowCount();

      echo("<p>Prescriptions associated with this consult</p>\n");

      if($num>0) {
          echo("<table border=\"1\">\n");
          echo("<tr><td>Diagnosis</td><td>Drug Name</td><td>Dosage</td><td>Lab</td><td>Regime</td></tr>\n");
          foreach($result as $row)
          {
              echo("<tr><td>");
              echo($row["name"]);
              echo("</td><td>\n");
              echo($row["med_name"]);
              echo("</td><td>\n");
              echo($row["dosage"]);
              echo("</td><td>\n");
              echo($row["lab"]);
              echo("</td><td>\n");
              echo($row["regime"]);
              echo("</td></tr>\n");
          }
          echo("</table>\n");
      }


      //SELECT ALL OPERATIONS FOR THE CONSULT
      $sql = "SELECT O.num, O.description FROM operation O
                      WHERE O.date_timestamp='$date_timestamp' AND O.name='$animal_name' AND O.VAT_owner=$VAT_owner";

      $result = $connection->query($sql);
      $num = $result->rowCount();
      if($num>0) {
          echo("<p>Procedures associated with this consult (click on the code for more information)</p>\n");
          echo("<table border=\"1\">\n");
          echo("<tr><td>ID</td><td>Description</td></tr>\n");
          foreach ($result as $row) {
            echo("<tr><td>");
            $op_code = $row["num"];
            echo "<a href= \"show_detailed_procedures.php?date_timestamp=$date_timestamp&animal_name=$animal_name&VAT_owner=$VAT_owner&op_code=$op_code\"> $op_code</a>";
            echo("</td><td>\n");
            echo($row["description"]);
            echo("</td></tr>\n");
          }
          echo("</table>\n");
      }

      echo("<p>");
      echo "<a class='button' href= \"add_procedure.php?flag=1&date_timestamp=$date_timestamp&animal_name=$animal_name&VAT_owner=$VAT_owner\"> Add Blood Test To This Consult </a> <p>";
      echo("<button class='button' onclick=document.location.href=\"add_new_consult.php?flag=1\">Add New Consult</button>");
      echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
  ?>
</div>
</body>
</html>

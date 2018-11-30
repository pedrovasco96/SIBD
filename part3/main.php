<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Casa Açores Vet Clinic</title>
</head>
<body>
<div class='content'>
  <h1>Casa Açores Vet Clinic - Search results</h1>
  <?php

      $VAT_client = $_REQUEST['vat_client'];
      $animal_name = $_REQUEST['animal_name'];
      $animal_owner = $_REQUEST['animal_owner'];

      include 'credentials.php';

      try{
        $connection = new PDO($dsn, $user, $pass);
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      }
      catch(PDOException $exception){
        echo("<p>Error: ");
        echo($exception->getMessage());
        echo("</p>");
        exit();
      }

      $query = "SELECT * FROM person P, client C WHERE C.VAT= :vat_client AND C.VAT=P.VAT;";
      $exec = $connection->prepare($query);
      $exec->bindParam(':vat_client', $VAT_client, PDO::PARAM_INT);
      $exec->execute();
      $num_client = $exec->rowCount();

      echo("<p>Clients found:</p>\n");
      if ($num_client > 0){
          echo("<table border=\"1\">\n");
          echo("<tr><th>VAT</th><th>Name</th><th>City</th><th>Street</th><th>ZIP</th></tr>\n");
          foreach($exec as $row)
          {
              echo("<tr><td>");
              echo($row["VAT"]);
              echo("</td><td>");
              echo($row["name"]);
              echo("</td><td>");
              echo($row["address_city"]);
              echo("</td><td>\n");
              echo($row["address_street"]);
              echo("</td><td>\n");
              echo($row["address_zip"]);
              echo("</td></tr>\n");
          }
          echo("</table>\n");
      }

      // second query
      $sql = "SELECT A.name, A.VAT_owner, A.species_name, A.colour, A.gender, A.birth_year, A.age
                  FROM animal A, person P
                  WHERE P.VAT=A.VAT_owner AND A.name= :animal_name AND (P.name LIKE :animal_owner);";
      $exec = $connection->prepare($sql);
      $a_owner="%".$animal_owner."%";
      $exec->bindParam(':animal_name', $animal_name);
      $exec->bindParam(':animal_owner', $a_owner);
      $exec->execute();
      $num_animal = $exec->rowCount();

      echo("<p>Animals found:</p>\n");

      if($num_animal>0){
          echo("<table border=\"1\">\n");
          echo("<tr><th>VAT Owner</th><th>Name</th><th>Species Name</th><th>Colour</th><th>Gender</th><th>Birth Year</th><th>Age</th></tr>\n");
          foreach($exec as $row)
          {
              echo("<tr><td>");
              echo($row["VAT_owner"]);
              echo("</td><td>");
              $name=$row["name"];
              echo "<a href='show_consults.php'>$name</a>";
              echo("</td><td>");
              echo($row["species_name"]);
              echo("</td><td>\n");
              echo($row["colour"]);
              echo("</td><td>\n");
              echo($row["gender"]);
              echo("</td><td>\n");
              echo($row["birth_year"]);
              echo("</td><td>\n");
              echo($row["age"]);
              echo("</td></tr>\n");
          }
          echo("</table>\n");
      }

      // third query
      $query = "SELECT * FROM consult C, animal A, person P
                  WHERE P.VAT=A.VAT_owner AND (P.name LIKE :animal_owner) AND A.name= :animal_name
                  AND C.VAT_owner=A.VAT_owner AND C.VAT_client = :vat_client;";
      $exec = $connection->prepare($query);
      $a_owner="%".$animal_owner."%";
      $exec->bindParam(':vat_client', $VAT_client);
      $exec->bindParam(':animal_name', $animal_name);
      $exec->bindParam(':animal_owner', $a_owner);
      $exec->execute();
      $num_consult = $exec->rowCount();

      echo("<p>Consults associated with this animal and this client:</p>\n");

      if($num_consult>0){
          echo("<table border=\"1\">\n");
          echo("<tr><th>VAT Owner</th><th>Name</th><th>Date/Time</th><th>s</th><th>o</th><th>a</th><th>p</th><th>VAT Client</th><th>VAT Vet</th><th>weight</th></tr>\n");
          foreach($exec as $row)
          {
              echo("<tr><td>");
              echo($row["VAT_owner"]);
              echo("</td><td>");
              echo($row["name"]);
              echo("</td><td>");
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

      $connection = null;

      if($num_animal <= 0 && $num_client > 0){

          echo("<button class='button' onclick=document.location.href=\"insert_animal.php?flag=1\">Insert Animal</button>");
      }

      session_start();
      $_SESSION['VAT_client'] = $VAT_client;
      $_SESSION['animal_name'] = $animal_name;

      echo("\n \n");
      echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
  ?>
</div>

</body>
</html>

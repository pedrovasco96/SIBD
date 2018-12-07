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

      $vat_string = strlen((string) $VAT_client);
      if($vat_string != 4)
        echo("<p> Seems like you misstyped. Client VAT should have 4 numbers (e.g. 1001). </p>");
      else{
        $query = "SELECT * FROM person P, client C WHERE C.VAT= :vat_client AND C.VAT=P.VAT;";
        $exec = $connection->prepare($query);
        $exec->bindParam(':vat_client', $VAT_client, PDO::PARAM_INT);
        $exec->execute();
        $num_client = $exec->rowCount();

        if ($num_client > 0){
            echo("<p>Clients found:</p>\n");
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

        if($num_animal>0){
            echo("<p>Animals found:</p>\n");
            echo("<table border=\"1\">\n");
            echo("<tr><th>VAT Owner</th><th>Name</th><th>Species Name</th><th>Colour</th><th>Gender</th><th>Birth Year</th><th>Age</th></tr>\n");
            foreach($exec as $row)
            {
                echo("<tr><td>");
                $v_owner = $row["VAT_owner"];
                echo($row["VAT_owner"]);
                echo("</td><td>");
                $name=$row["name"];
                echo "<a href= \"show_consults.php?VAT_owner=$v_owner\">$name</a>";
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

        //check if client already owns an animal with the name provided
        $sql = "SELECT *  FROM animal A, person P
                          WHERE P.VAT=A.VAT_owner AND P.VAT= :vat_client AND A.name= :animal_name;";
        $exec = $connection->prepare($sql);
        $exec->bindParam(':animal_name', $animal_name);
        $exec->bindParam(':vat_client', $VAT_client, PDO::PARAM_INT);
        $exec->execute();
        $num_animal_client = $exec->rowCount();

        if ($num_animal <= 0 && $num_client > 0){
          if($num_animal_client > 0){
            echo("<p> There is already one animal registered with the name ");
            echo($animal_name);
            echo(" for the client ");
            echo($VAT_client);
            echo(". Try inserting the name above in the field 'Owner's name'. </p>");
          }
        }

        // third query
        $query = "SELECT * FROM consult C, animal A, person P
                    WHERE P.VAT=A.VAT_owner AND (P.name LIKE :animal_owner) AND A.name= :animal_name
                    AND C.VAT_owner=A.VAT_owner AND C.name = :animal_name AND C.VAT_client = :vat_client;";
        $exec = $connection->prepare($query);
        $a_owner="%".$animal_owner."%";
        $exec->bindParam(':vat_client', $VAT_client, PDO::PARAM_INT);
        $exec->bindParam(':animal_name', $animal_name);
        $exec->bindParam(':animal_owner', $a_owner);
        $exec->execute();
        $num_consult = $exec->rowCount();

        if($num_consult>0){
            echo("<p>Consults associated with this animal and this client:</p>\n");
            echo("<table border=\"1\">\n");
            echo("<tr><th>VAT Owner</th><th>Owner name</th><th>Date/Time</th><th>s</th><th>o</th><th>a</th><th>p</th><th>VAT Client</th><th>VAT Vet</th><th>weight</th></tr>\n");
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

        //check if person added as client already exists in the database
        if($num_client <= 0){
          $query = "SELECT * FROM person P WHERE P.VAT= :vat_client;";
          $exec = $connection->prepare($query);
          $exec->bindParam(':vat_client', $VAT_client, PDO::PARAM_INT);
          $exec->execute();
          $exists = $exec->rowCount();
        }

        $connection = null;

        if($num_animal_client <= 0 && $num_client > 0){

            echo("<button class='button' onclick=document.location.href=\"insert_animal.php?flag=1\">Insert Animal</button>");
        }

        if($num_client <= 0 && $vat_string == 4){
            if($exists <= 0)
              echo("<button class='button' onclick=document.location.href=\"insert_client.php?flag=1\">Insert Client</button>");
            else
              echo("<button class='button' onclick=document.location.href=\"insert_client_exist.php?flag=1\">Insert Client</button>");
        }

        session_start();
        $_SESSION['VAT_client'] = $VAT_client;
        $_SESSION['animal_name'] = $animal_name;
      }
        echo("\n \n");
        echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

  ?>
</div>

</body>
</html>

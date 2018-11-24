<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Casa Açores Vet Clinic</title>
</head>
<body>
<?php

    $VAT1 = $_REQUEST['VAT1'];
    $animal_name = $_REQUEST['animal_name'];
    $animal_owner = $_REQUEST['animal_owner'];

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

    $sql = "SELECT * FROM person P, client C WHERE C.VAT='$VAT1' AND C.VAT=P.VAT;";

    /*try{
      $sql = "SELECT *
              FROM person P, client C
              WHERE C.VAT = :vat
                AND C.VAT = P.VAT;";
      $stmt=$connection->prepare($sql);
      $stmt->bindParam(':vat', $VAT1, PDO::PARAM_INT);
      $stmt->execute();
      $result=$stmt->get_result();
      echo("<p>filhe de pute: </p>");
    }
    catch(PDOException $exception){
      echo("<p>Error: ");
      echo($exception->getMessage());
      echo("</p>");
      exit();
    }*/

    $result = $connection->query($sql);

    $num = $result->rowCount();

    echo("<p>Clients found:</p>\n");

    if ($num > 0){
        echo("<table border=\"1\">\n");
        echo("<tr><th>VAT</th><th>Name</th><th>City</th><th>Street</th><th>ZIP</th></tr>\n");
        foreach($result as $row)
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
            WHERE P.VAT=A.VAT_owner AND A.name='$animal_name' AND (P.name LIKE '%$animal_owner%');";

    $result = $connection->query($sql);

    $num_a = $result->rowCount();

    echo("<p>Animals found:</p>\n");

    if($num_a>0){
        echo("<table border=\"1\">\n");
        echo("<tr><th>VAT Owner</th><th>Name</th><th>Species Name</th><th>Colour</th><th>Gender</th><th>Birth Year</th><th>Age</th></tr>\n");
        foreach($result as $row)
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
    $sql = "SELECT * FROM consult C, animal A, person P
            WHERE P.VAT=A.VAT_owner AND A.name='$animal_name' AND A.VAT_owner='$VAT1'
            AND C.VAT_owner='$VAT1' AND (P.name LIKE '%$animal_owner%');";

    $result = $connection->query($sql);

    $num_c = $result->rowCount();

    echo("<p>Consults associated with this animal and this client:</p>\n");

    if($num_c>0){
        echo("<table border=\"1\">\n");
        echo("<tr><th>VAT Owner</th><th>Name</th><th>Date/Time</th><th>s</th><th>o</th><th>a</th><th>p</th><th>VAT Client</th><th>VAT Vet</th><th>weight</th></tr>\n");
        foreach($result as $row)
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

    if($num_a<=0 && $num>0){

        echo("<button class='button' onclick=document.location.href=\"insert_animal.php?flag=1\">Insert Animal</button>");
    }

    session_start();
    $_SESSION['VAT1'] = $VAT1;
    $_SESSION['animal_name'] = $animal_name;

    echo("\n \n");
    echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
?>

</body>
</html>

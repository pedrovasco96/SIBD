<html><meta charset="UTF-8">
<head>
    <title>Casa Açores Vet Clinic</title>
</head>
<body>
<?php

    $VAT1 = $_REQUEST['VAT1'];
    $animal_name = $_REQUEST['animal_name'];
    $animal_owner = $_REQUEST['animal_owner'];

    $host="localhost";	// MySQL is hosted in this machine
    $user="root";	// <== replace istxxx by your IST identity
    $password="";	// <== paste here the password assigned by mysql_reset
    $dbname = "vet2";	// Do nothing here, your database has the same name as your username.

    try{
        $connection = new PDO("mysql:host=" . $host. ";dbname=" . $dbname, $user, $password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
    }
    catch(PDOException $exception) {
        echo("<p>Error: ");
        echo($exception->getMessage());
        echo("</p>");
        exit();
    }

    $sql = "SELECT * FROM person P, client C WHERE C.VAT='$VAT1' AND C.VAT=P.VAT;";

    $result = $connection->query($sql);

    $num = $result->rowCount();

    echo("<p>$num client found:</p>\n");

    if ($num > 0){
        echo("<table border=\"1\">\n");
        echo("<tr><td>VAT</td><td>name</td><td>address_city</td><td>address_street</td><td>address_zip</td></tr>\n");
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

    echo("<p>$num_a animal found:</p>\n");

    if($num_a>0){
        echo("<table border=\"1\">\n");
        echo("<tr><td>VAT Owner</td><td>Name</td><td>Species Name</td><td>Colour</td><td>Gender</td><td>Birth Year</td><td>Age</td></tr>\n");
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

    echo("<p>$num_c consults associated with this animal an this client:</p>\n");

    if($num_c>0){
        echo("<table border=\"1\">\n");
        echo("<tr><td>VAT Owner</td><td>Name</td><td>Date/Time</td><td>s</td><td>o</td><td>a</td><td>p</td><td>VAT Client</td><td>VAT Vet</td><td>weight</td></tr>\n");
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

        echo("<button onclick=document.location.href=\"insert_animal.php?flag=1\">Insert Animal</button>");
    }

    session_start();
    $_SESSION['VAT1'] = $VAT1;
    $_SESSION['animal_name'] = $animal_name;

    echo "<p>";
    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
?>

</body>
</html>
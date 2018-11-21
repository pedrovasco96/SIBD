<html><meta charset="UTF-8">
<head>
    <title>Casa Açores Vet Clinic</title>
</head>
<body>
<?php

    $date_timestamp = $_GET['date_timestamp'];
    $animal_name = $_GET['animal_name'];

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

    $sql = "SELECT A.age, A.gender, A.colour, A.species_name FROM animal A
                WHERE A.name='$animal_name'";

    $result = $connection->query($sql);
    $num = $result->rowCount();

    echo("<p>Animal info:</p>\n");

    if($num>0) {
        echo("<table border=\"1\">\n");
        echo("<tr><td>Age</td><td>Gender</td><td>Colour</td><td>Specie</td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
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

    $sql = "SELECT * FROM consult C
                WHERE C.date_timestamp='$date_timestamp' AND C.name='$animal_name'";

    $result = $connection->query($sql);
    $num = $result->rowCount();

    echo("<p>$num consults found</p>\n");

    if($num>0) {
        echo("<table border=\"1\">\n");
        echo("<tr><td>VAT Owner</td><td>Name</td><td>Date/Time</td><td>s</td><td>o</td><td>a</td><td>p</td><td>VAT Client</td><td>VAT Vet</td><td>Weight</td></tr>\n");
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

    $sql = "SELECT D.code, D.name FROM consult_diagnosis D
                    WHERE D.date_timestamp='$date_timestamp' AND D.name='$animal_name'";

    $result = $connection->query($sql);
    $num = $result->rowCount();

    echo("<p>$num diagnosis in this consult</p>\n");

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

    $sql = "SELECT * FROM prescription P
                    WHERE P.date_timestamp='$date_timestamp' AND P.name='$animal_name'";

    $result = $connection->query($sql);
    $num = $result->rowCount();

    echo("<p>$num prescription associated with this consult</p>\n");

    if($num>0) {
        echo("<table border=\"1\">\n");
        echo("<tr><td>Code</td><td>Name</td><td>VAT Owner</td><td>Date/Time</td><td>Drug Name</td><td>Dosage</td><td>Lab</td><td>Regime</td></tr>\n");
        foreach($result as $row)
        {
            echo("<tr><td>");
            echo($row["code"]);
            echo("</td><td>");
            echo($row["name"]);
            echo("</td><td>");
            echo($row["VAT_owner"]);
            echo("</td><td>\n");
            echo($row["date_timestamp"]);
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

    echo("<p> </p>\n");
    echo "<a href= \"add_procedure.php?flag=1&date_timestamp=$date_timestamp&animal_name=$animal_name\"> Add Blood Test To This Consult </a> <p>";
    #echo("<button onclick=document.location.href=\"add_procedure.php?flag=1&date_timestamp=$date_timestamp&animal_name=$animal_name\">Add Blood Test To This Consult</button>");
    echo("<button onclick=document.location.href=\"add_new_consult.php?flag=1\">Add New Consult</button>");
    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
?>
</body>
</html>
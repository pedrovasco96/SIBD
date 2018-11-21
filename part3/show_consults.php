<html><meta charset="UTF-8">
<head>
    <title>Casa Açores Vet Clinic</title>
</head>
<body>
<?php

    session_start();
    $VAT_owner = $_SESSION['VAT1'];
    $animal_name = $_SESSION['animal_name'];

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

    $sql = "SELECT C.date_timestamp, C.VAT_vet FROM consult C
            WHERE C.name='$animal_name'";

    $result = $connection->query($sql);
    $num = $result->rowCount();

    echo("<p>$num consults found</p>\n");

    if($num>0) {
        echo("<table border=\"1\">\n");
        echo("<tr><td>Date and Time</td><td>VAT Vet</td></tr>\n");
        foreach ($result as $row) {
            echo("<tr><td>");
            $name = $row["date_timestamp"];
            echo "<a href= \"show_detailed_consults.php?date_timestamp=$name&animal_name=$animal_name\"> $name</a>";
            #echo "<a href='show_detailed_consults.php'>$name</a>";
            echo("</td><td>");
            echo($row["VAT_vet"]);
            echo("</td></tr>\n");
        }
        echo("</table>\n");
    }

    echo("<p> </p>\n");
    echo("<button onclick=document.location.href=\"add_new_consult.php?flag=1\">Add New Consult</button>");
    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

    $connection = null;
?>
</body>
</html>
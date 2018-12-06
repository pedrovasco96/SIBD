<html><meta charset="UTF-8">
<head>
    <title>Casa Açores Vet Clinic</title>
</head>
<body>
<?php

    session_start();
    $date_timestamp = $_SESSION['date_timestamp'];
    $animal_name = $_SESSION['animal_name'];
    $VAT_assistant = $_REQUEST['VAT_assistant'];
    $white_cells = $_REQUEST['white_cells'];
    $lymphocytes = $_REQUEST['lymphocytes'];
    $neutrophils = $_REQUEST['neutrophils'];
    $monocytes = $_REQUEST['monocytes'];

    $flag=0;

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

    $sql = "SELECT A.VAT_owner FROM animal A
                WHERE A.name='$animal_name'";

    $result = $connection->query($sql);

    foreach($result as $row)
    {
        $VAT_owner=$row["VAT_owner"];
    }

    $connection->beginTransaction();

    $sql = "insert into operation values (1,'$animal_name', '$VAT_owner', '$date_timestamp', 'Analysis');";
    $result = $connection->query($sql);
    if(!$result)
    {
        $flag=1;
        $connection->rollback();
    }

    $sql = "insert into test_procedure values (1,'$animal_name', '$VAT_owner', '$date_timestamp', 'Blood');";
    $result = $connection->query($sql);
    if(!$result)
    {
        $flag=1;
        $connection->rollback();
    }

    $sql = "insert into performed values (1,'$animal_name', '$VAT_owner', '$date_timestamp', '$VAT_assistant');";
    $result = $connection->query($sql);
    if(!$result)
    {
        $flag=1;
        $connection->rollback();
    }

    $sql = "insert into produced_indicator values (1,'$animal_name', '$VAT_owner', '$date_timestamp', 'White Blood Cell Count', :white_cells);";
    $exec = $connection->prepare($sql);
    $exec->bindParam(':white_cells', $white_cells, PDO::PARAM_INT);
    $exec->execute();
    if(!$exec)
    {
        $flag=1;
        $connection->rollback();
    }

    $sql = "insert into produced_indicator values (1,'$animal_name', '$VAT_owner', '$date_timestamp', 'Number of Lymphocytes', :lymphocytes);";
    $exec = $connection->prepare($sql);
    $exec->bindParam(':lymphocytes', $lymphocytes, PDO::PARAM_INT);
    $exec->execute();
    if(!$exec)
    {
        $flag=1;
        $connection->rollback();
    }

    $sql = "insert into produced_indicator values (1,'$animal_name', '$VAT_owner', '$date_timestamp', 'Number of Neutrophils', :neutrophils);";
    $exec = $connection->prepare($sql);
    $exec->bindParam(':neutrophils', $neutrophils, PDO::PARAM_INT);
    $exec->execute();
    if(!$exec)
    {
        $flag=1;
        $connection->rollback();
    }

    $sql = "insert into produced_indicator values (1,'$animal_name', '$VAT_owner', '$date_timestamp', 'Number of Monocytes', :monocytes);";
    $exec = $connection->prepare($sql);
    $exec->bindParam(':monocytes', $monocytes, PDO::PARAM_INT);
    $exec->execute();
    if(!$exec)
    {
        $flag=1;
        $connection->rollback();
    }

    if($flag==0)
    {
        $connection->commit();
    }

    echo("New Blood Test Inserted in Databse \n");

    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

    $connection = null;
?>
</body>
</html>

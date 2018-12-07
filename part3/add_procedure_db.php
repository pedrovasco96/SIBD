<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Add procedure</title>
</head>
<body>
<div class='content'>
  <h1>Casa Açores Vet Clinic - Add procedure</h1>
<?php

    session_start();
    $VAT_owner = $_SESSION['VAT_owner'];
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

    $connection->beginTransaction();

    $sql = "insert into operation values ('default','$animal_name', '$VAT_owner', '$date_timestamp', 'Analysis');";
    $result = $connection->query($sql);
<<<<<<< HEAD
    if($result===FALSE)
=======
    if(!$result)
>>>>>>> a21fa774cf3cad59cafb2c37cae1de4bb5e39d3c
    {
        echo("<p>Pila: ");
        $flag=1;
        $connection->rollback();
<<<<<<< HEAD
    }

    if($flag==0){
         $sql = "SELECT O.num FROM operation O
                WHERE O.name='$animal_name' and O.VAT_owner = $VAT_owner and O.date_timestamp='$date_timestamp'";
        $result = $connection->query($sql);
        foreach ($result as $row) {
            $op_num = $row["num"];
        }
=======
<<<<<<< HEAD
=======
    }*/
    $sql = "SELECT O.num FROM operation O
            WHERE O.name='$animal_name' and O.VAT_owner = $VAT_owner and O.date_timestamp='$date_timestamp'";
    $result = $connection->query($sql);
    foreach ($result as $row) {
        $op_num = $row["num"];
>>>>>>> add616528ae36763a01d5a6cea952368fbd05b20
    }

    $sql = "insert into test_procedure values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', 'Blood');";
    $result = $connection->query($sql);
    if(!$result)
    {
        $flag=1;
        $connection->rollback();
    }
>>>>>>> a21fa774cf3cad59cafb2c37cae1de4bb5e39d3c

        $sql = "insert into test_procedure values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', 'Blood');";
        $result = $connection->query($sql);
        if($result===FALSE)
        {
            echo("<p>Error inserting into test_procedure</p>");
            $flag=1;
            $connection->rollback();
        }
    }
    

<<<<<<< HEAD
    if($flag==0){
        $sql = "insert into performed values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', '$VAT_assistant');";
        $result = $connection->query($sql);
        if($result===FALSE)
        {
            echo("<p>Error inserting into performed</p>");
            $flag=1;
            $connection->rollback();
        }
    }

    if($flag==0){
        $sql = "insert into produced_indicator values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', 'White Cells', :white_cells);";
        $exec = $connection->prepare($sql);
        $exec->bindParam(':white_cells', $white_cells, PDO::PARAM_INT);
        $result = $exec->execute();
        if($result===FALSE)
        {
            echo("<p>Error inserting white cells</p>");
            $flag=1;
            $connection->rollback();
        }
    }

    if($flag==0){
        $sql = "insert into produced_indicator values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', 'Lymphocytes', :lymphocytes);";
        $exec = $connection->prepare($sql);
        $exec->bindParam(':lymphocytes', $lymphocytes, PDO::PARAM_INT);
        $exec->execute();
        if($result===FALSE)
        {
            echo("<p>Error inserting lymphocytes</p>");
            $flag=1;
            $connection->rollback();
        }
    }

    if($flag==0){
        $sql = "insert into produced_indicator values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', 'Neutrophils', :neutrophils);";
        $exec = $connection->prepare($sql);
        $exec->bindParam(':neutrophils', $neutrophils, PDO::PARAM_INT);
        $exec->execute();
        if($result===FALSE)
        {
            echo("<p>Error inserting neutrophils</p>");
            $flag=1;
            $connection->rollback();
        }
    }

    if($flag==0){
        $sql = "insert into produced_indicator values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', 'Monocytes', :monocytes);";
        $exec = $connection->prepare($sql);
        $exec->bindParam(':monocytes', $monocytes, PDO::PARAM_INT);
        $exec->execute();
        if($result===FALSE)
        {
            echo("<p>Error inserting monocytes</p>");
            $flag=1;
            $connection->rollback();
        }
=======
    $sql = "insert into performed values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', '$VAT_assistant');";
    $result = $connection->query($sql);
    if(!$result)
    {
        $flag=1;
        $connection->rollback();
    }

    $sql = "insert into produced_indicator values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', 'White Cells', :white_cells);";
    $exec = $connection->prepare($sql);
    $exec->bindParam(':white_cells', $white_cells, PDO::PARAM_INT);
    $exec->execute();
    if(!$exec)
    {
        $flag=1;
        $connection->rollback();
    }

    $sql = "insert into produced_indicator values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', 'Lymphocytes', :lymphocytes);";
    $exec = $connection->prepare($sql);
    $exec->bindParam(':lymphocytes', $lymphocytes, PDO::PARAM_INT);
    $exec->execute();
    if(!$exec)
    {
        $flag=1;
        $connection->rollback();
    }

    $sql = "insert into produced_indicator values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', 'Neutrophils', :neutrophils);";
    $exec = $connection->prepare($sql);
    $exec->bindParam(':neutrophils', $neutrophils, PDO::PARAM_INT);
    $exec->execute();
    if(!$exec)
    {
        $flag=1;
        $connection->rollback();
    }

    $sql = "insert into produced_indicator values ('$op_num','$animal_name', '$VAT_owner', '$date_timestamp', 'Monocytes', :monocytes);";
    $exec = $connection->prepare($sql);
    $exec->bindParam(':monocytes', $monocytes, PDO::PARAM_INT);
    $exec->execute();
    if(!$exec)
    {
        $flag=1;
        $connection->rollback();
>>>>>>> a21fa774cf3cad59cafb2c37cae1de4bb5e39d3c
    }

    if($flag==0)
    {
        $connection->commit();
<<<<<<< HEAD
        echo("<p>New Blood Test Inserted in Databse</p>");
    }
    else{
        echo("<p>Error: Blood Test Not Inserted! Please Try Again! </p>");
    }
=======
<<<<<<< HEAD
    }
    echo("produced indicator added \n \n ");

    echo("New Blood Test Inserted in Database \n");
=======
    }*/
    $connection->commit();
    echo("<p>New Blood Test Inserted in Databse</p>");
>>>>>>> add616528ae36763a01d5a6cea952368fbd05b20
>>>>>>> a21fa774cf3cad59cafb2c37cae1de4bb5e39d3c

    echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");

    $connection = null;
?>
</div>
</body>
</html>


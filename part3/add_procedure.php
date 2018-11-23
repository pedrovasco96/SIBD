<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Add procedure</title>
</head>
<body>
<?php
    $date_timestamp = $_GET['date_timestamp'];
    $animal_name = $_GET['animal_name'];
    session_start();
    $_SESSION['animal_name'] = $animal_name;
    $_SESSION['date_timestamp'] = $date_timestamp;
?>
<form action="add_procedure_db.php" method="post">
    <p> VAT Assistant:<br> <input type="text" name="VAT_assistant"></p>
    <p> Creatinine Level:<br> <input type="text" name="creatinine"></p>
    <p> Protease Protein:<br> <input type="text" name="protease"></p>
    <p> Red Cells:<br> <input type="text" name="red_cells"></p>
    <input type="submit">
</form>
<?php
    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
?>
</body>
</html>

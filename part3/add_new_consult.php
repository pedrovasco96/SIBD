<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Add consult</title>
</head>
<body>
<?php
    session_start();
    $VAT_client = $_SESSION['VAT1'];
    $animal_name = $_SESSION['animal_name'];
    session_destroy();
    session_start();
    $_SESSION['VAT_client'] = $VAT_client;
    $_SESSION['animal_name'] = $animal_name;
?>
<form action="add_new_consult_db.php" method="post">
    <p> S:<br> <input type="text" name="s"></p>
    <p> O:<br> <input type="text" name="o"></p>
    <p> A:<br> <input type="text" name="a"></p>
    <p> P:<br> <input type="text" name="p"></p>
    <p> Weight:<br> <input type="text" name="weight"></p>
    <p> VAT Vet:<br> <input type="text" name="VAT_vet"></p>
    <input type="submit">
</form>
<?php
    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
?>
</body>
</html>

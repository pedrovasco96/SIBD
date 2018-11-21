<html><meta charset="UTF-8">
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
    S:<br> <input type="text" name="s"><br>
    O:<br> <input type="text" name="o"><br>
    A:<br> <input type="text" name="a"><br>
    P:<br> <input type="text" name="p"><br>
    Weight:<br> <input type="text" name="weight"><br>
    VAT Vet:<br> <input type="text" name="VAT_vet"><br>
    <input type="submit">
</form>
<?php
    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
?>
</body>
</html>
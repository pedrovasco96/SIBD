<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Insert animal</title>
</head>
<body>
<?php
    session_start();
    $VAT_owner = $_SESSION['VAT1'];
    $animal_name = $_SESSION['animal_name'];
    session_destroy();
    session_start();
    $_SESSION['VAT_owner'] = $VAT_owner;
    $_SESSION['animal_name'] = $animal_name;
?>
<form action="insert_animal_db.php" method="post">
    <p> Species Name:<br> <input type="text" name="species_name"></p>
    <p> Colour:<br> <input type="text" name="colour"></p>
    <p> Gender:<br> <select name="gender">
        <option value="M">M</option>
        <option value="F">F</option>
    </select></p>
    <p> Birth Year:<br>
    <select name="birth_year">
        <?php
            $year = date('Y');
            $min = $year - 80;
            $max = $year;
            for( $i=$max; $i>=$min; $i-- ) {
              echo '<option value='.$i.'>'.$i.'</option>';
            }
          ?>
    </select></p>
    <input type="submit">
</form>
<?php
    echo("<button onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
?>
</body>
</html>

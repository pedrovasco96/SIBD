<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Insert animal</title>
</head>
<body>
<div class='content'>
  <h1>Casa Açores Vet Clinic - Insert animal</h1>
  <?php
      session_start();
      $VAT_owner = $_SESSION['VAT_client'];
      $animal_name = $_SESSION['animal_name'];
      session_destroy();
      session_start();
      $_SESSION['VAT_owner'] = $VAT_owner;
      $_SESSION['animal_name'] = $animal_name;
  ?>
  <form action="insert_animal_db.php" method="post">
      <p> Species name:
      <select name="species_name">
          <?php
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
              $sql = "SELECT name1, name2
                      FROM generalization_species
                      WHERE name1 not in (select name2 from generalization_species);";

              $result = $connection->query($sql);

              $num_a = $result->rowCount();

              if($num_a>0){
                  foreach($result as $row)
                  {
                    echo '<option value="'.$row["name1"].'">'.$row["name2"]. ' - ' .$row["name1"].'</option>';
                  }
              }
            ?>
      </select></p>
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
      <input class='button' type="submit">
  </form>
  <?php
      echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
  ?>
</div>
</body>
</html>

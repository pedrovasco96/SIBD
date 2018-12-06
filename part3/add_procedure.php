<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Add procedure</title>
</head>
<body>
<div class='content'>
  <h1>Casa Açores Vet Clinic - Add procedure</h1>
  <?php
      $date_timestamp = $_GET['date_timestamp'];
      $animal_name = $_GET['animal_name'];
      session_start();
      $_SESSION['animal_name'] = $animal_name;
      $_SESSION['date_timestamp'] = $date_timestamp;
  ?>
  <form action="add_procedure_db.php" method="post">
      <p> Assistant's VAT:<br>
      <select name="VAT_assistant">
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
              $sql = "SELECT a.VAT, p.name
                      FROM assistant a, person p
                      WHERE a.VAT=p.VAT;";

              $result = $connection->query($sql);

              $num_a = $result->rowCount();

              if($num_a>0){
                  foreach($result as $row)
                  {
                    echo '<option value='.$row["VAT"].'>'.$row["VAT"].' - '.$row["name"].'</option>';
                  }
              }
            ?>
      </select></p>
      <p> White Blood Cells Count:<br> <input type="number" min="0" name="white_cells" required></p>
      <p> Number of Lymphocytes:<br> <input type="number" min="0" name="lymphocytes" required></p>
      <p> Number of Neutrophils:<br> <input type="number" min="0" name="neutrophils" required></p>
      <p> Number of Monocytes:<br> <input type="number" min="0" name="monocytes" required></p>
      <input class='button' type="submit">
  </form>
  <?php
      echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
  ?>
</div>
</body>
</html>

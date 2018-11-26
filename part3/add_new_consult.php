<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Add consult</title>
</head>
<body>
<div class='content'>
  <h1>Casa Açores Vet Clinic - Add consult</h1>
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
      <p> S: <input type="text" name="s" placeholder="Subjective observation..."></p>
      <p> O: <input type="text" name="o" placeholder="Objective observation..."></p>
      <p> A: <input type="text" name="a" placeholder="Assessment..."></p>
      <p> P: <input type="text" name="p" placeholder="Plan..."></p>
      <p> Weight: <input type="text" name="weight" placeholder="Weight (Kg)..."></p>
      <p> Veterinary's VAT:
      <select name="vet_vat">
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
              $sql = "SELECT VAT
                      FROM veterinary;";

              $result = $connection->query($sql);

              $num_a = $result->rowCount();

              if($num_a>0){
                  foreach($result as $row)
                  {
                    echo '<option value='.$row["VAT"].'>'.$row["VAT"].'</option>';
                  }
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

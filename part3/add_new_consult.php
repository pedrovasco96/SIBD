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
      $VAT_client = $_SESSION['VAT_client'];
      $VAT_owner = $_SESSION['VAT_owner'];
      $animal_name = $_SESSION['animal_name'];
      session_destroy();
      session_start();
      $_SESSION['VAT_client'] = $VAT_client;
      $_SESSION['animal_name'] = $animal_name;
      $_SESSION['VAT_owner'] = $VAT_owner;
  ?>
  <form action="add_new_consult_db.php" method="post">
      <p> S: <input type="text" name="s" placeholder="Subjective observation..."></p>
      <p> O: <input type="text" name="o" placeholder="Objective observation..."></p>
      <p> A: <input type="text" name="a" placeholder="Assessment..."></p>
      <p> P: <input type="text" name="p" placeholder="Plan..."></p>
      <p> Weight: <input type="number" min="0" name="weight" placeholder="Weight (Kg)..." required></p>
      <p> Diagnosis Code:
      <select name="code">
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
              $sql = "SELECT D.name, D.code
                      FROM diagnosis_code D;";

              $result = $connection->query($sql);

              $num_a = $result->rowCount();

              if($num_a>0){
                  echo '<option value="0">No diagnosis</option>';
                  foreach($result as $row)
                  {
                    echo '<option value='.$row["code"].'>'.$row["name"].'</option>';
                  }
              }
            ?>
      </select></p>
      <p> Veterinary's VAT:
      <select name="VAT_vet">
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
              $sql = "SELECT v.VAT, p.name
                      FROM veterinary v, person p
                      WHERE v.VAT=p.VAT;";

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
      <input class='button' type="submit">
  </form>
  <?php
      echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
  ?>
</div>
</body>
</html>

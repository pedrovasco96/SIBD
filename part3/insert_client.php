<html><meta charset="UTF-8">
<head>
    <link rel="stylesheet" href="styles.css">
    <title>Insert Client</title>
</head>
<body>
<div class='content'>
  <h1>Casa Açores Vet Clinic - Insert Client</h1>
  <?php
      session_start();
      $VAT = $_SESSION['VAT_client'];
      session_destroy();
      session_start();
      $_SESSION['VAT'] = $VAT;
  ?>
  <form action="insert_client_db.php" method="post">
      <p> Name:<br> <input type="text" name="name"></p>
      <p> City:<br> <input type="text" name="city"></p>
      <p> Address street:<br> <input type="text" name="address_street"></p>
      <p> Address zip:<br> <input type="text" placeholder="XXXX-XXX" name="address_zip"></p>
      <input class='button' type="submit">
  </form>
  <?php
      echo("<button class='button' onclick=document.location.href=\"ini.html?flag=1\">Back to Initial Page</button>");
  ?>
</div>
</body>
</html>

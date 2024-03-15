<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $username = $_POST['username'];
  $password = $_POST['password'];

  // Loading login credentials from JSON file
  $logins_file = './db/logins.json';
  $logins = json_decode(file_get_contents($logins_file), true);

  // Check if login credentials match
  foreach ($logins as $login) {
    if ($login['name'] === $username && $login['password'] === $password) {
      // Create a cookie with login data
      setcookie('username', $username, time() + (86400 * 30), "/");
      setcookie('password', $password, time() + (86400 * 30), "/");
      header("Location: index.php");
      exit();
    }
  }

  $error = "Invalid username or password.";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="./assets/style.css">
  <link rel="stylesheet" href="./assets/login.css">
</head>

<body>
  <div class="login-container">
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
      <h2>Login</h2>
      <?php if (isset($error))
        echo "<p class='error'>$error</p>"; ?>
      <div class="input-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="admin" required>
      </div>
      <div class="input-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="password123" required>
      </div>
      <button type="submit" class="btn">Login</button>
      <a href="./">Zurück</a>
    </form>
  </div>
</body>

</html>
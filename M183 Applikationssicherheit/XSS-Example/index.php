<?php
session_start();

// Überprüfen, ob die Login-Cookies vorhanden sind
$loggedIn = isset($_COOKIE['username']) && isset($_COOKIE['password']);

// Logout-Logik
if (isset($_POST['logout'])) {
  // Löschen der Cookies
  setcookie('username', '', time() - 3600, '/');
  setcookie('password', '', time() - 3600, '/');
  // neuladen
  header("Location: index.php");
  exit();
}
?>

<!DOCTYPE html>
<html>

<head>
  <title>Blog Comments</title>
  <link rel="stylesheet" type="text/css" href="./assets/style.css">
</head>

<body>
  <!-- Header -->
  <header>
    <div class="header-left">
      <?php if ($loggedIn) { ?>
        <h1>My Blog</h1>
      <?php } else { ?>
        <h1>XesSaro's Blog</h1>
      <?php } ?>
    </div>
    <div class="header-right">
      <?php if ($loggedIn) { ?>
        <!-- Logout-Button -->
        <form action="" method="post">
          <input type="submit" name="logout" value="Logout" class="login-button" style="margin-bottom: 0;">
        </form>
      <?php } else { ?>
        <!-- Login-Button -->
        <a href="login.php" class="login-button">Login</a>
      <?php } ?>
    </div>
  </header>

  <div class="blog">
    <p class="blogTitle">Lorem ipsum</p>
    <p>
      dolor, sit amet consectetur adipisicing elit. Ipsam enim excepturi voluptate ad minima eius animi eos
      assumenda! Odio nihil possimus quidem laborum tempore mollitia! Consequatur magni sint aliquam facere! Blandit
      turpis cursus in hac habitasse platea dictumst. Aliquam id diam maecenas ultricies mi eget mauris pharetra et.
      Faucibus in ornare quam viverra. Nec sagittis aliquam malesuada bibendum arcu. Consequat mauris nunc congue nisi
      vitae suscipit tellus. Id venenatis a condimentum vitae sapien. Vitae congue mauris rhoncus aenean vel. Amet nisl
      suscipit adipiscing bibendum est. Netus et malesuada fames ac. Sit amet massa vitae tortor condimentum lacinia
      quis. Id cursus metus aliquam eleifend mi in nulla posuere. Mauris augue neque gravida in.
    </p>
    <p class="blogTitle">Ac odio tempor</p>
    <p>
      rci dapibus. Commodo viverra maecenas accumsan lacus vel facilisis volutpat. Lobortis scelerisque fermentum dui
      faucibus in ornare quam. Pellentesque habitant morbi tristique senectus et netus et malesuada. Diam phasellus
      vestibulum lorem sed risus ultricies. Ut venenatis tellus in metus vulputate. Nunc mattis enim ut tellus elementum
      sagittis vitae et. Lectus quam id leo in. Enim ut sem viverra aliquet eget sit. Volutpat diam ut venenatis tellus
      in metus vulputate eu scelerisque.
    </p>
    <p class="blogTitle"> A lacus vestibulum</p>
    <p>
      sed arcu non odio euismod lacinia at. Scelerisque eleifend donec pretium vulputate sapien nec sagittis aliquam.
      Volutpat blandit aliquam etiam erat velit scelerisque. Venenatis tellus in metus vulputate eu scelerisque felis
      imperdiet proin. Et tortor consequat id porta nibh. Justo laoreet sit amet cursus sit amet.
    </p>
  </div>

  <hr>

  <!-- Comment form -->
  <div class="center">
    <h3>Add Comment</h3>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
      Author: <br /> <input type="text" name="author" placeholder="Your Name"><br>
      Comment: <br /> <textarea type="text" name="comment" placeholder="Your Comment"></textarea>
      <br />
      <input type="submit" value="Add Comment" class="login-button">
    </form>
  </div>

  <hr>

  <?php
  // Loading comments from JSON file
  $comments_file = './db/comments.json';
  $comments = json_decode(file_get_contents($comments_file), true);

  // Add new comment
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if ($_POST['author'] == "" || $_POST['comment'] == "") {
      echo "<p class='errorText'>Please fill out all fields!</p>";
    } else {
      $newComment = ['author' => $_POST['author'], 'comment' => $_POST['comment']];
      $comments[] = $newComment;

      // Save comments to JSON file
      file_put_contents($comments_file, json_encode($comments));
    }
  }

  // Display comments
  if (!empty($comments)) {
    echo "<h2>Comments</h2>";
    foreach ($comments as $comment) {
      // WARNING: Insufficient input sanitization, vulnerable to XSS attacks!
      echo "<div class='comment'><p class='author'>{$comment['author']}</p><p>{$comment['comment']}</p></div>";
    }
  } else {
    echo "<p>No comments available.</p>";
  }
  ?>


</body>

</html>
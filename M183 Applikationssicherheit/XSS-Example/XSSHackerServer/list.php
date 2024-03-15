<?php
// Read the content of the JSON file
$fileContent = file_get_contents("cookies.json");

// Decode the JSON array
$cookiesData = json_decode($fileContent, true);

// Check if decoding was successful
if ($cookiesData !== null) {
  // Iterate through the data and display it
  foreach ($cookiesData as $index => $data) {
    echo "Entry " . ($index + 1) . ":<br>";
    echo "Username: " . $data['username'] . "<br>";
    echo "Password: " . $data['password'] . "<br>";

    // Display extras if available
    if (!empty($data['extras'])) {
      echo "Extras:<br>";
      foreach ($data['extras'] as $key => $value) {
        echo "$key: $value<br>";
      }
    }
    echo "<br>";
  }
} else {
  // If decoding fails, display an error message
  echo "Error reading data.";
}
<!DOCTYPE html>
<html>
<?php
        $pageTitle = $_GET["title"];

        // has user and password info for MySQL SELECT.
        $configFile = fopen("config.txt", "r") or die("Unable to open file!");

        // Read from file
        $line1 = fgets($configFile);
        $line2 = fgets($configFile);
        $line1 = str_replace('USER: ', '', $line1);
        $line2 = str_replace('PASSWORD: ', '', $line2);

        // SQL database info
        $servername = "localhost";
        $username = preg_replace('/\s+/', '', $line1);  // get rid of newlines and other whitespaces
        $password = preg_replace('/\s+/', '', $line2);  // get rid of newlines and other whitespaces
        $dbname = "shiningforce2";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT * FROM ".strtolower($pageTitle);
        $result = $conn->query($sql);
        $conn->close();


        $records = array();

        // get all results in a nice array
        while($row = $result->fetch_assoc()) {
            array_push($records, $row);
        }
    ?>
<head>
    <title><?php echo ucfirst($pageTitle) ?></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="universal.css">
    <script src="header.js"></script>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
</head>
<body>
    <?php
        include 'universal.php';
        echo loadHeader();?>
    <div id="content">
        <div id="overviewTableWrapper">
            <div id="overviewTable" class="fancyBorder">
                <?php
                    $amt = sizeof($records);
                    $widthOfTable = floor(sqrt($amt));
                    
                    $count=0; // used to break up table into square-ish

                    if(ceil($amt/$widthOfTable) > 7){ // maximum of 7 rows.
                        $widthOfTable = ceil($amt/7);
                    }
                    
                    echo "<table><tr>";

                    foreach($records as $record){
                        // insert image and link to lower location on page
                        echo "<td><a href=#".strtolower(str_replace(" ","",$record["name"]))."><img src='.".$record["filepath"].".png"."'></img></a></td>";
                        $count ++;

                        // if width of table, add a newline
                        if($count==$widthOfTable){
                            echo "</tr><tr>";
                            $count=0;
                        }
                    }
                    echo "</tr></table>";
                ?>
            </div>
        </div>
        <div id="details">
            <table class="fancyBorder">
                <tr>
                    <th>Icon</th>
                    <th>Name</th>
                    <th>Users</th>
                    <th>Attack</th>
                    <th>Defense</th>
                    <th>Agility</th>
                    <th>Movement</th>
                    <th>Notes</th>
                </tr>
                <?php
                    foreach($records as $row){
                        echo "<tr><td><img src=\".".$row["filepath"].
                            ".png\"/></td><td>".$row["name"].
                            "</td><td>".$row["class"].
                             "</td><td>".$row["att"].
                             "</td><td>".$row["def"].
                             "</td><td>".$row["agi"].
                             "</td><td>".$row["mov"].
                             "</td><td>".$row["description"].
                             "</td></tr>";
                    }

                ?>
            </table>
        </div>
    </div>
    <?php
        include 'universal.php';
        echo loadFooter();?>
</body>
</html>
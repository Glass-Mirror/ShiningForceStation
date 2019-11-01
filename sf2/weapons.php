<!DOCTYPE html>
<html>
<head>
    <?php
        // which table are we using?

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

        $sql = "SELECT * FROM weapons";
        $result = $conn->query($sql);
        $conn->close();


        $records = array();

        // get all results in a nice array
        while($row = $result->fetch_assoc()) {
            array_push($records, $row);
        }
    ?>

    <title>Weapons</title>
</head>
<body>
    <div id="content">
        <div id="overviewTable">
            <?php
            $amt = sizeof($records);
            $widthOfTable = floor(sqrt($amt));
            
            // keep track of repeated classes
            $classesChecked = array();
            
            foreach($records as $record){
                $classsList = $record["class"];
                $classTypes = explode(",",$classsList); // classes for this weapon
                
                $newClass = true;

                foreach($classTypes as $checkRepeat){
                    if(in_array($checkRepeat, $classesChecked)){
                        $newClass = false; // repeat class
                    }else{
                        array_push($classesChecked, $checkRepeat); // add to seen class list
                    }
                }

                if($newClass){
                    echo "<br />";
                }
                echo "<img style='width:4vw' src='.".$record["filepath"].".png"."'></img>";
            }
            

            foreach($records as $row){
                echo "<br/>name: " . $row["name"]. " - class: " . $row["class"];
            }
            ?>
        </div>

        <div id="details">

        </div>

    </div>
    <?php
    


    
    ?>
</body>
</html>
<?php
  function loadHeader(){
    echo "<div id=\"header\" class=\"fancyBorder\">";
    echo "<a href=\"/\"><img src=\"logo.png\" height=\"100%\"></a>";
    echo "<table id=\"desktopNav\"><tbody><tr>";
    echo "<td><a href=\"guide.php/?p=0\">Guide</a></td>";
    echo "<td><a href=\"characters.php/\">Characters</a></td>";
    echo "<td><a href=\"magic.php/\">Magic</a></td>";
    echo "<td><a href=\"weapons.php/\">Weapons</a></td>";
    echo "<td><a href=\"items.php/\">Items</a></td>";
    echo "<td><a href=\"secrets.php/\">Secrets</a></td>";
    echo "<td><a href=\"about.php/\">About</a></td>";
    echo "</tr></tbody></table>";
    echo "</div>";
  }
?>
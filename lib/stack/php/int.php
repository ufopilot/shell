<?php
$string = "8.54";
$number = ($string == (int) $string) ? (int) $string : (float) $string;
echo $number * 100 . "\n";
?>

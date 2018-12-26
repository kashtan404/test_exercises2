<html>
 <head>
  <title>Test</title>
 </head>
 <body>

<?php
$n = "null";
if(isset($_GET['n'])){
    $n = $_GET['n'];
}
// PHP code to get the Fibonacci series
function Fibonacci($n){
    $num1 = 0;
    $num2 = 1;
    $counter = 0;
    while ($counter < $n){
        echo ' '.$num1;
        $num3 = $num2 + $num1;
        $num1 = $num2;
        $num2 = $num3;
        $counter = $counter + 1;
    }
}
// Driver Code
Fibonacci($n);
?>

 </body>
</html>
<html>
 <head>
  <title>BLOCKED</title>
 </head>
 <body>
  <b>BLOCKED!</b>
   <?php
   $visitor_ip = $_SERVER['REMOTE_ADDR'];
   $requested_url = $_SERVER['REQUEST_URI'];
   $db = pg_connect('host=' .$_ENV["DBHOST"] . ' dbname=' .$_ENV["DBNAME"] . ' user=' .$_ENV["DBUSER"] . ' password=' .$_ENV["DBPASS"] . '');


    $query = "SELECT ip FROM blocked where ip = '$visitor_ip'";
    $result = pg_query($query);
    if (!$result) {
        echo "Problem with query " . $query . "<br/>";
        echo pg_last_error();
        exit();
    }

    $blocked_list = pg_fetch_assoc($result); 
    if (!$blocked_list) {
        $vip = $visitor_ip;
        $vdate = date('m/d/Y h:i:s a', time());
        $vpath = $url_path;
        http_response_code(444);
        $sql = "INSERT INTO blocked (vip, vpath, vdate) VALUES ('$vip','$vpath', '$vdate')";
        
        $to      = 'test@domain.com';
        $subject = 'Blocked ip';
        $message = '$vip';
        $headers = 'From: webmaster@example.com' . "\r\n" .
        'Reply-To: webmaster@example.com' . "\r\n" .
        'X-Mailer: PHP/' . phpversion();

        mail($to, $subject, $message, $headers);
    }
    http_response_code(444);
   ?>
 </body>
</html>
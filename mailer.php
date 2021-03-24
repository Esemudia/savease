<?php
  $name =$_POST["txtname"];
$phone =$_POST["txtphone"];
$email =$_POST["txtmail"];
$message1 =$_POST["message"];

if($name=="" && $phone=="" && $email=="" && $message1=="")
{
    echo "Empty Values not accepted";
}
else {

    ini_set( 'display_errors', 1 );
    error_reporting( E_ALL );
    $from = "non-reply@fintech.com";
    $to = $email;
    $subject = "Activate";
    $message = $message1;
    $headers = "From:" . $from;
    if(mail($to,$subject,$message, $headers)) {
		echo "The email message was sent.";
    } else {
    	echo "The email message was not sent.";
    }
}
?>

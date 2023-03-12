<?php


session_start();

if(!isset($_SESSION["data"])) {
    
        header("Location: index.php");
        exit;
    
}



?> 
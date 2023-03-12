<?php

class c_koneksi{

    function koneksi(){

        $conn = mysqli_connect('localhost','root','','laundry1');

        // return $conn;

        if (!$conn) {
            die("Koneksi gagal: " . mysqli_connect_error());
        }else{
            return $conn;
        }
    }
}

?>
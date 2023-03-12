<?php
session_start();
include_once '../controllers/c_login.php';
//list user yang valid
//selain user ini tidak bisa login.
$list_user = [
    [
        'username' => 'ziy',
        'password' => '1'
    ],
    [
        'username' => 'edwin',
        'password' => '2'
    ],
    [
        'username' => 'andika',
        'password' => '3'
    ],
    
];


//dapatkan data user dari form
$user = [
    'username' => $_POST['username'],
    'password' => $_POST['password'],
];

//cocokan data user dengan list user yang valid.
//misalnya pakai looping saja.

$not_found = false;

foreach ($list_user as $key => $registered_user) {

    //login success
    if ($registered_user['username'] == $user['username']) {

        if ($registered_user['password'] == $user['password']) {

            $_SESSION['login'] = true;
            $_SESSION['username'] =  $user['username'];
            $_SESSION['message']  = 'Berhasil login ke dalam sistem.';

           
        } else {
            $_SESSION['error'] = 'Password anda salah';
            $not_found = true;
        }
    } else {
        $_SESSION['error'] = 'Password anda salah';
    }
}
if ($not_found == true) {
    header("Location: index.php.php");
}

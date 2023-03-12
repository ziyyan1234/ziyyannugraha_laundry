

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<form action="routers/r_login.php?aksi=login" method="POST" class="form login">

   <div class="box">
    <div class="container">

        <div class="top">
            
            <header>Login</header>
        </div>

        <div class="input-field">
            <input type="text" class="input" placeholder="username" id="username" name="username" required="required">
            <i class='bx bx-user' ></i>
        </div>

        <div class="input-field">
            <input type="Password" class="input" placeholder="password" id="password" name="password" required="required">
            <i class='bx bx-lock-alt'></i>
        </div>

        <div class="input-field">
            <input type="submit" class="submit" value="Login" id="" name="login">
        </div>

        
        </div>
    </div>
</div>  
</body>
</html>
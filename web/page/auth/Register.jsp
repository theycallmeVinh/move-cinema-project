<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css" />

        <!-- Main css -->
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <div class="main">
            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>
                            <form method="POST" class="register-form" id="register-form" action="register">
                                
                                <div class="form-group">
                                    <label for="fullName"><i class="zmdi zmdi-account-box"></i></label>
                                    <input type="text" name="fullName" id="fullName" placeholder="Full Name" required />
                                </div>
                                
                                <div class="form-group">
                                    <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="username" placeholder="Username" required />
                                </div>
                                
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Your Email" required />
                                </div>
                                
                                <div class="form-group">
                                    <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="password" placeholder="Password" required />
                                </div>
                                
                                <div class="form-group">
                                    <label for="confirmPassword"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required />
                                </div>
                                
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" checked />
                                    <label for="agree-term" class="label-agree-term">
                                        <span><span></span></span>I agree to all statements in
                                        <a href="#" class="term-service">Terms of service</a>
                                    </label>
                                </div>
                                <% 
                            String error = (String)request.getAttribute("error");
                            if (error != null) {
                                out.println("<p style='color:red;'>" + error + "</p>");
                            }
                                %>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <a href="#" class="signup-image-link">Welcome to CinePa</a>
                            <figure>
                                <img src="images/signup-image.jpg" alt="sign up image" />
                            </figure>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
    </body>
</html>

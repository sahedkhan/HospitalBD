<?php
session_start();
// remove all session variables
session_unset();

// destroy the session
session_destroy();
include_once('includes/header-auth.php');
include("api/config.php");

?>
<div class="header-bar">
    <div class="row ml-1">
        <a href="register.php"><i class="fa fa-arrow-left" style="font-size:16px;"></i> Sign up</a>
        <div class="col text-right"><a href="index.php">Home</a></div>
    </div>
</div>
<!-- Login Content -->
<div class="container-login">
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="my-4">
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="login-form">
<!--                                <div class="text-center">-->
<!--                                    <h1 class="h4 text-gray-900 mb-4">Login</h1>-->
<!--                                </div>-->
                                <form class="user" method="post" action="" id="loginForm" name="loginForm">
                                    <div class="form-group">
                                        <input type="email" name="email" class="form-control" id="exampleInputEmail"
                                               aria-describedby="emailHelp"
                                               placeholder="Enter Email Address">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" class="form-control"
                                               id="exampleInputPassword" placeholder="Password">
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" id="login-btn" class="btn btn-success btn-block">Login
                                        </button>
                                    </div>
                                    <div class="success" id="successMessage"></div>
                                    <div class="error login-error" id="errorMessage"></div>

                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="font-weight-bold small" href="register.php">Create an Account!</a>
                                </div>
                                <div class="text-center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php


include_once('includes/footer-auth.php');

?>

<script>
    $(function () {
        var loginform = $("#loginForm");

        loginform.validate({
            // Specify validation rules
            rules: {
                email: {
                    required: true
                },
                password: {
                    required: true
                }
            },
            // Specify validation error messages
            messages: {
                password: "Please provide your password",
                email: "Please enter email address"
            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function (loginform) {
                loginform.submit();
            }
        });
        $('#login-btn').click(function (e) {
            e.preventDefault();

            if (loginform.valid()) {
                $.ajax({
                    type: 'post',
                    url: 'api/login.php',
                    data: $('#loginForm').serialize(),
                    success: function (data, text) {
                        // var data = JSON.parse(data);
                        // alert(data);
                        if (data.status == 201) {
                            $("#errorMessage").html('');
                            $("#successMessage").html('Login Successful.');
                            $('#loginForm')[0].reset();
                            window.location.replace('<?php echo $base_url; ?>' + "index.php");
                        } else {
                            $("#successMessage").html('');
                            $("#errorMessage").html(data.msg);
                        }
                    },
                    error: function (request, status, error) {
                        console.log(request.responseText);
                        $("#errorMessage").html(request.responseText);
                    }
                });
            }

        });
    });
</script>

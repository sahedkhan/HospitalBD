<?php
session_start();
include("api/config.php");

if (isset($_SESSION['User'])){
    header('Location:' . $base_url . 'index.php');
    die();
}
include_once('includes/header-auth.php');


?>
<div class="header-bar"><a href="login.php"><i class="fa fa-arrow-left" style="font-size:18px;"></i> Login</a></div>
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
<!--                                    <h1 class="h4 text-gray-900 mb-4">Register</h1>-->
<!--                                </div>-->
                                <form method="post" action="" id="registerForm" name="registerForm">
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input type="text" name="name" class="form-control w-100" id="exampleInputFirstName"
                                               placeholder="Enter  Name">
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="email" name="email" class="form-control w-100" id="exampleInputEmail"
                                               aria-describedby="emailHelp"
                                               placeholder="Enter Email Address">
                                    </div>
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input type="text" name="phone" class="form-control w-100" id="exampleInputPhone"
                                               placeholder="Enter Phone number">
                                    </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input type="text" name="address" class="form-control w-100" id="exampleInputAddress"
                                               S
                                               placeholder="Enter Your Address">
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" name="password" id="password" class="form-control w-100"
                                               id="exampleInputPassword" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label>Repeat Password</label>
                                        <input type="password" name="confirmpassword" id="confirmpassword"
                                               class="form-control w-100" id="exampleInputPasswordRepeat"
                                               placeholder="Repeat Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Select Hospital</label>
                                        <select name="hospital_id" class="form-control w-100" id="hospital_id">
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" id="register-btn" class="btn btn-success btn-block">
                                            Register
                                        </button>
                                    </div>
                                    <div class="success" id="successMessage"></div>
                                    <div class="error" id="errorMessage"></div>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="font-weight-bold small" href="login.php">Already have an account?</a>
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


    $.get('api/hospital_list.php',  // url
        function (data, textStatus, jqXHR) {
            // console.log(data);
            // console.log(typeof data);
            var data = JSON.parse(data);
            // console.log('custom js', data)
            var hospital_list = data['hospital_list'];

            $("#hospital_id").empty();
            $("#hospital_id").append("<option value=''>--- Select Hospital ---</option>");

            for( var i = 0; i<hospital_list.length; i++){
                var id = hospital_list[i]['id'];
                var name = hospital_list[i]['name'];

                // For Registration form
                $("#hospital_id").append("<option value='"+id+"'>"+name+"</option>");

            }
        });

    $.validator.addMethod(
        "regex",
        function (value, element, regexp) {
            return this.optional(element) || regexp.test(value);
        },
        "Please check your input."
    );

    $(function () {
        var form = $("#registerForm");

        form.validate({
            // Specify validation rules
            rules: {
                // The key name on the left side is the name attribute
                // of an input field. Validation rules are defined
                // on the right side
                name: "required",
                // phone: "required",
                phone: {
                    required: true,
                    regex: /^(((\+|00)?880)|0)(\d){10}$/
                }, // As RegExp
                address: "required",
                hospital_id: "required",
                email: {
                    required: true,
                    // Specify that email should be validated
                    // by the built-in "email" rule
                    email: true
                },
                password: {
                    required: true,
                    minlength: 5
                },
                confirmpassword: {
                    minlength: 5,
                    equalTo: "#password"
                }
            },
            // Specify validation error messages
            messages: {
                name: "Please enter your firstname",
                phone: "Please enter a valid number",
                address: "Please enter your address",
                hospital_id: "Please select hospital",
                password: {
                    required: "Please provide a password",
                    minlength: "Your password must be at least 5 characters long"
                },
                email: "Please enter a valid email address"
            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function (form) {
                form.submit();
            }
        });
        $('#register-btn').click(function (e) {
            e.preventDefault();

            if (form.valid()) {
                $.ajax({
                    type: 'post',
                    url: 'api/registration.php',
                    data: $('#registerForm').serialize(),
                    success: function (data, text) {
                        var data = JSON.parse(data);
                        // console.log(data);
                        if (data.status == 201) {
                            $("#errorMessage").html('');
                            $("#successMessage").html('Your Request for registration is Successful. Please wait for admin approval !!');
                            setTimeout(function () {
                                window.location.replace('<?php echo $base_url; ?>' + "login.php");
                            }, 2000);

                            $('#registerForm')[0].reset();

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



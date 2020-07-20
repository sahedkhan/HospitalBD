<?php
session_start();
if(empty($_SESSION['User']) || $_SESSION['User'] == ''){
    header("Location: http://192.168.64.2/hospital/login.php");
    die();
}
include_once('includes/header-auth.php');

//$current_url= "http://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];
?>
<style>
    input{
        height: 30px !important;
    }
</style>
    <div class="header-bar">
        <div class="row">
            <div class="col"><a href="index.php" id="hospital_name"></a></div>
        </div>
    </div>
    <div id="content">
        <div class="container-fluid mt-1 pl-1 pr-1" id="container-wrapper">
            <div class="form-group row hospital-detials-table">
                <div class="d-flex flex-row pl-2 pr-2 w-100">
                    <div class="p-2 hospital-cabin-title">&nbsp;</div>
                    <div class="p-2 hospital-normal">Non Covid</div>
                    <div class="p-2 hospital-covid">Covid</div>
                </div>
                <div class="d-flex flex-row p-2  w-100">
                    <div class="p-2 hospital-cabin-title" style="width: 40%">Normal Bed</div>
                    <input type="number" min="1" class="p-2 mr-2 hospital-normal" id="normal_normal" value="1">
                    <input type="number" class="p-2 hospital-covid" id="covid_normal" value="1">
                </div>
                <div class="d-flex flex-row p-2  w-100">
                    <div class="p-2 hospital-cabin-title">Special Bed</div>
                    <input type="number" class="p-2 mr-2 hospital-normal" id="normal_special" value="1">
                    <input type="number" class="p-2 hospital-covid" id="covid_special" value="1">
                </div>
                <div class="d-flex flex-row p-2  w-100">
                    <div class="p-2 hospital-cabin-title">VIP Bed</div>
                    <input type="number" class="p-2 mr-2 hospital-normal" id="normal_vip" value="1">
                    <input type="number" class="p-2 hospital-covid" id="covid_vip" value="1">
                </div>
                <div class="d-flex flex-row p-2  w-100">
                    <div class="p-2 hospital-cabin-title">ICU Bed</div>
                    <input type="number" class="p-2 mr-2 hospital-normal" id="normal_icu" value="1">
                    <input type="number" class="p-2 hospital-covid" id="covid_icu" value="1">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 mb-4">
                    <div class="table-responsive hospital-detials-table">
                        <table class="table font-size-12 text-center" id="hospital_details">
                            <thead class="thead-light">
                            <tr>
                                <th>Non Covid</th>
                                <th>Covid</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div id="layout_for_call"></div>

            <div class="row">
                <div class="col text-center">
                    <button id="update_cabin" class="btn btn-success">Update</button>
                </div>
            </div>

            <div class="success text-center" id="successMessage"></div>
            <div class="error text-center" id="errorMessage"></div>
            <br><br>

            <!--Row-->

        </div>
        <!---Container Fluid-->
    </div>

<?php

include_once('includes/footer-auth.php');


?>

<script>
    $(document).ready(function(){
        var normal_cabin_id = '';
        var covid_cabin_id = '';

        $.ajax({
            type: 'POST',
            url: 'api/hospital_details.php',
            data: 'hospital_id=' + <?php echo $_GET['id']; ?>,
            success: function (data) {
                var data = JSON.parse(data);
                console.log(data);
                var cabin_details = data.hospital_detials.cabin_detials;

                $("#hospital_name").html('<i class="fa fa-arrow-left" style="font-size:18px;"></i> '+data.hospital_detials.name+'(Update)');


                // Details for table  . . .
                var c_total_no_cabin = 0;
                var c_total_no_space_cabin = 0;
                var c_no_normal_cabin = 0;
                var c_current_space_normal = 0
                var c_no_special_cabin = 0;
                var c_no_icu_cabin = 0;
                var c_current_space_special = 0
                var c_no_vip_cabin = 0;
                var c_current_space_vip = 0;
                var c_current_space_icu = 0;

                for( var i = 0; i<cabin_details.length; i++){
                    if (cabin_details[i]['cabin_type'] == 'Normal'){
                        normal_cabin_id = cabin_details[i]['cabin_id'];
                        console.log('normal_cabin_id ', normal_cabin_id);
                        // console.log(normal_cabin_id);
                        var n_total_no_cabin = cabin_details[i]['total_no_cabin'];
                        var n_total_no_space_cabin = cabin_details[i]['total_no_space_cabin'];
                        var n_no_normal_cabin = cabin_details[i]['no_normal_cabin'];
                        var n_current_space_normal = cabin_details[i]['current_space_normal'];
                        var n_no_special_cabin = cabin_details[i]['no_special_cabin'];
                        var n_no_icu_cabin = cabin_details[i]['no_icu_cabin'];
                        var n_current_space_special = cabin_details[i]['current_space_special'];
                        var n_no_vip_cabin = cabin_details[i]['no_vip_cabin'];
                        var n_current_space_vip = cabin_details[i]['current_space_vip'];
                        var n_current_space_icu = cabin_details[i]['current_space_icu'];
                    }
                    else if (cabin_details[i]['cabin_type'] == 'Covid'){
                        covid_cabin_id = cabin_details[i]['cabin_id'];
                        console.log('covid_cabin_id ', covid_cabin_id);
                        c_total_no_cabin = cabin_details[i]['total_no_cabin'];
                        c_total_no_space_cabin = cabin_details[i]['total_no_space_cabin'];
                        c_no_normal_cabin = cabin_details[i]['no_normal_cabin'];
                        c_current_space_normal = cabin_details[i]['current_space_normal'];
                        c_no_special_cabin = cabin_details[i]['no_special_cabin'];
                        c_no_icu_cabin = cabin_details[i]['no_icu_cabin'];
                        c_current_space_special = cabin_details[i]['current_space_special'];
                        c_no_vip_cabin = cabin_details[i]['no_vip_cabin'];
                        c_current_space_vip = cabin_details[i]['current_space_vip'];
                        c_current_space_icu = cabin_details[i]['current_space_icu'];
                    }

                }

                // For input field fillable . . .
                $('#normal_normal').val(n_current_space_normal);
                $('#covid_normal').val(c_current_space_normal);
                $('#normal_special').val(n_current_space_special);
                $('#covid_special').val(c_current_space_special);
                $('#normal_vip').val(n_current_space_vip);
                $('#covid_vip').val(c_current_space_vip);
                $('#normal_icu').val(n_current_space_icu);
                $('#covid_icu').val(c_current_space_icu);

                // For Hospital details
                $("#hospital_details tbody").append("<tr>\n" +
                    "                                <td>Total: "+n_total_no_cabin+" (Free: "+n_total_no_space_cabin+")</td>\n" +
                    "                                <td>Total: "+c_total_no_cabin+" (Free: "+c_total_no_space_cabin+")</td>\n" +
                    "                            </tr>\n" +
                    "                            <tr>\n" +
                    "                                <td>Normal: "+n_no_normal_cabin+" (Free: "+n_current_space_normal+")</td>\n" +
                    "                                <td>Normal: "+c_no_normal_cabin+" (Free: "+c_current_space_normal+")</td>\n" +
                    "                            </tr>\n" +
                    "                            <tr>\n" +
                    "                                <td>Special: "+n_no_special_cabin+" (Free: "+n_current_space_special+")</td>\n" +
                    "                                <td>Special: "+c_no_special_cabin+" (Free: "+c_current_space_special+")</td>\n" +
                    "                            </tr>\n" +
                    "                                <td>VIP: "+n_no_vip_cabin+" (Free: "+n_current_space_vip+")</td>\n" +
                    "                                <td>VIP: "+c_no_vip_cabin+" (Free: "+c_current_space_vip+")</td>\n" +
                    "                            </tr>\n" +
                    "                                <td>ICU: "+n_no_icu_cabin+" (Free: "+n_current_space_icu+")</td>\n" +
                    "                                <td>ICU: "+c_no_icu_cabin+" (Free: "+c_current_space_icu+")</td>\n" +
                    "                            </tr>");
            },
            error: function (request, status, error) {
                console.log(request.responseText);
                $("#errorMessage").html(request.responseText);
            }
        });


        $('#update_cabin').click(function (e) {
            e.preventDefault();

            var normal_normal = $('#normal_normal').val();
            var covid_normal = $('#covid_normal').val();
            var normal_special = $('#normal_special').val();
            var covid_special = $('#covid_special').val();
            var normal_vip = $('#normal_vip').val();
            var covid_vip = $('#covid_vip').val();
            var normal_icu = $('#normal_icu').val();
            var covid_icu = $('#covid_icu').val();

            var formData1 = new FormData();
            formData1.append('cabin_id', normal_cabin_id);
            formData1.append('normal', normal_normal);
            formData1.append('special', normal_special);
            formData1.append('vip', normal_vip);
            formData1.append('icu', normal_icu);

            var formData2 = new FormData();
            formData2.append('cabin_id', covid_cabin_id);
            formData2.append('normal', covid_normal);
            formData2.append('special', covid_special);
            formData2.append('vip', covid_vip);
            formData2.append('icu', covid_icu);

            // console.log(...formData1);
            // console.log(...formData2);

            $.ajax({
                type: 'post',
                url: 'api/cabin_space_update.php',
                data: formData1,
                processData: false,
                contentType: false,
                success: function (data, text) {
                    var data = JSON.parse(data);
                    console.log(data);
                    if (data.status == 201) {
                        // console.log(data.status);
                        $("#errorMessage").html('');
                        $("#successMessage").html('Updated Successfully.');

                          setTimeout(function(){ location.reload(); }, 2000);

                    } else {
                        $("#successMessage").html('');
                        $("#errorMessage").html(data.msg);
                    }
                },
                error: function (request, status, error) {
                    console.log(request.responseText);
                    // $("#errorMessage").html(request.responseText);
                }
            });

            // for updating covid cabin. . .
            if (covid_cabin_id != ''){
                $.ajax({
                    type: 'post',
                    url: 'api/cabin_space_update.php',
                    data: formData2,
                    processData: false,
                    contentType: false,
                    success: function (data, text) {
                        var data = JSON.parse(data);
                        if (data.status == 201) {
                            $("#errorMessage").html('');
                            $("#successMessage").html('Updated Successfully.');
                        } else {
                            $("#successMessage").html('');
                            $("#errorMessage").html(data.msg);
                        }
                    },
                    error: function (request, status, error) {
                        // console.log(request.responseText);
                        // $("#errorMessage").html(request.responseText);
                    }
                });
            }


        });



    });

</script>

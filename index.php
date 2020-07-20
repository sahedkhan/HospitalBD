<?php
session_start();
if (isset($_SESSION['User'])){
    $session = $_SESSION['User'];
    $hospital_id = $session['hospital_id'];
    $role_id = $session['role'];
}else{
    $hospital_id = '';
    $role_id = '';
}
?>
<?php

include_once('includes/header-auth.php');


?>
<div class="header-bar">
    <div class="row">
        <div class="col"><a href="index.php">Home</a></div>
        <?php
        if (empty($hospital_id)){
        ?>
<!--            <div class="col text-right"><a href="login.php">Login</a></div>-->
        <?php
        }else{
            ?>
            <div class="col text-right"><a href="login.php">Logout</a></div>
            <?php
        }
        ?>
    </div>
</div>

<div id="content">

    <!-- Topbar -->
    <!-- Container Fluid-->
    <div class="container-fluid pl-1 pr-1" id="container-wrapper">

        <div class="row">
            <div class="col-lg-12 mb-4">
                <?php
                if (empty($hospital_id)) {
                ?>
                <div class="form-group">
                    <select name="location_search" class="form-control mt-3" id="location_search">

                    </select>
                </div>
                <?php
                }
                ?>
                <div class="table-responsive">
                    <table class="table text-center table-bordered" id="hospital_list">
                        <thead class="thead-light">
                        <tr>
                            <th width="35%">Name</th>
                            <th width="30%">Non Covid Beds</th>
                            <th width="35%">Covid Beds</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
        <!--Row-->

    </div>
    <!---Container Fluid-->
</div>

<?php

include_once('includes/footer-auth.php');


?>


<script>
    $.get('api/location_list.php',  // url
        function (data, textStatus, jqXHR) {  // success callback
            var data = JSON.parse(JSON.stringify(data));
            // console.log(data);
            var location_list = data.location_list;
            var len = location_list.length;

            $("#location_search").empty();
            $("#location_search").append("<option value=''>--- Select Location ---</option>");

            for( var i = 0; i<len; i++){
                var location = location_list[i]['location'];

                // For Location search
                $("#location_search").append("<option value='"+location+"'>"+location+"</option>");
            }
        });


    function details_admin(id) {
        window.location="hospitals_details_admin.php?id="+id;
    }
    function details(id) {
        window.location="hospitals_details.php?id="+id;
    }

    $.get('api/hospital_list.php',  // url
        function (data, textStatus, jqXHR) {  // success callback
            var data = JSON.parse(JSON.stringify(data));;
            console.log(data);
            var hospital_list = data.hospital_list;
            console.log(hospital_list);
            var hospital_id = '<?php echo $hospital_id; ?>';
            var role_id = '<?php echo $role_id; ?>';
            var last_updated_time = '';

            if (hospital_id && role_id == 1){
                hospital_list = hospital_list.filter(function (el) {
                    return el.id == hospital_id;
                });
            }else {
                hospital_list = hospital_list;
            }

            $("#hospital_id").empty();
            $("#hospital_id").append("<option value=''>--- Select Hospital ---</option>");

            for( var i = 0; i<hospital_list.length; i++){
                var id = hospital_list[i]['id'];
                var name = hospital_list[i]['name'];
                var details = hospital_list[i]['cabin_detials'];

                var non_covid_total_free = 0;
                var non_covid_normal_free = 0;
                var non_covid_special_free = 0;
                var non_covid_vip_free = 0;
                var non_covid_icu_free = 0;
                var non_covid_l = 'Not Available';

                var covid_total_free = 0;
                var covid_normal_free = 0;
                var covid_special_free = 0;
                var covid_vip_free = 0;
                var covid_icu_free = 0;
                var covid_l = 'Not Available';
                for (var j = 0; j<details.length; j++){
                    if (details[j]['cabin_type'] == 'Normal') {
                        non_covid_total_free = details[j]['space_total'];
                        non_covid_normal_free = details[j]['space_normal'];
                        non_covid_special_free = details[j]['space_special'];
                        non_covid_vip_free = details[j]['space_vip'];
                        non_covid_icu_free = details[j]['space_icu'];
                        last_updated_time = details[j]['last_updated'];
                        last_updated_time = last_updated_time.split(' ')[0];
                        non_covid_l = '<p class="margin_0"><span class="bed_type">Total Beds:  </span><span class="bed_number">'+non_covid_total_free+'</span></p>' +
                            '<p class="margin_0"><span class="bed_type">Free Normal: </span><span class="bed_number"> '+non_covid_normal_free+'</span></p>' +
                            '<p class="margin_0"><span class="bed_type">Free Special: </span><span class="bed_number"> '+non_covid_special_free+'</span></p>' +
                            '<p class="margin_0"><span class="bed_type">Free VIP: </span><span class="bed_number"> '+non_covid_vip_free+'</span></p>' +
                            '<p class="margin_0"><span class="bed_type">Free ICU: </span><span class="bed_number"> '+non_covid_icu_free+'</span></p>';

                    }else if (details[j]['cabin_type'] == 'Covid'){
                        covid_total_free = details[j]['space_total'];
                        covid_normal_free = details[j]['space_normal'];
                        covid_special_free = details[j]['space_special'];
                        covid_vip_free = details[j]['space_vip'];
                        covid_icu_free = details[j]['space_icu'];
                        covid_l = '<p class="margin_0"><span class="bed_type">Total Beds: </span><span class="bed_number"> '+covid_total_free+'</span></p>' +
                            '<p class="margin_0"><span class="bed_type">Free Normal: </span><span class="bed_number"> '+covid_normal_free+'</span></p>' +
                            '<p class="margin_0"><span class="bed_type">Free Special: </span><span class="bed_number"> '+covid_special_free+'</span></p>' +
                            '<p class="margin_0"><span class="bed_type">Free VIP: </span><span class="bed_number"> '+covid_vip_free+'</span></p>' +
                            '<p class="margin_0"><span class="bed_type">Free ICU: </span><span class="bed_number"> '+covid_icu_free+'</span></p>';
                    }
                }

                // For Registration form
                $("#hospital_id").append("<option value='"+id+"'>"+name+"</option>");

                // For Hospital List
                if (hospital_id){
                    $("#hospital_list tbody").append("<tr onclick='details_admin("+id+")'><td class='fr-1'><p class='margin_0'>"+name+"</p><p class='margin_0 last_updated'>Last Updated: "+last_updated_time+"</p></td><td>"+non_covid_l+"</td><td>"+covid_l+" <a href='#'><i class='fas fa-angle-right text-success ml-2'></i></a></td></tr>");
                }else{
                    $("#hospital_list tbody").append("<tr onclick='details("+id+")'><td class='fr-1'><p class='margin_0'>"+name+"</p><p class='margin_0 last_updated'>Last Updated: "+last_updated_time+"</p></td><td>"+non_covid_l+"</td><td>"+covid_l+" <a href='#'><i class='fas fa-angle-right text-success ml-2'></i></a></td></tr>");
                }

            }
        });


    $('#location_search').change(function (e) {
        e.preventDefault();
        var location_name = $('#location_search').val();
        console.log(location_name);

        $.ajax({
            type: 'POST',
            url: 'api/location_wise_hospital.php',
            data: 'location_name=' + location_name,
            success: function (data) {
                var data = JSON.parse(data);
                var hospital_list = data.hospital_list;
                console.log(hospital_list);
                var last_updated_time = '';

                $("#hospital_list tbody").empty();

                for( var i = 0; i<hospital_list.length; i++){
                    var id = hospital_list[i]['id'];
                    var name = hospital_list[i]['name'];
                    var details = hospital_list[i]['cabin_detials'];
                    var non_covid_total_free = 0;
                    var non_covid_normal_free = 0;
                    var non_covid_special_free = 0;
                    var non_covid_vip_free = 0;
                    var non_covid_icu_free = 0;
                    var non_covid_l = 'Not Available';

                    var covid_total_free = 0;
                    var covid_normal_free = 0;
                    var covid_special_free = 0;
                    var covid_vip_free = 0;
                    var covid_icu_free = 0;
                    var covid_l = 'Not Available';
                    for (var j = 0; j<details.length; j++){
                        if (details[j]['cabin_type'] == 'Normal') {
                            non_covid_total_free = details[j]['space_total'];
                            non_covid_normal_free = details[j]['space_normal'];
                            non_covid_special_free = details[j]['space_special'];
                            non_covid_vip_free = details[j]['space_vip'];
                            non_covid_icu_free = details[j]['space_icu'];
                            last_updated_time = details[j]['last_updated'];
                            last_updated_time = last_updated_time.split(' ')[0];
                            non_covid_l = '<p class="margin_0"><span class="bed_type">Total Beds:  </span><span class="bed_number">'+non_covid_total_free+'</span></p>' +
                                '<p class="margin_0"><span class="bed_type">Free Normal: </span><span class="bed_number"> '+non_covid_normal_free+'</span></p>' +
                                '<p class="margin_0"><span class="bed_type">Free Special: </span><span class="bed_number"> '+non_covid_special_free+'</span></p>' +
                                '<p class="margin_0"><span class="bed_type">Free VIP: </span><span class="bed_number"> '+non_covid_vip_free+'</span></p>' +
                                '<p class="margin_0"><span class="bed_type">Free ICU: </span><span class="bed_number"> '+non_covid_icu_free+'</span></p>';

                        }else if (details[j]['cabin_type'] == 'Covid'){
                            covid_total_free = details[j]['space_total'];
                            covid_normal_free = details[j]['space_normal'];
                            covid_special_free = details[j]['space_special'];
                            covid_vip_free = details[j]['space_vip'];
                            covid_icu_free = details[j]['space_icu'];
                            covid_l = '<p class="margin_0"><span class="bed_type">Total Beds: </span><span class="bed_number"> '+covid_total_free+'</span></p>' +
                                '<p class="margin_0"><span class="bed_type">Free Normal: </span><span class="bed_number"> '+covid_normal_free+'</span></p>' +
                                '<p class="margin_0"><span class="bed_type">Free Special: </span><span class="bed_number"> '+covid_special_free+'</span></p>' +
                                '<p class="margin_0"><span class="bed_type">Free VIP: </span><span class="bed_number"> '+covid_vip_free+'</span></p>' +
                                '<p class="margin_0"><span class="bed_type">Free ICU: </span><span class="bed_number"> '+covid_icu_free+'</span></p>';
                        }
                    }

                    // For Hospital List
                    $("#hospital_list tbody").append("<tr onclick='details("+id+")'><td><p class='margin_0'>"+name+"</p><p class='margin_0 last_updated'>Last Updated: "+last_updated_time+"</p></td><td>"+non_covid_l+"</td><td>"+covid_l+" <a href='#'><i class='fas fa-angle-right text-success ml-2'></i></a></td></tr>");


                }
            },
            error: function (request, status, error) {
                console.log(request.responseText);
                $("#errorMessage").html(request.responseText);
            }
        });


    });

</script>

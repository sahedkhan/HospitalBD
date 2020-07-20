<?php

include_once('includes/header-auth.php');


?>
    <div class="header-bar">
        <div class="row">
            <div class="col"><a href="index.php" id="hospital_name"></a></div>
        </div>
    </div>
    <div id="content">
        <div class="container-fluid mt-1 pl-1 pr-1" id="container-wrapper">

            <div class="row">
                <div class="col-lg-12 mb-4">
                    <div class="table-responsive">
                        <table class="table text-center" id="hospital_details">
                            <thead class="thead-light">
                            <tr>
                                <th>Non Covid Beds</th>
                                <th>Covid Beds</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div id="layout_for_call"></div>

            <!--Row-->

        </div>
        <!---Container Fluid-->
    </div>

<?php

include_once('includes/footer-auth.php');


?>

<script>
    $(document).ready(function(){
        $.ajax({
            type: 'POST',
            url: 'api/hospital_details.php',
            data: 'hospital_id=' + <?php echo $_GET['id']; ?>,
            success: function (data) {
                var data = JSON.parse(data);
                var cabin_details = data.hospital_detials.cabin_detials;

                $("#hospital_name").html('<i class="fa fa-arrow-left" style="font-size:18px;"></i> '+data.hospital_detials.name);

                var phone = data.hospital_detials.phone.split(',');
                for (let k = 0; k < phone.length; k++){
                    $("#layout_for_call").append("<div class=\"row mt-2\">\n" +
                        "                <div class=\"col-md-12 text-center\"><i class=\"fa fa-phone mr-2\" aria-hidden=\"true\"></i> "+phone[k]+" <a class=\"btn btn-info btn-sm ml-2\" href=\"tel:"+phone[k]+"\"> Call</a>\n" +
                        "                </div>\n" +
                        "            </div>");
                }

                var nclass_name = '';
                var cclass_name = '';
                var n_total_no_cabin = 0;
                var n_total_no_space_cabin = 0;
                var n_total_no_admitted_cabin = 0;
                var c_total_no_cabin = 0;
                var c_total_no_space_cabin = 0;
                var c_total_no_admitted_cabin = 0;
                // Details for table  . . .
                for( var i = 0; i<cabin_details.length; i++){
                    if (cabin_details[i]['cabin_type'] === 'Normal'){
                        n_total_no_cabin = cabin_details[i]['total_no_cabin'];
                        n_total_no_space_cabin = cabin_details[i]['total_no_space_cabin'];
                        n_total_no_admitted_cabin = cabin_details[i]['total_no_admitted_cabin'];
                    }
                    else if (cabin_details[i]['cabin_type'] === 'Covid'){
                        c_total_no_cabin = cabin_details[i]['total_no_cabin'];
                        c_total_no_space_cabin = cabin_details[i]['total_no_space_cabin'];
                        c_total_no_admitted_cabin = cabin_details[i]['total_no_admitted_cabin'];
                    }

                    if (n_total_no_space_cabin > 0){
                        nclass_name = 'text-success';
                    }else{
                        nclass_name = 'text-danger';
                    }

                    if (c_total_no_space_cabin > 0){
                        cclass_name = 'text-success';
                    }else{
                        cclass_name = 'text-danger';
                    }
                }

                // For Hospital details
                $("#hospital_details tbody").append("<tr>\n" +
                    "                                <td>Total: "+n_total_no_cabin+"</td>\n" +
                    "                                <td>Total: "+c_total_no_cabin+"</td>\n" +
                    "                            </tr>\n" +
                    "                            <tr>\n" +
                    "                                <td>Booked: "+n_total_no_admitted_cabin+"</td>\n" +
                    "                                <td>Booked: "+c_total_no_admitted_cabin+"</td>\n" +
                    "                            </tr>" +
                    "                            <tr>\n" +
                    "                                <td><span class="+nclass_name+">Free: "+n_total_no_space_cabin+"</span></td>\n" +
                    "                                <td><span class="+cclass_name+">Free: "+c_total_no_space_cabin+"</span></td>\n" +
                    "                            </tr>\n");
            },
            error: function (request, status, error) {
                console.log(request.responseText);
                $("#errorMessage").html(request.responseText);
            }
        });


    });

</script>

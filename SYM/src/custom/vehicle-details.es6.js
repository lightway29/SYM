$(function() {
    /**
     * Validate Vehicle Details form.
     */

    var $valuation = $('#valueM');
    var $makeSelectField = $('#make');
    var $modelSelectField = $('#model');
    var $fuelSelectField = $('#fuel');
    var $yearSelectField = $('#year');

    window.makeSelectField = $makeSelectField;
    window.modelSelectField = $modelSelectField;
    window.fuelSelectField = $fuelSelectField;
    window.yearSelectField = $yearSelectField;

    var resetSelectField = function(selector) {
        var $field = $(selector);
        $field.children(':selected').prop('selected', false);
    }

    var resetSelectFields = function(fields) {
        $.each(fields, function(fields, field) {
            resetSelectField(field);
        });

        // Clear valuation as well.
        $valuation.val('');
    }

    $(".selectpicker").selectpicker();

    $makeSelectField.on('change', function() {
        var a = {
            v_make: $(this).val()
        };
        var b = "http://" + window.location.host + "/vehicleDetails/getVehicleModel";

        $.ajax({
            type: "post",
            url: b,
            data: a,
            dataType: "json",
            cache: false,
            success: function(a) {
                var b = "";

                if (jQuery.isEmptyObject(a)) {
                    alert("no vehicles from this make");

                    b = '<option value="">Select Model</option>';
                    $("#model").html(b).attr("disabled", true);

                    b = '<option value="">Select Fuel Type</option>';
                    $("#fuel").html(b).attr("disabled", true);

                    b = '<option value="">Select Year</option>';
                    $("#year").html(b).attr("disabled", true);

                    document.getElementById("valueM").value = "";
                    $("#valueM").attr("disabled", true);
                } else {
                    /**
                     * Reset all proceeding fields.
                     */
                    resetSelectFields(
                        [
                            window.modelSelectField,
                            window.fuelSelectField,
                            window.yearSelectField
                        ]
                    )

                    b += '<option value="">Select Model</option>';
                    $.each(a, function(a, c) {
                        b += '<option value="' + c.id + '">' + c.vehicleModel + "</option>";
                    });

                    $("#model").html(b).attr("disabled", false);
                }
            }
        });
    });

    $("#model").change(function() {
        var a = {
            v_model: $(this).val()
        };
        var b = "http://" + window.location.host + "/vehicleDetails/getVehicleFuel";

        $.ajax({
            type: "post",
            url: b,
            data: a,
            dataType: "json",
            cache: false,
            success: function(a) {
                var b = "";
                if (jQuery.isEmptyObject(a)) {
                    b = '<option value="">Select Fuel Type</option>';
                    $("#fuel").html(b).attr("disabled", true);

                    b = '<option value="">Select Year</option>';
                    $("#year").html(b).attr("disabled", true);

                    document.getElementById("valueM").value = "";
                    $("#valueM").attr("disabled", true);
                } else {
                    /**
                     * Reset all proceeding fields.
                     */
                    resetSelectFields(
                        [
                            window.fuelSelectField,
                            window.yearSelectField
                        ]
                    )

                    b += '<option value="">Select Fuel Type</option>';

                    $.each(a, function(a, c) {
                        b += '<option value="' + c.id + '">' + c.name + "</option>";
                    });

                    $("#fuel").html(b).attr("disabled", false);
                }
            }
        });
    });

    $("#fuel").change(function() {
        var a = {
            v_model: document.getElementById("model").value,
            fuel_type: $(this).val()
        };

        var b = "http://" + window.location.host + "/vehicleDetails/getVehicleYear";

        $.ajax({
            type: "post",
            url: b,
            data: a,
            dataType: "json",
            cache: false,
            success: function(a) {
                var b = "";

                if (jQuery.isEmptyObject(a)) {
                    b = '<option value="">Select Year</option>';
                    $("#year").html(b).attr("disabled", true);

                    document.getElementById("valueM").value = "";
                    $("#valueM").attr("disabled", true);
                } else {
                    /**
                     * Reset all proceeding fields.
                     */
                    resetSelectFields(
                        [
                            window.yearSelectField
                        ]
                    )

                    b += '<option value="">Select Year</option>';

                    $.each(a, function(a, c) {
                        b += '<option value="' + c.year + '">' + c.year + "</option>";
                    });

                    $("#year").html(b).attr("disabled", false);
                }
            }
        });
    });

    $("#year").change(function() {
        var a = {
            v_model: document.getElementById("model").value,
            fuel_type: document.getElementById("fuel").value,
            year: $(this).val()
        };

        var b = "http://" + window.location.host + "/vehicleDetails/getVehicleValue";

        $.ajax({
            type: "post",
            url: b,
            data: a,
            dataType: "json",
            cache: false,
            success: function(a) {
                var b = "";
                if (jQuery.isEmptyObject(a)) {
                    document.getElementById("valueM").value = "";
                    document.getElementById("oriValue").value = "";

                    $("#valueM").attr("disabled", false);
                } else {
                    document.getElementById("valueM").value = thousandSeparato(a[0].valivation);
                    document.getElementById("oriValue").value = a[0].valivation;

                    $("#valueM").attr("disabled", false);
                }
            }
        });
    });
});

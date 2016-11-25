(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
'use strict';

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

console.log('ES6 hello!');

var PersonDetail = function PersonDetail() {
  _classCallCheck(this, PersonDetail);

  var $submitButton = $('#form-submit');
  this.$formSubmitButton = $submitButton;
  this.emailRequiredText = "Please enter an email address.";
  this.emailFormatText = "Your email address must be in the format of name@domain.com.";
  this.nameInvalidChars = "Your name may only contain letters and spaces.";
  this.phoneInvalidChars = "Your phone number may only contain a combination of digits, +, -, (, ), and spaces.";
  this.submitted = false;
};

$(function () {
  if ($.validator) {
    /**
     * Extend our validation for name.
     * @return boolean
     */
    $.validator.addMethod('nameRegEx', function (value, element) {
      return this.optional(element) || !/[^A-Za-z\-\ ]/.test(value);
    });

    /**
     * Validate phone numbers.
     * @return boolean
     */
    $.validator.addMethod('phoneRegEx', function (value, element) {
      return this.optional(element) || !/[^\d\+\(\)\- ]+/.test(value);
    });
  }

  console.log(new PersonDetail());
});

},{}],2:[function(require,module,exports){
'use strict';

$(function () {
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

    var resetSelectField = function resetSelectField(selector) {
        var $field = $(selector);
        $field.children(':selected').prop('selected', false);
    };

    var resetSelectFields = function resetSelectFields(fields) {
        $.each(fields, function (fields, field) {
            resetSelectField(field);
        });

        // Clear valuation as well.
        $valuation.val('');
    };

    $(".selectpicker").selectpicker();

    $makeSelectField.on('change', function () {
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
            success: function success(a) {
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
                    resetSelectFields([window.modelSelectField, window.fuelSelectField, window.yearSelectField]);

                    b += '<option value="">Select Model</option>';
                    $.each(a, function (a, c) {
                        b += '<option value="' + c.id + '">' + c.vehicleModel + "</option>";
                    });

                    $("#model").html(b).attr("disabled", false);
                }
            }
        });
    });

    $("#model").change(function () {
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
            success: function success(a) {
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
                    resetSelectFields([window.fuelSelectField, window.yearSelectField]);

                    b += '<option value="">Select Fuel Type</option>';

                    $.each(a, function (a, c) {
                        b += '<option value="' + c.id + '">' + c.name + "</option>";
                    });

                    $("#fuel").html(b).attr("disabled", false);
                }
            }
        });
    });

    $("#fuel").change(function () {
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
            success: function success(a) {
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
                    resetSelectFields([window.yearSelectField]);

                    b += '<option value="">Select Year</option>';

                    $.each(a, function (a, c) {
                        b += '<option value="' + c.year + '">' + c.year + "</option>";
                    });

                    $("#year").html(b).attr("disabled", false);
                }
            }
        });
    });

    $("#year").change(function () {
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
            success: function success(a) {
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

},{}]},{},[1,2]);

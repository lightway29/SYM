/*
 * GET users listing.
 */

var validator = require('validator');


module.exports = function(router){

    //localhost:3000/auth
    router.post('/', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(validateFormCar(req.body.VProvince,req.body.VLetters,req.body.VNumber,req.body.VType)){
            req.getConnection(function (err, connector) {

                var vehicle_quotation;

                vehicle_quotation                       = req.session;
                vehicle_quotation.id                    = Math.random();
                vehicle_quotation.vehicleDetails        =true;
                vehicle_quotation.vehiclePersonal       =false;
                vehicle_quotation.vehicleInsurance      =false;
                vehicle_quotation.vehicleQuotation      =false;
                vehicle_quotation.furtherVehicleDetails =false;
                vehicle_quotation.shippingDetails       =false;

                var data = {

                    v_province              :   input.VProvince,
                    v_letters               :   input.VLetters,
                    v_number                :   covertAlphaInToUpperCase(input.VNumber),
                    insurance_quotation_id  :   vehicle_quotation.id,
                    type_v                  :   input.VType

                };

                var updateData={

                    v_province  :   input.VProvince,
                    v_letters   :   input.VLetters,
                    v_number    :   input.VNumber,
                    type_v      :   input.VType
                };

                var query = connector.query('INSERT INTO insurance_quotation set ? ON DUPLICATE KEY UPDATE ?', [data,updateData], function (err, rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }

                    res.redirect('/vehicleDetails');

                });

                // console.log(query.sql); get raw query

            });
        }else{
            res.redirect('/');
        }



    });

}

function  covertAlphaInToUpperCase(str) {
    var parts=str.match(/[a-z]+|\d+/ig);

    for (var index = 0; index < parts.length; ++index) {

        if(validator.isAlpha(parts[index])){
            parts[index]=parts[index].toUpperCase();
        }

    }

    return parts.join("");


}

function validateFormCar(Province,Letter,Number,VType) {

    return (validator.isAlpha(Province)
        && validator.isByteLength(Province,{min:2,max:2})
        && validator.isUppercase(Province)
        && validator.isAlphanumeric(Letter)
        && validator.isByteLength(Letter,{min:2,max:3})
        && validator.isNumeric(Number)
        && validator.isByteLength(Number,{min:4,max:4})
        && validator.isInt(VType,{min:1,max:3})

    );


}




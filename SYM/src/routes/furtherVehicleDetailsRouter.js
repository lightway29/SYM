/**
 * Created by menakafernando on 12/10/2016.
 */
var validator = require('validator');

module.exports = function(router){

    //localhost:3000/auth
    router.get('/:id', function(req, res){

        if(req.session.vehiclePersonal && req.session.vehicleDetails && req.session.vehicleInsurance && req.session.vehicleQuotation && req.session.furtherVehicleDetails ){
            if(InsurnceIDValidation(req.params.id)){
                req.getConnection(function (err, connector) {

                    var shipping_method_query = connector.query('SELECT * FROM shipping_method', function (err, shipping_method_rows) {

                        if (err) {
                            console.log('Error Selecting : %s ', err);
                        }

                        var insuranceQuotation = connector.query('SELECT * FROM insurance_quotation WHERE insurance_quotation_id=?', req.session.id, function (err, insuranceQuotationRow) {
                            var insuranceValue = insuranceQuotationRow[0].value;

                            //console.log("param id =" +req.params.id);

                            var quotationValue = connector.query("SELECT * FROM insurance_companies WHERE  id="+req.params.id, function (err, equationRows) {

                                var insuranceCompanyValue = ((( equationRows[0].calculation) * insuranceValue) / 100).toFixed(2);

                                //console.log(insuranceCompanyValue);

                                var data = {

                                    quotation_id    : req.session.id,
                                    cost            : insuranceCompanyValue,
                                    insureCompany   : req.params.id

                                };

                                var updateData = {

                                    cost            : insuranceCompanyValue,
                                    insureCompany   : req.params.id

                                };

                                var query = connector.query('INSERT INTO shipping set ? ON DUPLICATE KEY UPDATE ?', [data,updateData], function (err, rows) {

                                    if (err) {
                                        console.log('Error Selecting : %s ', err);
                                    }
                                    res.render('vehicle/further_vehicle_information',{
                                        form:'personalDetails',
                                        hidden: req.session.id
                                    });

                                });

                            });



                        });




                    });


                });
            }else{
                console.log("Invalid input from quotation");
                res.redirect('/insuranceQuotation');
            }
        }else{
            res.redirect('/');
        }




    });


    router.post('/', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(req.session.vehiclePersonal && req.session.vehicleDetails && req.session.vehicleInsurance && req.session.vehicleQuotation && req.session.furtherVehicleDetails ){
            if(validateFormVFuther(req.body.engine_number,req.body.chassis_no)){
                req.getConnection(function (err, connector) {

                    var data = {

                        engine_no    : input.engine_number,
                        chassis_no : input.chassis_no

                    };

                    var query = connector.query('UPDATE insurance_quotation set ? WHERE insurance_quotation_id = ? ', [data, req.session.id], function (err, rows) {

                        if (err) {
                            console.log('Error Updating further vehicle details : %s ', err);
                        }

                        req.session.shippingDetails=true;

                        res.redirect('/shippingDetails');

                    });

                    // console.log(query.sql); get raw query

                });
            }else{
                console.log("validation ERROR");
                res.redirect('/furtherVehicleDetails');
            }
        }else {
            res.redirect('/');
        }





    });

}

function  InsurnceIDValidation(id) {

    return (
        validator.isInt(id)
    );
}

function validateFormVFuther(engine_number,chassis_no) {

    return (
        !(validator.isEmpty(engine_number))
        &&  !(validator.isEmpty(chassis_no))

    );

}



/**
 * Created by menakafernando on 11/7/16.
 */

var validator = require('validator');


module.exports = function(router){

    //localhost:3000/auth
    router.post('/', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(validationFormVehicaleLease(req.body.vehicaleValueLease,req.body.downPaymentLease,req.body.lengthOfLease,req.body.leaseVehicleStatus)){
            req.getConnection(function (err, connector) {

                var vehicle_lease_quotation;

                vehicle_lease_quotation                             = req.session;
                vehicle_lease_quotation.id                          = Math.random();
                vehicle_lease_quotation.persanalDetailsVehicleLease = true;


                var data = {

                    lease_quotation_id  :   vehicle_lease_quotation.id,
                    vehicle_Value       :   input.vehicaleValueLease,
                    down_payment        :   input.downPaymentLease,
                    duration            :   input.lengthOfLease,
                    status              :   input.leaseVehicleStatus

                };

                var updateData={

                    vehicle_Value       :   input.vehicaleValueLease,
                    down_payment        :   input.downPaymentLease,
                    duration            :   input.lengthOfLease,
                    status              :   input.leaseVehicleStatus
                };

                var query = connector.query('INSERT INTO vehicle_lease_quotation set ? ON DUPLICATE KEY UPDATE ?', [data,updateData], function (err, rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }

                    res.redirect('/vehicleLease/personalDetails');

                });

                // console.log(query.sql); get raw query

            });
        }else{
            res.redirect('/');
        }

    });


    router.get('/personalDetails', function(req, res){

        if(req.session.persanalDetailsVehicleLease){
            res.render('housing_and_leasing/personal_details_leasing');
        }else {
            res.redirect('/');
        }



    });


    router.post('/personalDetails', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(req.session.persanalDetailsVehicleLease){
            if(validateFormPersonalHousing(req.body.title ,req.body.first_name,req.body.last_name,req.body.email,req.body.mobile,req.body.profession)){

                req.getConnection(function (err, connector) {

                    var data = {

                        title       : input.title,
                        first_name  : input.first_name,
                        last_name   : input.last_name,
                        email       : input.email,
                        mobile      : input.mobile,
                        profession  : input.profession

                    };

                    var query = connector.query('UPDATE vehicle_lease_quotation set ? WHERE lease_quotation_id = ? ', [data, req.session.id], function (err, rows) {

                        if (err) {
                            console.log('Error Selecting : %s ', err);
                        }

                        //req.session.vehicleInsurance=true;

                        res.redirect('/');

                    });

                    // console.log(query.sql); get raw query

                });

            }else{
                res.redirect('/');
            }

        }else {
            res.redirect('/');
        }



    });

}




function validationFormVehicaleLease(VehicaleValueLease,DownPaymentLease,LengthOfLease,LeaseVehicleStatus) {

    return (validator.isNumeric(VehicaleValueLease)
        && (+VehicaleValueLease>0)
        && validator.isNumeric(DownPaymentLease)
        && (+DownPaymentLease>0)
        && (+DownPaymentLease < +VehicaleValueLease)
        && validator.isNumeric(LengthOfLease)
        && (+LengthOfLease>0)
        && ((LeaseVehicleStatus=="registered") || (LeaseVehicleStatus=="unregistered"))

    );



}

function validateFormPersonalHousing(Title ,FirstName,LastName,Email,Mobile,Profession) {

    var phonePattern=/^\d{10}$/;

    return (
        validator.isAlpha(Title)
        &&  validator.isAlpha(FirstName)
        &&  validator.isAlpha(LastName)
        &&  validator.isEmail(Email)
        &&  strMatch(Mobile,phonePattern)
        &&  validator.isAlpha(Profession)
    );

}

function strMatch(str,pattern) {
    if(str.match(pattern)){

        return true;
    }

    return false;
}
/**
 * Created by menakafernando on 13/10/2016.
 */

var validator = require('validator');


module.exports = function(router){

    //localhost:3000/auth
    router.post('/', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(validationFormHousingLoan(req.body.housingValue,req.body.reqLoanAmount,req.body.loanPeriodHousing,req.body.rateType)){
            req.getConnection(function (err, connector) {

                var house_loan_quotation;

                house_loan_quotation                        = req.session;
                house_loan_quotation.id                     = Math.random();
                house_loan_quotation.persanalDetailsHousing = true;


                var data = {

                    loan_quotation_id   :   house_loan_quotation.id,
                    property_value      :   input.housingValue,
                    requesting_amount   :   input.reqLoanAmount,
                    duration            :   input.loanPeriodHousing,
                    rate_type           :   input.rateType

                };

                var updateData={

                    property_value      :   input.housingValue,
                    requesting_amount   :   input.reqLoanAmount,
                    duration            :   input.loanPeriodHousing,
                    rate_type           :   input.rateType
                };

                var query = connector.query('INSERT INTO housing_loan_quotation set ? ON DUPLICATE KEY UPDATE ?', [data,updateData], function (err, rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }

                    res.redirect('/housingLoan/personalDetails');

                });

                // console.log(query.sql); get raw query

            });
        }else{
            res.redirect('/');
        }

    });


    router.get('/personalDetails', function(req, res){

        if(req.session.persanalDetailsHousing){
            res.render('housing_and_leasing/personal_details');
        }else {
            res.redirect('/');
        }



    });


    router.post('/personalDetails', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(req.session.persanalDetailsHousing){
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

                    var query = connector.query('UPDATE housing_loan_quotation set ? WHERE loan_quotation_id = ? ', [data, req.session.id], function (err, rows) {

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

function validationFormHousingLoan(HousingValue,ReqLoanAmount,LoanPeriod,RateType) {

    return (validator.isNumeric(HousingValue)
        && validator.isNumeric(ReqLoanAmount)
        && (+ReqLoanAmount < +HousingValue)
        && validator.isNumeric(LoanPeriod)
        && (+LoanPeriod>0)
        && ((RateType=="fixed") || (RateType=="floating"))

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

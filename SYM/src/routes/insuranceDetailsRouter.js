/*
 * GET users listing.
 */

var validator = require('validator');
var moment=require('moment');


module.exports = function(router){

    //localhost:3000/auth
    router.get('/', function(req, res){

        if(req.session.vehiclePersonal && req.session.vehicleDetails && req.session.vehicleInsurance){
            req.getConnection(function (err, connector) {

                var insurance_companies_query = connector.query('SELECT * FROM insurance_companies', function (err, insurance_company_rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }


                    var cover_type_query = connector.query('SELECT * FROM cover_types', function (err, cover_type_rows) {

                        if (err) {
                            console.log('Error Selecting : %s ', err);
                        }
                        var voluntary_excess_query = connector.query('SELECT * FROM voluntary_excess', function (err, voluntary_excess_rows) {

                            if (err) {
                                console.log('Error Selecting : %s ', err);
                            }

                            var purpose_query = connector.query('SELECT * FROM purpose', function (err, purpose_rows) {

                                if (err) {
                                    console.log('Error Selecting : %s ', err);
                                }

                                res.render('vehicle/insurance_detail', {
                                    form: 'insuranceDetails',
                                    insurance_companies: insurance_company_rows,
                                    cover_types : cover_type_rows,
                                    voluntary_excess: voluntary_excess_rows,
                                    purposes: purpose_rows

                                });

                            });

                        });

                    });

                });

            });
        }else {
            res.redirect('/');
        }



    });


    router.post('/', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(req.session.vehiclePersonal && req.session.vehicleDetails && req.session.vehicleInsurance){
            if(validateFormInsuranceV(req.body.no_claim_bonus,req.body.insurance_company,req.body.cover_type,req.body.endDateInsurance,req.body.newInsuranceDate,req.body.voluntary_excess,req.body.purpose,req.body.termSmoke)){
                req.getConnection(function (err, connector) {


                    var data = {

                        no_claim_bonus          :   input.no_claim_bonus,
                        current_insurer         :   input.insurance_company,
                        cover_type_required     :   input.cover_type,
                        ex_insurance_date       :   convertDate(input.endDateInsurance,'12:00:00'),
                        start_date              :   convertDate(input.newInsuranceDate,'00:00:00'),
                        voluntary_excess        :   input.voluntary_excess,
                        purpose                 :   input.purpose,
                        authorise_agent_repair  :   input.termSmoke
                    };


                    //console.log(data);

                    var query = connector.query('UPDATE insurance_quotation set ? ', data, function (err, rows) {

                        if (err) {
                            console.log('Error Selecting : %s ', err);
                        }

                        req.session.vehicleQuotation=true;
                        res.redirect('/insuranceQuotation');

                    });

                    // console.log(query.sql); get raw query

                });
            }else{

                console.log('Error validation  ');
                res.redirect('/insuranceDetails');
            }
        }else {
            res.redirect('/');
        }





    });




}

var convertDate = function(usDate,time) {
    var dateParts = usDate.split(/(\d{1,2})\/(\d{1,2})\/(\d{4})/);
    return dateParts[3] + "-" + dateParts[2]+ "-" + dateParts[1] +" "+time ;
}

function validateFormInsuranceV(no_claim_bonus,insurance_company,cover_type,exInsurance,startDateInsurance,voluntary_excess,purpose,SmokeTrue ) {

    return (
        validator.isNumeric(no_claim_bonus)
        &&  (no_claim_bonus>0)
        &&  validator.isNumeric(insurance_company)
        &&  (insurance_company>0)
        &&  validator.isNumeric(cover_type)
        &&  (cover_type>0)
        &&  moment(exInsurance, "DD/MM/YYYY", true).isValid()
        &&  moment(startDateInsurance, "DD/MM/YYYY", true).isValid()
        &&  validator.isNumeric(voluntary_excess)
        &&  (voluntary_excess>0)
        &&  validator.isNumeric(purpose)
        &&  (purpose>0)
        &&  validator.isInt(SmokeTrue,{min:0,max:1})

    );

}


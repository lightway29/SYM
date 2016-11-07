/**
 * Created by menakafernando on 11/7/16.
 */


var validator = require('validator');
var moment=require('moment');

module.exports = function(router){

    //localhost:3000/auth
    router.post('/', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(validationformFD(req.body.FDAmount,req.body.FDtime,req.body.dobFD,req.body.FDNIC)){
            req.getConnection(function (err, connector) {

                var FD_quotation;

                FD_quotation                             = req.session;
                FD_quotation.id                          = Math.random();
                FD_quotation.persanalDetailsFD           = true;


                var data = {

                    FD_quotation_id :   FD_quotation.id,
                    amount          :   input.FDAmount,
                    duration        :   input.FDtime,
                    dob             :   convertDate(input.dobFD),
                    nic             :   input.FDNIC

                };

                var updateData={

                    amount          :   input.FDAmount,
                    duration        :   input.FDtime,
                    dob             :   convertDate(input.dobFD),
                    nic             :   input.FDNIC
                };

                var query = connector.query('INSERT INTO FD_quotation set ? ON DUPLICATE KEY UPDATE ?', [data,updateData], function (err, rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }

                    res.redirect('/investments/personalDetails');

                });

                // console.log(query.sql); get raw query

            });
        }else{
            res.redirect('/');
        }

    });


    router.get('/personalDetails', function(req, res){

        if(req.session.persanalDetailsFD){
            res.render('investments/personal_details');
        }else {
            res.redirect('/');
        }



    });


    router.post('/personalDetails', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(req.session.persanalDetailsFD){
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

                    var query = connector.query('UPDATE FD_quotation set ? WHERE FD_quotation_id = ? ', [data, req.session.id], function (err, rows) {

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




function validationformFD(FDAmount, FDTime, dobFD, FDNIC   ) {

    var idPattern=/^[0-9]{9}[vVxX]$/;

    return (validator.isNumeric(FDAmount)
        && (+FDAmount>0)
        && validator.isNumeric(FDTime)
        && (+FDTime>0)
        && moment(dobFD, "DD/MM/YYYY", true).isValid()
        && strMatch(FDNIC,idPattern)

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

var convertDate = function(usDate) {
    var dateParts = usDate.split(/(\d{1,2})\/(\d{1,2})\/(\d{4})/);
    return dateParts[3] + "-" + dateParts[2]+ "-" + dateParts[1] ;
}

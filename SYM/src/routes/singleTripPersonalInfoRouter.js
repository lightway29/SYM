
var validator = require('validator');

module.exports = function(router){

    //localhost:3000/auth
    router.get('/', function(req, res){

        if(req.session.tripInfo && req.session.singleTripPersonalInfo){
            res.render('travel/personal_detail');
        }else{
            res.redirect('/');
        }

    });

    router.post('/',function (req,res) {

        var input = JSON.parse(JSON.stringify(req.body));

        if(req.session.tripInfo && req.session.singleTripPersonalInfo){
            if(validateFormSingleTripPersonal(req.body.title,req.body.first_name,req.body.last_name,req.body.mobile,req.body.passport)){

                req.getConnection(function (err, connector) {

                    var data = {

                        title       : input.title,
                        first_name  : input.first_name,
                        last_name   : input.last_name,
                        mobile      : input.mobile,
                        passport    : input.passport

                    };

                    var query = connector.query('UPDATE travel_quotation_single set ? WHERE travel_quotation_id = ? ', [data, req.session.id], function (err, rows) {

                        if (err) {
                            console.log('Error Selecting : %s ', err);
                        }

                        req.session.quotation  =   true;

                        res.redirect('/tripPersonalQuotation');

                    });


                });


            }else {
                res.redirect('/');
            }


        }else{
            res.redirect('/');
        }

    });

}


function validateFormSingleTripPersonal(Title, FirstName, LastName, Mobile, Passport ) {

    var phonePattern=/^\d{10}$/;

    return (
        validator.isAlpha(Title)
        && validator.isAlpha(FirstName)
        && validator.isAlpha(LastName)
        &&  strMatch(Mobile,phonePattern)
        &&  validator.isAlphanumeric(Passport)

    );

}

function strMatch(str,pattern) {
    if(str.match(pattern)){

        return true;
    }

    return false;
}
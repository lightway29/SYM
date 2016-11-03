var validator = require('validator');
var moment=require('moment');


module.exports = function(router){

    //localhost:3000/auth
    router.get('/', function(req, res){

        if(req.session.tripInfo && req.session.groupTripPersonalInfo){

            req.getConnection(function (err, connection) {
                var insuranceGroupTravelNumber = connection.query('SELECT number_of_ppl FROM group_travel_quotation where travel_quotation_id=?', req.session.id
                    , function (err, insuranceGroupTravelNumberRow) {

                        var travelNumber = insuranceGroupTravelNumberRow[0].number_of_ppl;


                        res.render('travel/group_detail', {
                            countGroup : travelNumber

                        });
                });
            });

        }else{
            res.redirect('/');
        }




    });

    router.post('/',function (req,res) {

        var input = JSON.parse(JSON.stringify(req.body));


        //console.log( req.body['first_name'+1]);

        if(req.session.tripInfo && req.session.groupTripPersonalInfo){

            req.getConnection(function (err, connection) {
                var insuranceGroupTravelNumber = connection.query('SELECT number_of_ppl FROM group_travel_quotation where travel_quotation_id=?', req.session.id
                    , function (err, insuranceGroupTravelNumberRow) {

                        var travelNumber = insuranceGroupTravelNumberRow[0].number_of_ppl;


                        if(validateFormGroupTravelDetails(req.body,travelNumber)){


                            for(var r=1;r<=travelNumber;r++){

                                var title           =  req.body['title'+r];
                                var first_name      =  req.body['first_name'+r];
                                var last_name       =  req.body['last_name'+r];
                                var email           =  req.body['email'+r];
                                var mobile          =  req.body['mobile'+r];
                                var dob             =  req.body['startdate'+r];
                                var passport_no     =  req.body['passport_no'+r];

                                var data = {

                                    travel_quotation_id :   req.session.id,
                                    title               :   title,
                                    first_name          :   first_name,
                                    last_name           :   last_name,
                                    email               :   email,
                                    mobile              :   mobile,
                                    dob                 :   convertDate(dob),
                                    passport            :   passport_no,
                                    order_no            :   r

                                };

                                var updateData={

                                    title               :   title,
                                    first_name          :   first_name,
                                    last_name           :   last_name,
                                    email               :   email,
                                    mobile              :   mobile,
                                    dob                 :   convertDate(dob),
                                    passport            :   passport_no,

                                };

                                var query = connection.query('INSERT INTO group_info set ? ON DUPLICATE KEY UPDATE ?', [data,updateData], function (err, rows) {


                                    if (err) {
                                        console.log('Error Selecting : %s ', err);
                                    }

                                    //req.session.groupTripPersonalInfo = true;
                                    console.log('group travel was a success')


                                });

                            }



                            res.redirect('/');
                        }else{

                            res.redirect('/');
                        }
                    });
            });

        }else{
            res.redirect('/');
        }
    });

}

function validateFormGroupTravelDetails(body,num) {

    var validatoring = true;
    var phonePattern=/^\d{10}$/;

    if(num>4){
        for(var r=1;r<=num;r++){

            var title           =  body['title'+r];
            var first_name      =  body['first_name'+r];
            var last_name       =  body['last_name'+r];
            var email           =  body['email'+r];
            var mobile          =  body['mobile'+r];
            var groupStartdate  =  body['startdate'+r];
            var passport_no     =  body['passport_no'+r];

            //console.log(title);

            validatoring = (validatoring &&
            validator.isAlpha(title) &&
            validator.isAlpha(first_name) &&
            validator.isAlpha(last_name) &&
            validator.isEmail(email) &&
            strMatch(mobile,phonePattern) &&
            moment(groupStartdate, "DD/MM/YYYY", true).isValid() &&
            validator.isAlphanumeric(passport_no) );

        }
    }else{

        return false;
    }

    return (validatoring);



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
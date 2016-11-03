
var validator = require('validator');
var moment=require('moment');

module.exports = function(router){

    //localhost:3000/auth
    router.post('/', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(validateFormSingleTravel(req.body.dobTravel,req.body.singleTravelEmail,req.body.typeOfCoverSingleTrip) ){
            req.getConnection(function (err, connector) {

                var single_travel_quotation;

                single_travel_quotation                         =   req.session;
                single_travel_quotation.id                      =   Math.random();
                single_travel_quotation.tripInfo                =   true;
                single_travel_quotation.singleTripPersonalInfo  =   false;
                single_travel_quotation.quotation               =   false;

                var data = {

                    dob                 :   convertDate(input.dobTravel),
                    email               :   input.singleTravelEmail,
                    travel_quotation_id :   single_travel_quotation.id,
                    cover_type          :   input.typeOfCoverSingleTrip

                };

                var updateData={

                    dob                 :   convertDate(input.dobTravel),
                    email               :   input.singleTravelEmail,
                    cover_type          :   input.typeOfCoverSingleTrip

                };

                var query = connector.query('INSERT INTO travel_quotation_single set ? ON DUPLICATE KEY UPDATE ?', [data,updateData], function (err, rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }

                    res.redirect('/tripInfo/1');

                });

                // console.log(query.sql); get raw query

            });
        }else{

            console.log("Validation Error :");
            res.redirect('/');
        }





    });

}


function validateFormSingleTravel(DobTravelSingle,SingleTravelEmail,SingleTravelTypeOfCover) {

    return (moment(DobTravelSingle, "DD/MM/YYYY", true).isValid()
        && validator.isEmail(SingleTravelEmail)
        && validator.isNumeric(SingleTravelTypeOfCover)
        && (SingleTravelTypeOfCover>0)
    );


}

var convertDate = function(usDate) {
    var dateParts = usDate.split(/(\d{1,2})\/(\d{1,2})\/(\d{4})/);
    return dateParts[3] + "-" + dateParts[2]+ "-" + dateParts[1] ;
}
/**
 * Created by menakafernando on 13/10/2016.
 */

var validator = require('validator');
var moment=require('moment');

module.exports = function(router){

    //localhost:3000/auth
    router.post('/', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(validateFormGroupTravel(req.body.startdate,req.body.enddate,req.body.emailGroup,req.body.travelGroupNumber) ){
            req.getConnection(function (err, connector) {

                var group_travel_quotation;

                group_travel_quotation                         =   req.session;
                group_travel_quotation.id                      =   Math.random();
                group_travel_quotation.tripInfo                =   true;
                group_travel_quotation.groupTripPersonalInfo   =   false;
                //group_travel_quotation.quotation               =   false;

                var data = {

                    dep_date            :   convertDate(input.startdate),
                    arraival_date       :   convertDate(input.enddate),
                    email               :   input.emailGroup,
                    travel_quotation_id :   group_travel_quotation.id,
                    number_of_ppl       :   input.travelGroupNumber

                };

                var updateData={

                    dep_date            :   convertDate(input.startdate),
                    arraival_date       :   convertDate(input.enddate),
                    email               :   input.emailGroup,
                    number_of_ppl       :   input.travelGroupNumber
                };

                var query = connector.query('INSERT INTO group_travel_quotation set ? ON DUPLICATE KEY UPDATE ?', [data,updateData], function (err, rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }

                    res.redirect('/tripInfo/2');

                });

                // console.log(query.sql); get raw query

            });
        }else{

            console.log("Validation Error :");
            res.redirect('/');
        }





    });

}

function validateFormGroupTravel(Startdate,Enddate,EmailGroup,TravelGroupNumber) {

    return (
        moment(Startdate, "DD/MM/YYYY", true).isValid()
        && moment(Enddate, "DD/MM/YYYY", true).isValid()
        && validator.isEmail(EmailGroup)
        && validator.isNumeric(TravelGroupNumber)
        && (TravelGroupNumber>0)
    );

}

var convertDate = function(usDate) {
    var dateParts = usDate.split(/(\d{1,2})\/(\d{1,2})\/(\d{4})/);
    return dateParts[3] + "-" + dateParts[2]+ "-" + dateParts[1] ;
}
/**
 * Created by menakafernando on 13/10/2016.
 */

var validator = require('validator');
var moment=require('moment');

module.exports = function(router){

    //localhost:3000/auth
    router.get('/:id', function(req, res){

        if(req.session.tripInfo){

            if(req.params.id==1){

                res.render('travel/single',{
                    travelType:req.params.id
                });
            }else if(req.params.id==2) {

                res.render('travel/group',{
                    travelType:req.params.id
                });
            }else{

                res.redirect('/');
            }


        }else{
            res.redirect('/');
        }





    });

    router.post('/',function (req,res) {

        var input = JSON.parse(JSON.stringify(req.body));

        if(req.session.tripInfo){

            req.getConnection(function (err, connector) {

                if(input.travelType==1){

                    if(validateFormTripInfo(req.body.travelType,req.body.dateOfDepartureSingleTrip,req.body.dateOfArrivalSingleTrip,req.body.country,req.body.medical,req.body.goods)) {


                        var data = {

                            date_of_departure: convertDate(input.dateOfDepartureSingleTrip),
                            date_of_arrival: convertDate(input.dateOfArrivalSingleTrip),
                            travel_rigon: input.country,
                            medical: input.medical,
                            goods: input.goods

                        };

                        var query = connector.query('UPDATE travel_quotation_single set ? WHERE travel_quotation_id = ? ', [data, req.session.id], function (err, rows) {

                            if (err) {
                                console.log('Error Selecting : %s ', err);
                            }

                            req.session.singleTripPersonalInfo = true;

                            res.redirect('/singleTripPersonalInfo');

                        });
                    }else{

                        console.log('Error validation trip-info single');
                        res.redirect('/');
                    }


                }else if(input.travelType==2){

                    if(validateFormTripInfoGroup(req.body.travelType,req.body.country,req.body.medical,req.body.goods)) {


                        var data = {

                            travel_rigon: input.country,
                            medical: input.medical,
                            goods: input.goods

                        };

                        var query = connector.query('UPDATE group_travel_quotation set ? WHERE travel_quotation_id = ? ', [data, req.session.id], function (err, rows) {

                            if (err) {
                                console.log('Error Selecting : %s ', err);
                            }

                            req.session.groupTripPersonalInfo = true;

                            res.redirect('/tripGroupDetails');

                        });
                    }else{

                        console.log('Error validation trip-info single');
                        res.redirect('/');
                    }


                }else{
                    console.log('Error @ travel type ');
                    res.redirect('/');
                }

            });

        }else{
            res.redirect('/');
        }


    });

}

var convertDate = function(usDate) {
    var dateParts = usDate.split(/(\d{1,2})\/(\d{1,2})\/(\d{4})/);
    return dateParts[3] + "-" + dateParts[2]+ "-" + dateParts[1] ;
}

function validateFormTripInfo(TravelType, Departure, Arrival, Country, Medical, Goods ) {

    return (
        validator.isNumeric(TravelType)
        &&  moment(Arrival, "DD/MM/YYYY", true).isValid()
        &&  moment(Departure, "DD/MM/YYYY", true).isValid()
        &&  validator.isAlpha(Country)
        &&  validator.isInt(Medical)
        &&  (Medical>0)
        &&  validator.isInt(Goods)
        &&  (Goods>0)
    );

}

function validateFormTripInfoGroup(TravelType, Country, Medical, Goods ) {

    return (
        validator.isNumeric(TravelType)
        &&  validator.isAlpha(Country)
        &&  validator.isInt(Medical)
        &&  (Medical>0)
        &&  validator.isInt(Goods)
        &&  (Goods>0)
    );

}
/*
 * GET users listing.
 */

var validator = require('validator');

module.exports = function(router){

    //localhost:3000/auth
    router.get('/', function(req, res){

        if(req.session.vehicleDetails){
            req.getConnection(function (err, connector) {

                var query = connector.query('SELECT * FROM vehicle_make', function (err, rows) {
                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }
                    //console.log(rows);
                    res.render('vehicle/vehicle_details', {
                        form: "vehicleDetails",
                        hidden: req.session.id,
                        make: rows
                    });
                });

            });

        }else{
            res.redirect('/');
        }

    });

    router.post('/', function(req, res){

        if(req.session.vehicleDetails){

            var input = JSON.parse(JSON.stringify(req.body));


            if(validateFormDetailsV(req.body.make,req.body.model,req.body.year,req.body.value,req.body.oriValue,req.body.fuel)){
                req.getConnection(function (err, connector) {

                    var str=input.value;
                    str = str.replace( /,/g, "" );

                    var data = {

                        make    :   input.make,
                        model   :   input.model,
                        year    :   input.year,
                        value   :   str,
                        fuel    :   input.fuel

                    };

                    var query = connector.query('UPDATE insurance_quotation set ? WHERE insurance_quotation_id = ? ', [data, req.session.id], function (err, rows) {

                        if (err) {
                            console.log('Error Selecting : %s ', err);
                        }
                        req.session.vehiclePersonal=true;

                        res.redirect('/personalDetails');

                    });

                    // console.log(query.sql); get raw query

                });
            }else{


                console.log("validation Error:");
                res.redirect('/vehicleDetails');

            }
        }else{
            res.redirect('/');
        }





    });


    router.post('/getVehicleModel', function(req, res){

        var id = req.body.v_make;

        req.getConnection(function (err, connector) {
            var query = connector.query('SELECT * FROM vehicle_models WHERE vehicle_id = ? and status =?', [id,1], function (err, rows) {
                if(err){
                    console.log(err);
                }
                return res.send(rows);
            });
        });

    });


    router.post('/getVehicleYear', function(req, res){

        var id      = req.body.v_model;
        var type    = req.body.fuel_type;

        req.getConnection(function (err, connector) {
            var query = connector.query('SELECT distinct year   FROM vehicle_valivation where model_id=? and fuel_type=?', [id,type], function (err, rows) {
                if(err){
                    console.log(err);
                }
                return res.send(rows);
            });
        });

    });


    router.post('/getVehicleFuel', function(req, res){

        var id = req.body.v_model;

        req.getConnection(function (err, connector) {
            var query = connector.query('SELECT distinct fuel_types.name,fuel_types.id FROM vehicle_valivation left JOIN fuel_types ON vehicle_valivation.fuel_type=fuel_types.id where vehicle_valivation.model_id=?', [id], function (err, rows) {
                if(err){
                    console.log(err);
                }
                return res.send(rows);
            });
        });

    });


    router.post('/getVehicleValue', function(req, res){

        var id      = req.body.v_model;
        var fuel    = req.body.fuel_type;
        var year    = req.body.year;

        req.getConnection(function (err, connector) {
            var query = connector.query('SELECT valivation FROM dbsym.vehicle_valivation where model_id=? and fuel_type=? and year=?', [id,fuel,year], function (err, rows) {
                if(err){
                    console.log(err);
                }

                return res.send(rows);
            });
        });

    });


}

function validateFormDetailsV(Make,Model,Year,Value,OriValue,Fuel) {

    Value = Value.replace( /,/g, "" );



    return (
        validator.isNumeric(Make)
        &&  (Make>0)
        &&  validator.isNumeric(Model)
        &&  (Model>0)
        &&  validator.isNumeric(Year)
        &&  (Year>0)
        &&  validator.isNumeric(Value)
        &&  (((+(OriValue) *0.9) < +Value) && ((+(OriValue) *1.1) > +Value ))
        &&  validator.isNumeric(Fuel)
        &&  (Fuel>0)

    );


}



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


            if(validateFormDetailsV(req.body.make,req.body.model,req.body.year,req.body.value)){
                req.getConnection(function (err, connector) {

                    var str=input.value;
                    str = str.replace( /,/g, "" );

                    var data = {

                        make    :   input.make,
                        model   :   input.model,
                        year    :   input.year,
                        value   :   str

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
            var query = connector.query('SELECT * FROM vehicle_model WHERE vehicle_id = ?', [id], function (err, rows) {
                if(err){
                    console.log(err);
                }
                return res.send(rows);
            });
        });

    });

}

function validateFormDetailsV(Make,Model,Year,Value) {

    Value = Value.replace( /,/g, "" );



    return (
        validator.isNumeric(Make)
        &&  (Make>0)
        &&  validator.isNumeric(Model)
        &&  (Model>0)
        &&  validator.isNumeric(Year)
        &&  (Year>0)
        &&  validator.isNumeric(Value)
        &&  (Value>999)

    );


}




/*
 * GET users listing.
 */

var validator = require('validator');


module.exports = function(router){

    //localhost:3000/auth
    router.get('/', function(req, res){

        if(req.session.vehiclePersonal && req.session.vehicleDetails){

            req.getConnection(function (err, connector) {

                var query = connector.query('SELECT * FROM prefix_honor', function (err, rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }

                    res.render('vehicle/personal_details',{
                        form:'personalDetails',
                        hidden: req.session.id,
                        prefix: rows
                    });

                });
            });


        }else {

                res.redirect('/');


        }


    });


    router.post('/', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(req.session.vehiclePersonal && req.session.vehicleDetails){
            if(validateFormPersonalV(req.body.title,req.body.first_name,req.body.last_name,req.body.email,req.body.mobile,req.body.nic)){
                req.getConnection(function (err, connector) {

                    var data = {

                        title    : input.title,
                        first_name : input.first_name,
                        last_name: input.last_name,
                        email   : input.email,
                        mobile  : input.mobile,
                        nic   : input.nic

                    };

                    var query = connector.query('UPDATE insurance_quotation set ? WHERE insurance_quotation_id = ? ', [data, req.session.id], function (err, rows) {

                        if (err) {
                            console.log('Error Selecting : %s ', err);
                        }


                            req.session.vehicleInsurance=true;

                            res.redirect('/insuranceDetails');


                    });

                    // console.log(query.sql); get raw query

                });
            }else{

                console.log("validation ERROR:");

                res.redirect('/personalDetails');
            }



        }else{
            res.redirect('/');
        }


    });

    router.get('/getPreFix', function(req, res){

        req.getConnection(function (err, connector) {
            var query = connector.query('SELECT * FROM prefix_honor', function (err, rows) {
                if(err){
                    console.log(err);
                }
                return res.send(rows);
            });
        });

    });



}

function validateFormPersonalV(Title,FirstName,LastName,Email,Mobile,Nic) {

    var phonePattern=/^\d{10}$/;
    var idPattern=/^[0-9]{9}[vVxX]$/;


    return (
        validator.isAlpha(Title)
        &&  validator.isAlpha(FirstName)
        &&  validator.isAlpha(LastName)
        &&  validator.isEmail(Email)
        &&  strMatch(Mobile,phonePattern)
        &&  strMatch(Nic,idPattern)
    );



}

function strMatch(str,pattern) {
    if(str.match(pattern)){

        return true;
    }

    return false;
}



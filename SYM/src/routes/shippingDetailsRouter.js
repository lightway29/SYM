
var validator = require('validator');

module.exports = function(router){

    //localhost:3000/auth
    router.get('/', function(req, res){

        if(req.session.vehiclePersonal && req.session.vehicleDetails && req.session.vehicleInsurance && req.session.vehicleQuotation && req.session.furtherVehicleDetails && req.session.shippingDetails){
            req.getConnection(function (err, connector) {

                var shipping_method_query = connector.query('SELECT * FROM shipping_method', function (err, shipping_method_rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }

                    var shipping_query = connector.query('SELECT * FROM shipping WHERE quotation_id=?',req.session.id,  function (err, shipping_rows) {

                        if (err) {
                            console.log('Error Selecting : %s ', err);
                        }

                        res.render('vehicle/shipping_detail', {
                            shipping_methods:shipping_method_rows,
                            company_value:shipping_rows[0].cost

                        });

                    });

                });

                //console.log(query.sql);
            });
        }else{
            res.redirect('/');
        }



    });


    router.post('/', function(req, res){

        var input = JSON.parse(JSON.stringify(req.body));

        if(req.session.vehiclePersonal && req.session.vehicleDetails && req.session.vehicleInsurance && req.session.vehicleQuotation && req.session.furtherVehicleDetails && req.session.shippingDetails){
            req.getConnection(function (err, connector) {

                var data;


                if(input.sameAsRegistered){
                    data = {

                        quotation_id        : req.session.id,
                        shipping_method     : input.shipping_method,
                        reg_address         : input.address,
                        reg_apt             : input.alt_suit,
                        reg_city            : input.city,
                        reg_country         : input.country,
                        reg_postal_code     : input.postal_code,
                        reg_phone           : input.phone,
                        ship_address        : input.address,
                        ship_apt            : input.alt_suit,
                        ship_city           : input.city,
                        ship_country        : input.country,
                        ship_postal_code    : input.postal_code

                    };



                }else {
                    data = {

                        quotation_id        : req.session.id,
                        shipping_method     : input.shipping_method,
                        reg_address         : input.address,
                        reg_apt             : input.alt_suit,
                        reg_city            : input.city,
                        reg_country         : input.country,
                        reg_postal_code     : input.postal_code,
                        reg_phone           : input.phone,
                        ship_address        : input.address2,
                        ship_apt            : input.alt_suit2,
                        ship_city           : input.city2,
                        ship_country        : input.country2,
                        ship_postal_code    : input.postal_code2

                    };


                }





                var query = connector.query('UPDATE shipping set ? WHERE quotation_id=?' , [data,req.session.id], function (err, rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }
                    res.redirect('/');

                });

                // console.log(query.sql); get raw query

            });
        }else{
            res.redirect('/');
        }



    });



}

function validateFormShippingV(shipping_method,
                                address,
                                altsuit,
                                city,
                                country,
                                postalcode,
                                phone,
                                sameAsRegistered,
                                address2,
                                altsuit2,
                                city2,
                                country2,
                                postalcode2 ) {

    var phonePattern=/^\d{10}$/;

   /*

    var ccnum  = document.getElementById('cardnumber'),
        //type   = document.getElementById('ccnum-type'),
        expiry = document.getElementById('mmyy'),
        cvc    = document.getElementById('cvv')
        //submit = document.getElementById('submit')
        //result = document.getElementById('result')
        ;
*/

    if(sameAsRegistered){

        return (
            validator.isNumeric(shipping_method)
            &&  (shipping_method>0)
            &&  validator.isAlphanumeric(address)
            &&  validator.isAlphanumeric(altsuit)
            &&  validator.isAlphanumeric(city)
            &&  validator.isAlphanumeric(country)
            &&  validator.isAlphanumeric(postalcode)
            &&  strMatch(phone,phonePattern)

           /* &&  payform.validateCardNumber(ccnum.value)
            &&  payform.validateCardExpiry(payform.parseCardExpiry(expiry.value))
            &&  payform.validateCardCVC(cvc.value)
*/


        );

    }else{

        return (
            validator.isNumeric(shipping_method)
            &&  (shipping_method>0)
            &&  validator.isAlphanumeric(address)
            &&  validator.isAlphanumeric(altsuit)
            &&  validator.isAlphanumeric(city)
            &&  validator.isAlphanumeric(country)
            &&  validator.isAlphanumeric(postalcode)
            &&  strMatch(phone,phonePattern)

            &&  validator.isAlphanumeric(address2)
            &&  validator.isAlphanumeric(altsuit2)
            &&  validator.isAlphanumeric(city2)
            &&  validator.isAlphanumeric(country2)
            &&  validator.isAlphanumeric(postalcode2)
/*
            &&  payform.validateCardNumber(ccnum.value)
            &&  payform.validateCardExpiry(payform.parseCardExpiry(expiry.value))
            &&  payform.validateCardCVC(cvc.value)

*/
        );
    }


}

function strMatch(str,pattern) {
    if(str.match(pattern)){

        return true;
    }

    return false;
}






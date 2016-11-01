/**
 * Created by menakafernando on 28/10/2016.
 */
module.exports = function(router){

    //localhost:3000/auth
    router.get('/', function(req, res){

        if(req.session.tripInfo && req.session.singleTripPersonalInfo && req.session.quotation){
            res.render('travel/quotation_detail_personal');
        }else{
            res.redirect('/');
        }

    });

    router.post('/',function (req,res) {

        res.redirect('/tripPersonalQuotation');

    });

}



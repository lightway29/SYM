/**
 * Created by menakafernando on 24/10/2016.
 */

module.exports = function(router,nav){

    //localhost:3000/auth
    router.get('/', function(req, res){

        req.getConnection(function (err, connector) {

            var purpose_query = connector.query('SELECT * FROM travel_type', function (err, travel_type_rows) {

                if (err) {
                    console.log('Error Selecting : %s ', err);
                }

                var province_query = connector.query('SELECT * FROM province_list', function (err, province_rows) {

                    if (err) {
                        console.log('Error Selecting : %s ', err);
                    }

                    res.render('index', {
                        form            :   'insuranceInfo',
                        nav             :   nav,
                        travel_types    :   travel_type_rows,
                        province_data   :   province_rows
                    });


                });


            });

        });




    });

}

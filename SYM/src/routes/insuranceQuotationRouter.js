

module.exports = function(router){

    //localhost:3000/auth
    router.get('/', function(req, res){

        if(req.session.vehiclePersonal && req.session.vehicleDetails && req.session.vehicleInsurance && req.session.vehicleQuotation){
            req.getConnection(function (err, connection) {
                var insuranceQuotation = connection.query('SELECT * FROM insurance_quotation WHERE insurance_quotation_id=?', req.session.id
                    , function (err, insuranceQuotationRow) {

                        var insuranceValue = insuranceQuotationRow[0].value;

                        var validCompanies;

                        //console.log(insuranceValue);
                        var data = null;
                        var quotationValue = connection.query("SELECT * FROM insurance_purpose_value WHERE insurance_type='1' AND purpose='1'", function (err, equationRows) {

                            var insuranceCompanyValues = {};
                            for (var j = 0; j < equationRows.length; j++) {
                                //var equation = equationRows[j].equation;
                                insuranceCompanyValues[equationRows[j].insurance_company] = (100 + equationRows[j].value) * insuranceValue / 100;
                            }


                            req.getConnection(function (err, connector) {
                                var query = connector.query("SELECT " +
                                    "distinct insurance_companies.id AS company_id " +
                                    "FROM " +
                                    "insurance_companies " +
                                    "Inner Join insurance_features ON insurance_companies.id = insurance_features.insurance_id " +
                                    "Inner Join insurance_types ON insurance_types.id = insurance_features.insurance_type ", function (err, rows) {
                                    if(err){
                                        console.log(err);
                                    }
                                    validCompanies=rows;

                                });
                            });


                            //for (var j = 0; j < equationRows.length; j++) {
                            //    var equation = equationRows[j].equation;
                            //    for (var index = 0 in variableValuesResult) {
                            //        equation = equation.replace(variableValuesResult[index].equation_variable, variableValuesResult[index].variable_value);
                            //    }
                            //
                            //    if (equation != null && equationRows.length < 200) {
                            //        insuranceCompanyValue[equationRows[j].insurance_company] = equation;
                            //        //console.log(insuranceCompanyValue[equationRows[j].insurance_company]);
                            //    }
                            //}

                            //console.log(insuranceCompanyValue);

                            //var variables = equation.replace(/\W/g, '');
                            //var valueStore = "";
                            //for (var letter = 0; letter <= variables.length - 1; letter++) {
                            //    valueStore += '"' + variables[letter] + '"';
                            //    if (letter <= variables.length - 2) {
                            //        valueStore += ",";
                            //    }
                            //}

                            //var variableQuery = connection.query("SELECT " +
                            //    "p.id, " +
                            //    "p.insurance_company, " +
                            //    "e.variable AS equation_variable, " +
                            //    "v.variable, " +
                            //    "v.variable_value, " +
                            //    "pp.purpose " +
                            //    "FROM " +
                            //    "insurance_purpose_value p " +
                            //    "JOIN variable_value v ON p.id = v.purpose_id " +
                            //    "JOIN equation_keys e ON e.id = v.variable " +
                            //    "JOIN purpose pp ON pp.id = p.purpose " +
                            //    "WHERE e.variable IN (" + valueStore + ")"
                            //
                            //    , function (err, variableValuesResult) {
                            //
                            //        if (err) {
                            //            console.log(err);
                            //        }

                            //console.log(eval(equation));

                            var listQuery = connection.query("SELECT " +
                                "insurance_companies.insurance_name AS company_name, " +
                                "insurance_types.insurance_type, " +
                                "insurance_features.feature AS insurance_feature, " +
                                "insurance_companies.id AS company_id " +
                                "FROM " +
                                "insurance_companies " +
                                "Inner Join insurance_features ON insurance_companies.id = insurance_features.insurance_id " +
                                "Inner Join insurance_types ON insurance_types.id = insurance_features.insurance_type "

                                , function (err, quotationRows) {

                                    var graphicInfoQuery = connection.query('SELECT * FROM graphic_info WHERE insurance_type_id = ?', [1]
                                        , function (err, graphicInfoRows) {
                                            var insuranceCompaniesQuery = connection.query('SELECT * FROM insurance_companies'
                                                , function (err, insuranceCompanyRows) {

                                                    req.session.furtherVehicleDetails=true;

                                                    var tableRows   =   {};
                                                    var com = 0;
                                                    var list = 0;
                                                    var count=0;

                                                    for(var h = 0; h < validCompanies.length; h++ ){

                                                        list++;
                                                        count=0;

                                                        tableRows[list] = {
                                                            id      : validCompanies[h].company_id,
                                                            value   : thousandSeparato(insuranceCompanyValues[validCompanies[h].company_id]),
                                                            link    : '/furtherVehicleDetails'
                                                        };

                                                        com = validCompanies[h].company_id;

                                                        for(var i=0;i<quotationRows.length;i++){


                                                            if(com==quotationRows[i].company_id){

                                                                if(count<6){
                                                                    count++;
                                                                    tableRows[list]["item"+count]=quotationRows[i].insurance_feature;
                                                                }else{
                                                                    count=0;
                                                                }

                                                            }

                                                        }


                                                    }

                                                    var pathInfo= '<div class="insurance_text">'
                                                                        +'Request Form'
                                                                    +'</div>'
                                                                    +'<ul class="breadcrumbc">'
                                                                        +'<li class="breadcrumb__item breadcrumb__item--blank">'
                                                                            +'Vehicle Details'
                                                                        +'</li>'
                                                                        +'<li class="breadcrumb__item breadcrumb__item--blank">'
                                                                            +'Personal Info'
                                                                        +'</li>'
                                                                        +'<li class="breadcrumb__item breadcrumb__item--blank" >'
                                                                            +'Insurance Info'
                                                                        +'</li>'
                                                                        +'<li class="breadcrumb__item breadcrumb__item--current" style="color: green">'
                                                                            +'Quotation'
                                                                        +'</li>'
                                                                        +'<li class="breadcrumb__item breadcrumb__item--blank">'
                                                                            +'Further Vehicle Information'
                                                                        +'</li>'
                                                                    +'</ul>';




                                                    res.render('quotation', {
                                                        treeData                : pathInfo,
                                                        graphicInfo             : graphicInfoRows,
                                                        companies               : insuranceCompanyRows,
                                                        tableData               : tableRows
                                                    });
                                                });
                                        });
                                });
                            //});

                        });
                    });

                //console.log(query.sql);
            });
        }else{
            res.redirect('/');
        }



    });

}

function thousandSeparato(val){

    var num = val.toString().replace(/,/gi, "");
    var num2 = num.split(/(?=(?:\d{3})+$)/).join(",");

    return num2;
}



/**






 */
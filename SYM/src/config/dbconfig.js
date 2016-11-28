
var mysql      = require('mysql');
var connector  = require('express-myconnection');

var connection = connector(mysql,{

    // host: 'localhost',//host
    // user: 'root',//username
    // password : '123',//password
    // port : 3306, //port mysql
    // database:'dbsym'//db name

    host: 'blog.cqq8bmen57bt.us-east-1.rds.amazonaws.com',//host
    user: 'root',//username
    password : 'adminsaveyourmonkey',//password
    port : 3306, //port mysql
    database:'blog'//db name

},'pool'); //or single


module.exports = connection;
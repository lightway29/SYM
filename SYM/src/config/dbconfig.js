'use strict';

var mysql      = require('mysql');
var connector  = require('express-myconnection');

var connection = connector(mysql,{

  /**
   * FIXME get dotenv working
   */
  // host: process.env.DB_HOST,
  // username: process.env.DB_USER,
  // password: process.env.DB_PASS,

  host: 'localhost',//host
  user: 'root',//username
  password : '',//password
  port : 3306, //port mysql
  database:'dbsym'//db name
},'pool'); //or single


module.exports = connection;

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '123456'
});

connection.connect(function(err) {
  if (err) {
    console.error('MySQL error connecting: ' + err.stack);
    return;
  }

  console.log('MySQL connected as id ' + connection.threadId);
});
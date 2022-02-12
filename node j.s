// router app.js
express = require('express');
var bodyParser = require("body-parser");
var expressLayouts = require('express-ejs-layouts');
var path = require('path');
var app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(express.static('../public'));
app.set('view engine', 'ejs');
app.use(expressLayouts);
app.set('views', path.join(__dirname, '../views'));

app.get('/', function(req, res) {
  res.render('index');
});
app.get('/register',(req,res)=>{
  res.render('register');

});
  

  app.post('/login', function (req, res) {
      //console.log("body"+ JSON.stringify(res));
    var username="Khaalid";
    var password ="123";
    if (req.body.username==username && req.body.password==password){
        res.send({resultCode:2001,respondMessage:"success",sessionId:"xxxxxxxxxx1111----xxxxx---22"});
    }else 
     res.send({resultCode:4001,respondMessage:"invalid Username or password"})
  })
  app.listen(3000,function(){

    console.log("the server runs on port 3000");
  });
  
  // route.jsconst 
        express = require('express');
       const router = express.Router();

        router.post('/register',(req,res)=> {
     res.redirect('register.ejs');
        });
        
        // connection management db with node.js
        const mysql = require('mysql');
           const pool = mysql.createPool({
      connectionLimit : 100,
    host: 'localhost',
    user: 'root',
    password: 'test@123',
    database: 'usermanagement',
    debug    :  false
});

module.exports = pool;

// db module.js
var pool = require('./ConnectionManager');

function getConnection() {
    pool.getConnection((error,Connection)=>{
        if(error){
            throw new Error(error);
        }else {
            Connection.query("SELECT * FROM USERS",(error,rows)=>{
                console.log(rows[0]);
            });
        }
    });
}

getConnection();
  

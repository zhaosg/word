var express = require('express');
var fs = require('fs');
var pdf = require('html-pdf');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
    var html = fs.readFileSync('/Users/zhaosg/Code/word/pages.html', 'utf8');
    var options = {
        // format: 'A4',
        "height": "297mm",        // allowed units: mm, cm, in, px
        "width": "210mm",            // allowed units: mm, cm, in, px
        orientation: "portrait",
        "base": "file:///Users/zhaosg/Code/word","zoomFactor": "0.55"
    };

    pdf.create(html, options).toFile('businesscard.pdf', function (err, res) {
        if (err) return console.log(err);
        console.log(res); // { filename: '/app/businesscard.pdf' }
    });
    res.render('index', {title: 'Express'});
});

module.exports = router;

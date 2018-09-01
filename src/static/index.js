// pull in desired CSS/SASS files
require('./styles/custom.css');

// inject bundled Elm app into div#main
var Elm = require('../elm/Main');
var app = Elm.Elm.Main.init({
  node: document.getElementById('main')
});
require( './styles/main.scss' );

var Elm = require( '../elm/Main' );
Elm.Main.embed(document.getElementById('main'), { docRoot: process.env.DOC_ROOT });

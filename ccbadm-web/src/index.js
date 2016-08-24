var koa = require('koa');
var static = require('koa-static');
var app = koa();

var path = {
	development: "dist",
	production: "public"
};
var port = process.env.PORT || 5000;

app.use(static(path[app.env],{}));

app.listen(port);

console.log("Running node on " + port);

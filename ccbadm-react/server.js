require('node-jsx').install({ harmony: true, extension: '.js' });
const Koa = require('koa');
const serve = require('koa-static');
const Router = require('koa-router')();
const React = require('react');
const ReactDOMServer = require('react-dom/server');
const fs = require('fs');
const pug = require('pug');

const Home = require('./src/home/index.jsx');
const Users = require('./src/users/index.jsx');

const app = new Koa();

function reactify(Component) {
  const mainComponent = React.createFactory(Component);
  const jsx = ReactDOMServer.renderToStaticMarkup(mainComponent(this.request));
  const fn = pug.compile(fs.readFileSync('./src/index.pug'), {});
  const html = fn({ component: jsx });
  return html;
}

Router.get('/', function * generator(next) {
  yield next;
  this.body = reactify(Home);
});

Router.get('/users', function * generator(next) {
  yield next;
  this.body = reactify(Users);
});

app.use(serve('./public'));

app
  .use(Router.routes())
  .use(Router.allowedMethods());

if (!module.parent) {
  app.listen(process.env.PORT, () => {
    /*eslint no-console: false*/
    console.log(`\x1b[32m READY on docker:${process.env.PORT}! \x1b[0m`);
  });
}


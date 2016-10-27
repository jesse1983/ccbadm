/* eslint global-require: 0 */
/* eslint import/no-dynamic-require: 0 */
const Router = require('koa-router')();
const routes = require('./routes');
const Auth = require('./src/auth');


class Routing {
  static jsxify(compName, req, params = null) {
    const fs = require('fs');
    const React = require('react');
    const ReactDOMServer = require('react-dom/server');
    const pug = require('pug');

    require('node-jsx').install({ harmony: true, extension: '.js' });
    let component = {};
    if (Auth.logged(req.cookies)) {
      component = require(`./src/${compName}/index.jsx`);
    } else {
      component = require('./src/login/index.jsx');
    }
    const mainComponent = React.createFactory(component);
    const jsx = ReactDOMServer.renderToStaticMarkup(mainComponent(params));
    const fn = pug.compile(fs.readFileSync('./src/index.pug'), {});
    const html = fn({ component: jsx, data: JSON.stringify(params) });
    return html;
  }

  static reactify(compName, req) {
    return new Promise((resolve, reject) => {
      if (routes[compName].service) {
        const service = require(`./src/services/${routes[compName].service}.service`);
        service[routes[compName].method]().then((result) => {
          resolve(Routing.jsxify(compName, req, result));
        }, (err, value) => {
          reject(err, value);
        });
      } else {
        resolve(Routing.jsxify(compName, req));
      }
    });
  }

  static mount() {
    Object.keys(routes).map((key) => {
      return Router.all(routes[key].path, function* generator() {
        this.body = yield Routing.reactify(key, this);
      });
    });
    return Router;
  }
}

module.exports = Routing;


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
      component = require(`./src/components/${compName}/index.jsx`);
    } else {
      component = require('./src/components/login/index.jsx');
    }
    const mainComponent = React.createFactory(component);
    const jsx = ReactDOMServer.renderToStaticMarkup(mainComponent({ data: params }));
    const fn = pug.compile(fs.readFileSync('./src/index.pug'), {});
    const html = fn({
      component: jsx,
      data: JSON.stringify(params),
      route: compName,
    });
    return html;
  }

  static reactify(compName, req) {
    return new Promise((resolve, reject) => {
      if (routes[compName].service) {
        const serviceName = routes[compName].service;
        const service = require(`./src/services/${serviceName}/${serviceName}.service`);
        service[routes[compName].method](req.cookies.get('currentUser')).then((result) => {
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
        if (Auth.logged(this.cookies)) {
          this.body = yield Routing.reactify(key, this);
        } else {
          this.body = yield Routing.reactify('login', this);
        }
      });
    });
    return Router;
  }
}

module.exports = Routing;


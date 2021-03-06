const startTime = new Date();

const Koa = require('koa');
const serve = require('koa-static');
const Routing = require('./routing').mount();
const loginActions = require('./src/services/login.reflux').loginActions;

const app = new Koa();

app.use(serve('./public'));
app.keys = ['current_user'];

app.use(function* fn(next) {
  const cookies = this.cookies;
  if (cookies.get('currentUser')) {
    const token = cookies.get('currentUser');
    loginActions.update({ token });
  }

  yield next;
});


app
  .use(Routing.routes())
  .use(Routing.allowedMethods());

if (!module.parent) {
  process.env.PORT = 5999;
  app.listen(process.env.PORT, () => {
    const delay = new Date() - startTime;
    console.log(`\x1b[32m READY on docker:${process.env.PORT} on ${delay / 1000.0} seconds \x1b[0m`);
  });
}
module.exports = app;


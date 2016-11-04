// require('es6-promise').polyfill();
/* eslint global-require: 0 */
require('isomorphic-fetch');
const queryString = require('query-string');

class ApiFactory {
  static request(url, optionsParam, auth = false, action = null) {
    const options = optionsParam;
    if (!options.headers) options.headers = {};
    if (auth) options.headers.Authorization = auth;

    return new Promise((resolve, reject) => {
      fetch(url, options)
        .then((response) => {
          if (response.status >= 500) {
            reject(`Bad response (${response.status}) from ${url}`);
          }
          if (response.status === 401) {
            if (process.browser) {
              const Auth = require('./../auth');
              Auth.logout();
            }
            resolve([]);
          }
          return response.json();
        })
        .then((result) => {
          if (result.error) {
            reject(result.error);
          }
          if (action) action.update(result.data);
          resolve(result.data);
        });
    });
  }
  static url(resource) {
    return `http://ec2-52-67-130-62.sa-east-1.compute.amazonaws.com:3000/api/${resource}`;
  }

  static create(resource, data, auth = null, action = null) {
    const options = {
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        'Cache-Control': 'no-cache',
        'Content-Length': JSON.stringify(data).length,
      },
      method: 'POST',
      body: JSON.stringify(data),
    };
    return ApiFactory.request(ApiFactory.url(resource), options, auth, action);
  }

  static destroy(resource, auth = null, action = null) {
    const options = {
      method: 'DELETE',
    };
    return ApiFactory.request(ApiFactory.url(resource), options, auth, action);
  }

  static list(resource, data, auth = null, action = null) {
    const options = {
      method: 'GET',
    };
    const qs = queryString.stringify(data);
    const url = `${ApiFactory.url(resource)}?${qs}`;
    return ApiFactory.request(url, options, auth, action);
  }
}

module.exports = ApiFactory;

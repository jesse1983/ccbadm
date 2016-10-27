// require('es6-promise').polyfill();
/* global fetch */
require('isomorphic-fetch');

class ApiFactory {
  static request(url, options, auth) {
    if (!options.headers) options.headers = {};
    if (auth) options.headers.Authorization = auth;
    return new Promise((resolve, reject) => {
      fetch(url, options)
        .then((response) => {
          if (response.status >= 500) {
            reject(`Bad response (${response.status}) from ${url}`);
          }
          return response.json();
        })
        .then((result) => {
          if (result.error) {
            reject(result.error);
          }
          resolve(result.data);
        });
    });
  }
  static url(resource) {
    return `http://ec2-52-67-130-62.sa-east-1.compute.amazonaws.com:3000/api/${resource}`;
  }
  static create(resource, data, auth = null) {
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
    return ApiFactory.request(ApiFactory.url(resource), options, auth);
  }
  static list(resource, data, auth = null) {
    const options = {
      method: 'GET',
      data: data,
    };
    return ApiFactory.request(ApiFactory.url(resource), options, auth);
  }
}

module.exports = ApiFactory;

var env, yml;

yml = {
  development: {
    API_URL: "http://localhost:3000"
  },
  production: {
    API_URL: "http://ec2-52-67-130-62.sa-east-1.compute.amazonaws.com:3000"
  }
};

if (window.location.host.indexOf("localhost") > -1 || window.location.host.indexOf("docker") > -1 || window.location.host.indexOf("127") > -1) {
  env = "development";
} else {
  env = "production";
}

angular.module('CCBApp').constant('CONSTANTS', {
  API_URL: yml[env].API_URL
});

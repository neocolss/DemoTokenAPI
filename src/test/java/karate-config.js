function fn() {
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);
  var env = karate.env; // get system property 'karate.env'
  var os = karate.os;
  karate.log('karate.env system property was:', env);
  karate.log("Your OS Is", os);

  if (!env) {
    env = 'dev';

  }
  var config = {
    env: env,
    baseUrl: 'http://localhost:49153',
    os: os
  }
  return config;
}
function() {

  var config = {

      baseHostname: karate.properties['base.hostname'] || 'http://localhost:3000' ,
      emailRecipient: 'jantest@mailinator.com'

  };

  // don't waste time waiting for a connection or if servers don't respond
  // within 5 seconds

  karate.configure('connectTimeout', 7000);
//  time-out if the response is not received within 10 seconds (after the connection is established)
  karate.configure('readTimeout', 10000);
//  enable ssl (and no certificate is required)
  karate.configure('ssl', true)
//  pretty print the response payload
  karate.configure('logPrettyResponse', true)


//    # proxy which needs authentication
//    * configure proxy = { uri: 'http://my.proxy.host:8080', username: 'john', password: 'secret' }


    return config;

}
## Rails LDAP example

This repo contains a sample Rails 4 app that integrates with LDAP using the **net-ldap** gem.

### Usage

1. Clone the repo locally
1. run ```bundle install```
1. run rails s
1. visit http://localhost:3000/

### Results
You should see a table of results that have been queried from a test LDAP server

### Implementation
* Initial LDAP configuration is in config/initializers/ldap.rb
* LDAP query is in app/controllers/ldap_controller.rb
* LDAP result processing is in app/views/ldap/index.html.rb

### BONUS: QuotaGuard Static LDAP test
[QuotaGuard Static](http://www.quotaguard.com/static-ip) is a hosted proxy service that allows you to route outbound traffic through a static IP address. If you want to route LDAP traffic through a static IP address can use our SOCKS5 proxy via our socksify wrapper script.

Installation instructions can be found on the [QuotaGuard Static Documentation](http://www.quotaguard.com/docs). Once you have signed up for a QuotaGuard Static account, followed the SOCKS setup instructions and set the QUOTAGUARDSTATIC_URL environment variable locally you can route LDAP traffic through our proxy:

```bin/qgsocksify rails s```

Accessing http://localhost:3000/ you should now see the originating IP is one of your QuotaGuard Static IP addresses. This means you are successfully routing traffic via the proxy.

If you only want to route LDAP traffic through the proxy you should specify an IP range mask for your LDAP serve like this:

```export QUOTAGUARDSTATIC_MASK=88.80.186.16/32```

(This is the IP address of the test LDAP server we are using: ldap.testathon.net)

Now if you run 

```bin/qgsocksify rails s```

Accessing http://localhost:3000/ you should now see the originating IP as your own local IP address.

## Acknowledgments
The LDAP test server is kindly provided by [Stephen Lewis](http://blog.stuartlewis.com/2008/07/07/test-ldap-service/comment-page-4/).
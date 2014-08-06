$ldap = Net::LDAP.new  :host => "ldap.testathon.net",
                      :port =>389,
                      :base => "ou=Users,dc=testathon,dc=net",
                      :auth => {
                        :method => :simple,
                        :username => "CN=stuart,OU=Users,DC=testathon,DC=net",
                        :password => "stuart"
                      }
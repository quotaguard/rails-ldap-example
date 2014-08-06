require "rest-client"

res = RestClient.get("http://ip.jsontest.com")

puts "Your Static IP is: #{res.body}"

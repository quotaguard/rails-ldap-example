class LdapController < ApplicationController
  def index
  	filter = Net::LDAP::Filter.eq("objectClass", "inetOrgPerson")
	@results = $ldap.search(:filter => filter, :attributes => nil)

	#For QuotaGuard Static testing purposes check if HTTP traffic routed through Static IP
	@ip = get_ip
  end

  def get_ip
	res = RestClient.get("http://ip.jsontest.com")
  	JSON.parse(res)["ip"]
  end
end

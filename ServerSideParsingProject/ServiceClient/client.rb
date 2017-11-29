require 'rubygems'
require 'open-uri'
require 'savon'
require 'nokogiri'


module DataGetter
class Client
  def initialize(username)
    @username = username
  end

def username_profil_pic_url_twitter
    client = Savon.client(wsdl: 'http://localhost:8080/pubws?wsdl')
    client.operations
    response2 = client.call(:get_twitter, message: { "arg0": @username})
  return response2.body[:get_twitter_response][:return]
end

def username_profil_pic_url_instagram
    client = Savon.client(wsdl: 'http://localhost:8080/pubws?wsdl')
    client.operations
    response1 = client.call(:get_instagram, message: { "arg0": @username})
  return response1.body[:get_instagram_response][:return]
end
end
end

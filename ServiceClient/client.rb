require 'rubygems'
require 'open-uri'
require 'savon'
require 'nokogiri'
require "json"

module DataGetter
class Client
  def initialize(username , social)
    @username = username
    @social = social
  end

def username_profil_pic_url_twitter
  webservice()
  return twitterImageContent()
end

def username_profil_pic_url_instagram
  webservice()
  return instagramImageContent()
end

# ----------WebServiceClient-----------------------
def webservice
    client = Savon.client(wsdl: 'http://localhost:8080/pubws?wsdl')
    client.operations

    if @social=="instagram"
      response1 = client.call(:get_ins_pic, message: { "arg0": @username })
      if response1.success?
        @instagramURL = response1.body[:get_ins_pic_response][:return]
      end
    end
    if @social=="twitter"
        response2 = client.call(:get_twit_pic, message: { "arg0": @username })
        if response2.success?
          @twitterURL = response2.body[:get_twit_pic_response][:return]
        end
    end
end
# --------------------------------------------------
# --------------Instagram Image Content-------------
def instagramImageContent
  docinsta = Nokogiri::HTML(open(@instagramURL))
  instagram_content = docinsta.search("script:contains('_sharedData')").text
  instagram_content = instagram_content.split('._sharedData = ')[1][0..-2]
  instagram_profile_pic = JSON.parse(instagram_content)
  return instagram_profile_pic["entry_data"]["ProfilePage"][0]["user"]["profile_pic_url"]
end
# ---------------------------------------------------
# --------------Twitter Image Content-------------
def twitterImageContent
  doctwit = Nokogiri::HTML(open(@twitterURL))
  return doctwit.css("img.ProfileAvatar-image")[0]['src']
end
end
end

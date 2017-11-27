require 'sinatra'
require 'sinatra/base'
require './client.rb'

set :bind, '0.0.0.0'
set :port, 9494
# set :static, true
# set :public_folder, "static"
set :views, "views"

module WebServiceClient
  class ClientUser < Sinatra::Base

    get '/' do
      erb :index
    end

    post '/profiles/' do
      @username = params[:username]
      @social = params[:social]
      if @social=="twitter"
        client_username = DataGetter::Client.new(@username , @social)
        @show_pic = client_username.username_profil_pic_url_twitter
      elsif @social=="instagram"
        client_username = DataGetter::Client.new(@username , @social)
        @show_pic = client_username.username_profil_pic_url_instagram
      else
        "Erik Dalı Gevrektir :D"
      end
      erb :show
      end
      not_found do
        status 404
        erb :page_404
      end
    end
  end

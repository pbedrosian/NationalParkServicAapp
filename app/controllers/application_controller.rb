require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end
  

  get "/" do
    if Helpers.is_logged_in?(session)
      redirect '/parks'
    else
      erb :welcome
    end
  end
end

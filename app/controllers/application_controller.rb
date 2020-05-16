require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
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

  get '/test' do
    erb :'/failures/login_general.html'
  end


end

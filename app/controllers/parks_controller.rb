class ParksController < ApplicationController

  get '/parks' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @parks = @user.parks.all
      erb :"/parks/index.html"
    else
      redirect '/'
    end
  end

  get '/parks/new' do
    if Helpers.is_logged_in?(session)
      erb :"/parks/new.html"
    else
      redirect '/'
    end
  end

  post '/parks' do
    user = Helpers.current_user(session)
    park = user.parks.new(params)
    park.save
    redirect to "/parks/#{park.id}"
  end

  get '/parks/:id' do
    if Helpers.is_logged_in?(session)
      if @park = Helpers.get_park(params,session)
        erb :"/parks/show.html"
      else
        erb :'/failures/locate_park_error.html' 
      end
    else 
      redirect '/'
    end
  end

  get '/parks/:id/edit' do
    if Helpers.is_logged_in?(session)
      if @park = Helpers.get_park(params,session)
        erb :"/parks/edit.html"
      else
        erb :'/failures/locate_park_error.html'
      end
    else
      redirect '/'
    end
  end

  patch "/parks/:id" do
    @park = Park.find(params[:id])
    @park.name = params[:name]
    @park.city = params[:city]
    @park.state = params[:state]
    @park.notes = params[:notes]
    @park.date_visited = params[:date_visited]
    @park.save
    redirect to "/parks/#{@park.id}"
  end

  delete "/parks/:id/delete" do
    Park.find(params[:id]).delete
    redirect "/parks"
  end
end

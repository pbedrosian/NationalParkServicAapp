class ParksController < ApplicationController

  get '/parks' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    user = Helpers.current_user(session)
    @parks = user.parks.all
    erb :"/parks/index.html"
  end

  get '/parks/new' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    erb :"/parks/new.html"
  end

  post '/parks' do
    user = Helpers.current_user(session)
    @park = user.parks.new(params)
    if @park.save
    redirect to "/parks/#{user.parks.count}"
    else
      erb :'/parks/new.error.html'
    end
  end

  get '/parks/:id' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    if @park = Helpers.get_park(params,session)
      erb :"/parks/show.html"
    else
      erb :'/failures/locate_park_error.html' 
    end
  end

  get '/parks/:id/edit' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    @id = params[:id]
    @user = Helpers.current_user(session)
    if @park = Helpers.get_park(params,session)
      erb :"/parks/edit.html"
    else
      erb :'/failures/locate_park_error.html'
    end
  end

  patch "/parks/:id" do
    @park = Helpers.get_park(params,session)
    @park.name = params[:name]
    @park.city = params[:city]
    @park.state = params[:state]
    @park.notes = params[:notes]
    @park.date_visited = params[:date_visited]
    if @park.save
      redirect to "/parks/#{params[:id]}"
    else
      erb :'/parks/edit.error.html'
    end
  end

  delete "/parks/:id/delete" do
    Park.find(params[:id]).delete
    redirect "/parks"
  end
end

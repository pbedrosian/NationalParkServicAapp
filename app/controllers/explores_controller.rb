class ExploresController < ApplicationController

  get '/explore' do
    erb :"/explores/index.html"
  end

  get '/explore/:state' do
    API.clear_parks
    @parks = API.info(params[:state]).flatten
    erb :'/explores/show.html'
  end

  post '/explore/:state' do
  end

end

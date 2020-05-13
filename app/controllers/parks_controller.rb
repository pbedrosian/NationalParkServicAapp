class ParksController < ApplicationController

  get '/parks' do
    erb :"/parks/index.html"
  end

  #brings users to form to create new park 
  get '/parks/new' do
    erb :"/parks/new.html"
  end

  #responds to the form and create a new instance and persists to database
  post '/parks' do
    @park = Park.new(params)
    @park.save
    redirect to "/parks/#{@park.id}"
  end

  # get request to retreive individual parks data
  get '/parks/:id' do
    @park = Park.select {|p| p.id == params[:id].to_i}.first
    erb :"/parks/show.html"
  end

    # retreives form to edit the park data (filled with previous data)
  get '/parks/:id/edit' do
    @park = Park.select {|p| p.id == params[:id].to_i}.first
    erb :"/parks/edit.html"
  end

  patch "/parks/:id" do
    @park = Park.find(params[:id])
    @park.name = params[:name]
    @park.city = params[:city]
    @park.state = params[:state]
    @park.notes = params[:notess]
    @park.date_visited = params[:date_visited]
    @park.save

    redirect to "/parks/#{@park.id}"
  end

  delete "/parks/:id/delete" do
    Park.find(params[:id]).delete
    redirect "/parks"
  end
end

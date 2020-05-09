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
    @park = Park.create(name: params[:park_name], city: params[:city], state: params[:state], notes: params[:notes])
    erb :'/parks/show.html'
  end

  # post "/parks" do
  #   redirect "/parks"
  # end

  # get request to retreive individual parks data
  get '/parks/:id' do
    @park = Park.select {|p| p.id == params[:id].to_i}.first
    erb :"/parks/show.html"
  end

  # retreives form to edit the park data (filled with previous data)
  get '/parks/:id/edit' do
    # binding.pry
    @park = Park.select {|p| p.id == params[:id].to_i}.first
    erb :"/parks/edit.html"
  end

  post '/parks/:id' do
    @park = Park.find(params[:id].to_i)
    # binding.pry
    @park.update(name: params[:park_name], city: params[:city], state: params[:state], notes: params[:notes])
    erb :"/parks/show.html"
  end

  # PATCH: /parks/5
  patch "/parks/:id" do
    redirect "/parks/:id"
  end

  # DELETE: /parks/5/delete
  delete "/parks/:id/delete" do
    redirect "/parks"
  end
end

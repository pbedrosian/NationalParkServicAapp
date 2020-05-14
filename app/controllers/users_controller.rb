class UsersController < ApplicationController

  get '/login' do
    erb :'/users/login.html'
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/parks"
    else
      redirect to "/failure"
    end
  end

  get '/signup' do
    erb :'/users/signup.html'
  end

  post '/signup' do
    if params[:email] == "" || params[:password] == ""
      redirect '/failure'
    else
      @user = User.new(email: params[:email], 
      password: params[:password],
      first_name: params[:first_name],
      last_name: params[:last_name])
      @user.save
      session[:user_id] = @user.id
      redirect '/parks'
    end
  end

  get '/logout' do
    session.clear

    redirect '/'
  end

  get '/failure' do
    erb :'/users/failure.html'
  end

end

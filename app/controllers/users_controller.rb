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
      erb :'/failures/login_failure.html'
    end
  end

  get '/signup' do
    erb :'/users/signup.html'
  end

  post '/signup' do
    if params[:email] == "" || params[:password] == ""
      erb :'/failures/signup_missing_info.html' #needs at least an email and password
    elsif Helpers.get_email(params)
      erb :'/failures/signup_email_exists.html' #email already taken
    elsif !Helpers.confirm_password(params)
      erb :'/failures/signup_pass_missmatch.html'
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

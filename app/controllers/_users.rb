
get '/register' do

  erb :register
end

post '/register' do
  user = User.create(params[:user])
  session[:id] = user.id
  redirect "/users/#{user.id}"
  # create new User object
  # session to remember user logged in
  # redirect to '/users/:id'
end

get '/login' do
  # retrieve information
  # validate user login 
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])

  if @user.nil?
    redirect '/login'
  else
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @urls = @user.urls
  # display user infomration 
  # links to my link information pages
  erb :user
end

get '/logout' do
  session[:id] = nil

  redirect '/login'
end

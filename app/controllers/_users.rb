
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

get '/users/:id' do
  
  # display user infomration 
  # links to my link information pages
  erb :user
end

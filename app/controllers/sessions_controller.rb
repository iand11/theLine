get '/sessions' do
  erb :'/sessions/new'
end

post '/sessions' do
  login
  if logged_in?
    session[:id]
    redirect "/users/#{@user.id}"
  else
    @errors= ['Incorrect login information']
    erb :'/sessions/new'
  end
end

get '/logout' do
  logout
  redirect '/'
end
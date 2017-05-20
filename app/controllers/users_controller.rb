get '/users/new' do
  erb :'/users/new'
end

post "/users" do
  user = User.new(params[:user])
  user.password= params[:password_string]
  if user.save
    login(user)
    redirect "/users/#{user.id}"
  else
    status 422
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
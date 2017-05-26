post '/sports/search' do 
  search_string = params[:player_name]
  @results = SportsAdapter.new.search(search_string)
  @player = @results["player"]
  @stats = @results["stats"]
  erb :index
end




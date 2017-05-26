post '/sports/search' do 
  search_string = params[:player_name]
  @results = SportsAdapter.new.search(search_string)
  if @results == nil
    @errors = ['Incorrect spelling of player name!']
    erb :index
  else
    @player = @results["player"]
    @stats = @results["stats"]
    erb :index
  end
end




post '/sports/search' do 
  player = params[:player_name]
  @league = params[:league]
  @results = SportsAdapter.new.search(player, @league)
  if @results == nil
    @errors = ['Incorrect spelling of player name or wrong league search!']
    erb :index
  else
    @player = @results["player"]
    @stats = @results["stats"]
    erb :index
  end
end




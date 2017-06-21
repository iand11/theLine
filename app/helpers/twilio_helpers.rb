helpers do 

  def text_in(body)
    league = body[0..2]
    player = body[4..-1]

    @results = SportsAdapter.new.search(player, league)
    @results
  end

end 
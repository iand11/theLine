require 'HTTParty'

class SportsAdapter
  include HTTParty

  def search(player, league)
   if player.include? " "
    player_name = player.split(" ").join("-")
  else
    player_name = player
  end

    my_query = {
        "player" => player_name 
    }
    

    # @sports_type = params[:sports_type]
    sports_type = league


    if sports_type == "nfl"
      request = HTTParty.get('https://www.mysportsfeeds.com/api/feed/pull/nfl/2016-regular/cumulative_player_stats.json?playerstats=Att,Comp,Yds,TD',
                             :headers =>{'Content-Type' => 'application/json' , 'authorization' => ENV['API_AUTH_KEY']},
                             :query => my_query)

    elsif sports_type == "nhl"
      request = HTTParty.get('https://www.mysportsfeeds.com/api/feed/pull/nhl/2016-regular/cumulative_player_stats.json?playerstats=G,A,Pts,Sh',
                            :headers =>{'Content-Type' => 'application/json' , 'authorization' => ENV['API_AUTH_KEY']},
                            :query => my_query )

    elsif sports_type == "nba"
      request = HTTParty.get("https://www.mysportsfeeds.com/api/feed/pull/nba/2016-regular/cumulative_player_stats.json?playerstats=2PA,2PM,3PA,3PM,FTA,FTM",
                            :headers =>{'Content-Type' => 'application/json' , 'authorization' => ENV['API_AUTH_KEY']},
                            :query => my_query )

    elsif sports_type == "mlb"
      request = HTTParty.get("https://www.mysportsfeeds.com/api/feed/pull/mlb/2016-regular/cumulative_player_stats.json?playerstats=AB,H,R,HR,ER",
                            :headers =>{'Content-Type' => 'application/json' , 'authorization' => ENV['API_AUTH_KEY']},
                            :query => my_query )

    else
      request = "Choose correct type"
    end
    if player_name == "" || request.parsed_response["cumulativeplayerstats"]["playerstatsentry"] == nil
      return nil
    else
      request.parsed_response["cumulativeplayerstats"]["playerstatsentry"][0]
    end
  end

end
helpers do
  def batting_avg
    (@stats["Hits"]["#text"]) / (@stats["AtBats"]["#text"])
  end
end
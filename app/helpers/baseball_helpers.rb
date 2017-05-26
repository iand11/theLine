helpers do
  def batting_avg
    start = (((@stats["Hits"]["#text"]).to_f)*10) / ((@stats["AtBats"]["#text"]).to_f)
    start = start.to_s.delete '.'
    ba = start.insert(0, '.')
    ba[0..3]
  end
end
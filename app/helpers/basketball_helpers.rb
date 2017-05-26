helpers do 
  def fg_percentage
    start = (((@stats["Fg2PtMade"]["#text"]).to_f)*10) / ((@stats["Fg2PtAtt"]["#text"]).to_f)
    start = start.to_s.delete '.'
    fg = start.insert(2, '.')
    final = fg[0..3]  + "%"
  end

  def three_pt_percentage
    start = (((@stats["Fg3PtMade"]["#text"]).to_f)*10) / ((@stats["Fg3PtAtt"]["#text"]).to_f)
    start = start.to_s.delete '.'
    fg = start.insert(2, '.')
    fg[0..3] + "%"
  end
end
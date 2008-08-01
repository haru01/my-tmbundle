ENV["TM_CURRENT_WORD"].split("_").each{|word|
  `open "http://eow.alc.co.jp/#{word}/UTF-8"` 
}


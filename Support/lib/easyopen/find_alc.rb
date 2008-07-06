# gem install hpricot
require 'open-uri'
require 'rubygems'
require 'hpricot'

def find_alc(word)
  url = "http://eow.alc.co.jp/#{word}/UTF-8"
  doc = Hpricot(open(url))
  (doc/"#resultArea")
end

#result = `curl -i http://eow.alc.co.jp/$TM_CURRENT_WORD/UTF-8`
ENV["TM_CURRENT_WORD"].split("_").each{|word|
  puts find_alc(word)
}

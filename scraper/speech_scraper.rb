require 'nokogiri'
require 'open-uri'
require 'pry-debugger'

url = 'html/get_urls.html'
doc = Nokogiri::HTML(open(url))

# speeches = doc.css('#listing')

# speeches.each do |speech|
#   # binding.pry
#   puts speech.css('.president').text.strip
#   puts speech.css('.title').text.strip
# end

# gets all urls for speeches
speech_url_arr = doc.css('#listing .title a').map { |link| link['href'] }
puts speech_url_arr

1.times do |speech|
  speech.css('.')
end


# speech_urls.each do |speech|
#   Nokogiri::HTML(open(speech))
#   puts speech
# end



# puts doc

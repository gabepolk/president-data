require 'nokogiri'
require 'open-uri'
require 'pry-debugger'

speech_urls = 'html/get_urls.html'
doc1 = Nokogiri::HTML(open(speech_urls))

# speeches = doc1.css('#listing')

# speeches.each do |speech|
#   # binding.pry
#   puts speech.css('.president').text.strip
#   puts speech.css('.title').text.strip
# end

# gets all urls for speeches
speech_url_arr = doc1.css('#listing .title a').map { |link| link['href'] }
puts speech_url_arr

# 1.times do |speech|
#   speech.css('.')
# end

speech_transcript = 'html/get_speech.html'
doc2 = Nokogiri::HTML(open(speech_transcript))

# binding.pry
speech = doc2.at_css('#innercontent h1').text.strip
president = doc2.at_css('#innercontent h2').text.strip
transcript = doc2.at_css('#innercontent #transcript').text.strip

File.open("output/#{president.gsub(/\s+/, "").downcase} - #{speech.downcase}.txt", "w") do |f|
  f.write("#{president}\n#{transcript}")
end


# speech_url_arr.each do |speech|
#   puts doc2.css('#innercontent')
# end







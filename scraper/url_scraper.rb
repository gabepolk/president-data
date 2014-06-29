require 'nokogiri'
require 'open-uri'
require 'pry-debugger'
require 'json'

speech_urls = 'html/get_urls.html'
doc1 = Nokogiri::HTML(open(speech_urls))

# gets all urls for speeches
speech_url_arr = doc1.css('#listing .title a').map { |link| link['href'] }
puts speech_url_arr.count

speech_url_arr.each_with_index do |speech, i|
  speech_transcript = speech
  doc2 = Nokogiri::HTML(open(speech_transcript))

  president = doc2.at_css('#innercontent h2').text.strip
  speech = doc2.at_css('#innercontent h1').text.strip.split(" (").first
  transcript = doc2.at_css('#innercontent #transcript').text.strip
  date = doc2.at_css('#innercontent h1').text.strip.split("(").last[0...-1]

  # create .txt file with correct title
  File.open("output/#{president.gsub(/[\s+\/-]/, "_").downcase + i.to_s}.txt", "w") do |f|
    f.write("{title} #{speech} {/title}\n{speaker} #{president} {/speaker}\n{date} #{date} {/date}\n\n{speech}\n\n#{transcript}\n\n{/speech}")
  end
end

require 'pry-debugger'
require 'time'

# create hash to store stats
stats = Hash.new(0)

# loop through speeches
Dir.glob("../scraper/output/*.txt") do |filename|

  # create file object named file
  file = File.new(filename).read

  # parse metadata
  president = file[/(?<={speaker}).*(?={\/speaker})/].strip
  title = file[/(?<={title}).*(?={\/title})/].strip
  date = Time.parse(file[/(?<={date}).*(?={\/date})/].strip)
  # transcript = [/(?<={speech}).*(?={\/speech})/].strip

  # remove metadata from file
  file_without_metadata = file.gsub(/({title}).*({\/title})/, "").gsub(/({speaker}).*({\/speaker})/, "").gsub(/({date}).*({\/date})/, "").gsub(/({speech})/, "").gsub(/({\/speech})/, "")

  # create array of words from speech
  speech_arr = file_without_metadata.gsub(/[^\w\s]/, "").split(" ")

  # create array of stop words
  stop_words = %w{ a's able about above according accordingly across actually after afterwards again against ain't all allow allows almost alone along already also although always am among amongst an and another any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are aren't around as aside ask asking associated at available away awfully be became because become becomes becoming been before beforehand behind being believe below beside besides best better between beyond both brief but by c'mon c's came can can't cannot cant cause causes certain certainly changes clearly co com come comes concerning consequently consider considering contain containing contains corresponding could couldn't course currently definitely described despite did didn't different do does doesn't doing don't done down downwards during each edu eg eight either else elsewhere enough entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example except far few fifth first five followed following follows for former formerly forth four from further furthermore get gets getting given gives go goes going gone got gotten greetings had hadn't happens hardly has hasn't have haven't having he he's hello help hence her here here's hereafter hereby herein hereupon hers herself hi him himself his hither hopefully how howbeit however i'd i'll i'm i've ie if ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into inward is isn't it it'd it'll it's its itself just keep keeps kept know knows known last lately later latter latterly least less lest let let's like liked likely little look looking looks ltd mainly many may maybe me mean meanwhile merely might more moreover most mostly much must my myself name namely nd near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor normally not nothing novel now nowhere obviously of off often oh ok okay old on once one ones only onto or other others otherwise ought our ours ourselves out outside over overall own particular particularly per perhaps placed please plus possible presumably probably provides que quite qv rather rd re really reasonably regarding regardless regards relatively respectively right said same saw say saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent serious seriously seven several shall she should shouldn't since six so some somebody somehow someone something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such sup sure t's take taken tell tends th than thank thanks thanx that that's thats the their theirs them themselves then thence there there's thereafter thereby therefore therein theres thereupon these they they'd they'll they're they've think third this thorough thoroughly those though three through throughout thru thus to together too took toward towards tried tries truly try trying twice two un under unfortunately unless unlikely until unto up upon us use used useful uses using usually value various very via viz vs want wants was wasn't way we we'd we'll we're we've welcome well went were weren't what what's whatever when whence whenever where where's whereafter whereas whereby wherein whereupon wherever whether which while whither who who's whoever whole whom whose why will willing wish with within without won't wonder would would wouldn't yes yet you you'd you'll you're you've your yours yourself yourselves zero to in a I me we us you she her he him it they them that which who whom whose whichever whoever whomever this these those anybody anyone anything each either everybody everyone everything neither nobody no one nothing somebody someone something both few many several all any most none some myself ourselves yourself yourselves himself herself itself themselves what my your his its our their ours yours theirs mine hers for and nor but or yet so if lest once only if after although as since on of the was is with not by be have Mr been has from are will at more }

  # remove stop words from speech
  ignore_me, result = {}, []
  stop_words.each { |w| ignore_me[w.downcase] = :stop_words }
  speech_arr.each { |w| result << w unless ignore_me[w.downcase[/\w*/]] }
  result.join(" ")

  # create hash of words sorted by frequency
  word_frequency = Hash.new(0)
  result.each { |word| word_frequency[word] += 1 }
  sorted_arr = word_frequency.sort_by {|key, value| value}.reverse
  # p sorted_arr

  # count unique words
  unique_words_count = result.uniq.count
  # p unique_words_count

  # count total words
  total_word_count = result.count
  # p total_word_count

  # add stats to hash
  if stats[president] == 0
    stats[president] = {total_unique_words: unique_words_count, total_word_count: total_word_count, date: date}
  else
    stats[president][:total_unique_words] = stats[president][:total_unique_words] += unique_words_count
    stats[president][:total_word_count] = stats[president][:total_word_count] += total_word_count
  end

end

# write output to file
File.open("output/stats.txt", "w") do |f|
  f.write("#{stats}")
end

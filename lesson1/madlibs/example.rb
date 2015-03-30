# command line: ruby example.rb sample.txt


nouns = File.open('nouns.txt', 'r') do |file|
  file.read
end.split

verbs = File.open('verbs.txt', 'r') do |file|
    file.read
end.split

adjectives = File.open('adjectives.txt', 'r') do |file|
    file.read
end.split

def exit_with(msg)
  puts "Error: #{msg}"
  exit
end

exit_with("arguments not found") if ARGV.empty?
exit_with("file not found") if !File.exist?(ARGV[0])

contents = File.open(ARGV[0], 'r') do |file|
  file.read
end

dictionary = {
  nouns: nouns,
  verbs: verbs,
  adjectives: adjectives
}

contents.gsub!('NOUN') { dictionary[:nouns].sample }
contents.gsub!('VERB') { dictionary[:verbs].sample }
contents.gsub!('ADJECTIVE') { dictionary[:adjectives].sample }
puts contents


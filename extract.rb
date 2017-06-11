# run: ruby extract.rb
require 'open-uri'
require 'json'

content  = open('http://www.hikeandfly.info/hikeandfly/home.aspx') {|f| f.read }
a = content.scan(/^setMarker\(.+, '(.+)', '(.+)', '(.+)', '(.+)', '(.+)', (\d)\)/)
File.open("./markers.js","w") do |f|
  f.write("markers = "+a.to_json)
end

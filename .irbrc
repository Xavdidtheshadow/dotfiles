require 'irb/completion'
require 'map_by_method'
require 'pp'
IRB.conf[:AUTO_INDENT]=true

def envparse
    File.readlines(".env").each do |line|
        values = line.strip.gsub('"','').split("=")
        ENV[values[0]] = values[1]
    end
end

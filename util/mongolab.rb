#!/usr/bin/env ruby

# reads the current directory for a .env file with the key MONGOLAB_URI and parses it into what can be passed as an argument into the mongo CLI tool

def mongoize(uri)
    re = uri.match(/db:\/\/(\w*):(\w*)@(.*)$/)

    u = re[1]
    p = re[2]
    base = re[3]

    new_uri = "#{base} -username #{u} -password #{p}"
    
    puts new_uri
end

begin
    f = File.open('./.env')
rescue
    exit
end

f.each do |line|
    l = line.split('=') 
    if ARGV[0] == 'test'
        s = 'MONGOLAB_TEST_URI'
    else
        s = 'MONGOLAB_URI'
    end
    if l.first == s 
        mongoize(l.last.gsub('"',''))
        break
    end
end


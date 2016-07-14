require 'melonsmasher/pokemon_go_status/version'

require 'net/http'

module Pokemon_Go_Status
  times = []
  total_time = 0

  (0..9).each do |i|
    start = Time.now
    Net::HTTP.get_response(URI('https://pgorelease.nianticlabs.com/plfe/'))
    finish = Time.now
    response_time = (finish - start) * 1000
    times[i] = response_time.round
    total_time = total_time + response_time.round
  end

  avg_ms = total_time / times.count

  if avg_ms === -1
    info = [3, 'Error! Probably not a good sign, but try again.']
  elsif avg_ms < 800
    info = [0, 'All good! Go catch\'em all!']
  elsif avg_ms >= 800 && avg_ms < 3000
    info = [1, 'Servers are slow. Your mileage may vary.']
  elsif avg_ms > 3000
    info = [2, 'Servers don\'t seem to be up.']
  else
    info = [3, 'Error! Probably not a good sign, but try again.']
  end

  puts "#{info[1]}\nAverage response time: #{avg_ms} ms."
  exit info[0]
end

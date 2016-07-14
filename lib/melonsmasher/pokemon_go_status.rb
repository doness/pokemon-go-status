require 'melonsmasher/pokemon_go_status/version'
require 'net/http'

module Pokemon_Go_Status
  class Status

    def interpret_response_average avg_ms
      if avg_ms === -1
        {
            :exit_code => 3,
            :description => 'Error! Probably not a good sign, but try again.',
            :avg_ms => avg_ms
        }
      elsif avg_ms < 800
        {
            :exit_code => 0,
            :description => 'All good! Go catch\'em all!',
            :avg_ms => avg_ms
        }
      elsif avg_ms >= 800 && avg_ms < 3000
        {
            :exit_code => 1,
            :description => 'Servers are slow. Your mileage may vary.',
            :avg_ms => avg_ms
        }
      elsif avg_ms > 3000
        {
            :exit_code => 2,
            :description => 'Servers don\'t seem to be up.',
            :avg_ms => avg_ms
        }
      else
        {
            :exit_code => 3,
            :description => 'Error! Probably not a good sign, but try again.',
            :avg_ms => avg_ms
        }
      end
    end

    def get_server_response_average url
      times = []
      total_time = 0
      (0..9).each do |i|
        start = Time.now
        Net::HTTP.get_response(URI(url))
        finish = Time.now
        response_time = (finish - start) * 1000
        times[i] = response_time.round
        total_time = total_time + response_time.round
      end
      total_time / times.count
    end

    def get_server_status url
      self.interpret_response_average self.get_server_response_average url
    end

  end
end

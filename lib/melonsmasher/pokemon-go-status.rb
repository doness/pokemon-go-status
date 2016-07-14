require 'melonsmasher/pokemon-go-status/version'
require 'net/http'

module PokemonGoStatus
  class Status

    def interpret_response_average avg_ms
      if avg_ms === -1
        {
            :exit_code => 3,
            :description => 'Error! Probably not a good sign, but try again.',
            :avg_ms => avg_ms,
            :available => false
        }
      elsif avg_ms < 800
        {
            :exit_code => 0,
            :description => 'All good! Go catch\'em all!',
            :avg_ms => avg_ms,
            :available => true
        }
      elsif avg_ms >= 800 && avg_ms < 3000
        {
            :exit_code => 1,
            :description => 'Servers are slow. Your mileage may vary.',
            :avg_ms => avg_ms,
            :available => true
        }
      elsif avg_ms > 3000
        {
            :exit_code => 2,
            :description => 'Servers don\'t seem to be up.',
            :avg_ms => avg_ms,
            :available => false
        }
      else
        {
            :exit_code => 3,
            :description => 'Error! Probably not a good sign, but try again.',
            :avg_ms => avg_ms,
            :available => false
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

    def get_server_status url = 'https://pgorelease.nianticlabs.com/plfe/'
      self.interpret_response_average self.get_server_response_average url
    end

  end
end

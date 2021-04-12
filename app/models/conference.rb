class Conference < ApplicationRecord
    def self.scraper 

        url = URI("https://sportspage-feeds.p.rapidapi.com/conferences?league=NBA")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = ENV['KEY']
        request["x-rapidapi-host"] = 'sportspage-feeds.p.rapidapi.com'

        response = http.request(request)
        data = response.read_body

        binding.pry
        Conference.new(data)
    end
end

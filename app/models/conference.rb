class Conference < ApplicationRecord

    validates :division, uniqueness: true


    def self.scraper(league)

        url = URI("https://sportspage-feeds.p.rapidapi.com/conferences?league=#{league}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = ENV['KEY']
        request["x-rapidapi-host"] = 'sportspage-feeds.p.rapidapi.com'

        response = http.request(request)
        data = response.read_body


        j = JSON[data]['results']

        j.map do |x|
            c = x['conference']
            d = x['division']
            l = x['league']
            Conference.create(division: d, league: l, conference: c)
        end  
    end
end

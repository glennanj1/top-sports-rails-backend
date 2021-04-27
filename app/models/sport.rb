class Sport < ApplicationRecord

    validates :key, uniqueness: true
    has_many :games


    def self.scraper
        binding.pry

        url = URI("https://odds.p.rapidapi.com/v1/sports")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = ENV['KEY']
        request["x-rapidapi-host"] = 'odds.p.rapidapi.com'

        response = http.request(request)
        data = response.read_body
    
        j = JSON[data]['data']
        j.map do |x|
            k = x['key']
            a = x['active']
            g = x['group']
            d = x['details']
            t = x['title']
            s = Sport.new(key: k, active: a, group: g, details: d, title: t)
            s.save
        end

    end
end

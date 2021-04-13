class Game < ApplicationRecord
  belongs_to :sport
  def self.scraper(key, id)
    url = URI("https://odds.p.rapidapi.com/v1/odds?sport=#{key}&region=us&mkt=h2h&dateFormat=iso&oddsFormat=american")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = ENV['KEY']
    request["x-rapidapi-host"] = 'odds.p.rapidapi.com'

    response = http.request(request)
  
    data = response.read_body
    j = JSON[data]['data']
    # j.map do |x|
    #   teams
    # end

    binding.pry
  end
end

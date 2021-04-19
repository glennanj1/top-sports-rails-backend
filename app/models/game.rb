class Game < ApplicationRecord
  belongs_to :sport
  has_many :bets

  validates :teams, uniqueness: true

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

    j.map do |x|
      sn = x['sport_nice']
      t = "#{x['teams'][0]} vs. #{x['teams'][1]}"
      t1 = x['teams'][0]
      t2 = x['teams'][1]
      ht = x['home_team']
      ct = x['commence_time']
      s = x['sites'][0]['site_nice']
      o1 = x['sites'][0]['odds']['h2h'][0]
      o2 = x['sites'][0]['odds']['h2h'][1]
      g = Game.new(sport_nice: sn, teams: t, home_team: ht, commence_time: ct, sites: s, odds: o1, odds1: o2, sport_id: id, team_1: t1, team_2: t2)
      
      g.save
    end
  end
end

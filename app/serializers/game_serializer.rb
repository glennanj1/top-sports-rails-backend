class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :sport_id, :sport_nice, :teams, :home_team, :commence_time, :sites, :odds, :odds1
end

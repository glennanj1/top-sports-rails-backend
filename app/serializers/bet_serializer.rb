class BetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :amount, :date, :odds, :game_id
end

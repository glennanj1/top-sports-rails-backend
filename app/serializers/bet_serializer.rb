class BetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :amount, :date, :odds
end

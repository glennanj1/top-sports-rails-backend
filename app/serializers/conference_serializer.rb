class ConferenceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :division, :league, :conference
end

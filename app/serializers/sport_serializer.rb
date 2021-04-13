class SportSerializer
  include FastJsonapi::ObjectSerializer
  attributes :key, :active, :group, :details, :title
end

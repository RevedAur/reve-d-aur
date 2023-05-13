FactoryBot.define do
  factory :size do
    name { Size.names.keys.sample }
    
  end
end

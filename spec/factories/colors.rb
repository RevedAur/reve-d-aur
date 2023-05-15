FactoryBot.define do
  factory :color do
    name { Color.names.keys.sample }
    
  end
end

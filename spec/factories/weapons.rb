FactoryBot.define do
  factory :weapon do
    attack_points   { 0}
    defense_points  { rand(5..50) }
    name { %w( vandal fantom ).sample }
  end
end
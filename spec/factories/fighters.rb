FactoryBot.define do
  factory :fighter do
    name { %w(Jett Phonix Reyna).sample}
    attack_points   { rand(25..150) }
    life_points  { rand(100..150) }
    experience_points { rand(5) }
  end
end

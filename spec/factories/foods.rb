FactoryBot.define do
  factory :food do
    name { Faker::Movies::StarWars.character }
    measure_unit { 'Teaspoon (tsp)' }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end

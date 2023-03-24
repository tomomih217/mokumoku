# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }

    trait :with_lang_ruby do
      language { 'Ruby' }
    end
    trait :with_lang_php do
      language { 'PHP' }
    end
  end
end

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "Test User #{n}" }
    sequence(:email) { |n| "test-#{n}@example.com" }
    # TODO: Password digest here?
  end
end

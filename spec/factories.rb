FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "Test User #{n}" }
    sequence(:email) { |n| "test-#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :link_page do
    user
    name { "Link Page" }
    sequence(:slug) { |n| "link-page-#{n}" }
  end

  factory :link do
    link_page
    sequence(:name) { "Some Link Name #{n}" }
    sequence(:url) { |n| "https://example.com/some/path/#{n}" }
  end
end

FactoryGirl.define do
  factory :user do
    email
    password              "12345678"
    password_confirmation "12345678"
  end

  factory :admin, parent: :user do
    role :admin
  end

  sequence(:email) { |i| "admin#{i}@estates.com" }
end


FactoryGirl.define do
  factory :user do
    name  "hello"
    email "example@gmail.com"
    password    "foobar"
    password_confirmation "foobar"
  end
end

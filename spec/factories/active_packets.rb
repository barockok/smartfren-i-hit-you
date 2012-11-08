# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :active_packet do
    code "MyString"
    expired "2012-11-08 01:17:44"
    will_expired "2012-11-08 01:17:44"
    association :client_number
  end
end

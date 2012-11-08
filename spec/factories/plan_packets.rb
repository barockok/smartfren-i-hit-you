# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plan_packet do
    code "MyString"
    client_number_id 1
    will_subscribe_at "2012-11-08 22:42:38"
    archive false
  end
end

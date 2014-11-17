FactoryGirl.define do
  factory :post do
    title 'Some title'
    content 'Some content'

    user
  end
end
FactoryGirl.define do
  factory :comment do
    content 'Some content'

    post
    user
  end
end
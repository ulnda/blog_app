FactoryGirl.define do
  factory :user do
    name 									'John Smith'
    login 								'somelogin'
    password 							'12345678'
    password_confirmation '12345678'

		sequence(:email) { |n| "test#{ n }@example.com" }
  end
end
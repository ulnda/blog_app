FactoryGirl.define do
  factory :user do
    name 									'John Smith'
    email 								'test@example.com'
    login 								'somelogin'
    password 							'12345678'
    password_confirmation '12345678'
  end
end
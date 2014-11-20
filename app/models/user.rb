class User < ActiveRecord::Base
	has_many :posts
	has_many :comments

	validates :name, presence: true

	devise :database_authenticatable, :rememberable
end

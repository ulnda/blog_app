class User < ActiveRecord::Base
	has_many :posts,		dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :name, presence: true

	devise :database_authenticatable, :rememberable
end

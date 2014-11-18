class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :title, :content, :user, presence: true

	default_scope -> { order(:id) }

	scope :reverse_order, -> { order("id DESC") }
end

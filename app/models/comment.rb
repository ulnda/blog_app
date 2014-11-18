class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :content, :user, :post, presence: true

	default_scope -> { order(:id) }

	scope :reverse_order, -> { order("id DESC") }
end

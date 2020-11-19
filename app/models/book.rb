class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy

	validates :title, :body, presence: true
	validates :body, length: {maximum: 200}

	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end

end
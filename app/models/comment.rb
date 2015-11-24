class Comment < ActiveRecord::Base
belongs_to :article
belongs_to :user
	validates :description, presence: true, length: { minimum: 20, maximum: 500 }
	validates :user_id, presence: true
	validates :article_id, presence: true
end
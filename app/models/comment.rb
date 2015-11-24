class Comment < ActiveRecord::Base
belongs_to :articles
	validates :description, presence: true, length: { minimum: 20, maximum: 500 }
	validates :user_id, presence: true
end
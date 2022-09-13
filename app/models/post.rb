class Post < ApplicationRecord
    belongs_to :user
    has_many :comments

    validates :subject, presence: true
    validates :body, presence: true
    validates :user_id, presence: true
end

class Secret < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :users_liked, through: :likes, source: :user

    validates :content,
                presence:true,
                length: {
                    minimum:1,
                    maximum:200
                }
end

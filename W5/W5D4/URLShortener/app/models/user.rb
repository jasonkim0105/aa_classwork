class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true

    has_many :submitted_urls
        primary_key :id,
        foreign_key :user_id,
        class_name :ShortedUrl
end
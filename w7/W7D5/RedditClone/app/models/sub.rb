class Sub < ApplicationRecord
    validates :description, :moderator_id, presence: true
    validates :title, presence: true, uniqueness: true

    belongs_to :moderator,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :User
end

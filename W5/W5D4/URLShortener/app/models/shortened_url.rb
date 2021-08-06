class ShortenedUrl <ApplicationRecord
  validates :short_url, uniqueness: true

  belongs_to :submitter
    primary_key :id,
    foreign_key :user_id,
    class_name :User
end
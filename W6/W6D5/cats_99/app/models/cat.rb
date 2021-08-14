require 'action_view'
class Cat < ApplicationRecord
include ActionView::Helpers::DateHelper

validates :birth_date, presence: true
validates :color, presence: true
validates :name, presence: true
validates :sex, presence: true, inclusion: { in: %w(M F), message: "%{value} is not a valid sex" }
validates :description, presence: true

def age
  time_ago_in_words(birth_date)
end

end
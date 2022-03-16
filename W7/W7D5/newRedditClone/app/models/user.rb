class User < ApplicationRecord
  validates :username, :password_digest, :session:token
end

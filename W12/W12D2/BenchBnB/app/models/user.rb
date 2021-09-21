# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  email           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :password_digest, :username, presence: true


  attr_reader :password
  #SPIRE

  after_initialize :ensure_session_token

  def self.find_by_credential(username,password)
    user = User.find_by(username:username)

    if user && user.is_password?(password)
      user      
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password);
  end

  def is_password?(password)
    password_obj = BCrypt::Password.new(self.password_digest)
    password_obj.is_password?(password)
  end


  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end


  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

end

class User < ApplicationRecord

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

  attr_reader :password

  # before_validation :ensure_session_token!
  after_initialize :ensure_session_token!

  has_many :cats,
    foreign_key: :user_id,
    class_name: :Cat

  has_many :cat_rental_requests,
    foreign_key: :user_id,
    class_name: :CatRentalRequest

  def password=(password)
	  self.password_digest = BCrypt::Password.create(password)
  	@password = password
  end
<<<<<<< HEAD

  def ensure_session_token!
    self.session_token ||= SecureRandom::urlsafe_base64
  end

=======
  
>>>>>>> c50ed4396161bbbac16f083e715ec50dd5ac6c55
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_password?(password)
      user
    else
      return nil
    end
  end
  
  def is_password?(password)
    password_object = BCrypt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end
  
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end
  
  def ensure_session_token!
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end


end

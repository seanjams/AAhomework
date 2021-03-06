class User < ActiveRecord::Base
  validates :user_name,
    :password_digest,
    :session_token,
    presence: true, uniqueness: true

  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    if user
      user.is_password?(password) ? user : nil
    end
  end

  has_many :cats,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Cat
end

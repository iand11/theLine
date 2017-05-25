class User < ActiveRecord::Base
  has_many :teams

  validates_presence_of :first_name, :last_name, :username
  validates_uniqueness_of :username 

  validate :plain_text_password

  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password_string = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end

  def plain_text_password
    if @password_string == ""
      errors.add(:password, " can't be empty")
    end
  end
end

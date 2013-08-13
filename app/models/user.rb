class User
  include MongoMapper::Document

  key :first_name,  String, :required =>  true
  key :last_name,   String, :required =>  true
  key :email,       String, :unique =>    true
  key :salt,        String, :required =>  true
  key :fish,        String, :required =>  true
  key :code,        String
  key :expires_at,  Time

  before_create :set_random_password
  before_save :encrypt_password

  attr_accessor :password, :password_confirmation

  def authenticate(password)
  	self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  def encrypt_password
  	unless password.blank?
  		self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end

  def set_random_password
  	if password.blank?
  		password = password_confirmation = BCrypt::Engine.generate_salt
  	end
  end
end

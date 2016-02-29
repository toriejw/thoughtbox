class User < ActiveRecord::Base
  has_secure_password

  def password_confirmed?
    
  end
end

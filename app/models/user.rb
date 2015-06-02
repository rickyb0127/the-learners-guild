class User < ActiveRecord::Base
  has_secure_password

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end
end

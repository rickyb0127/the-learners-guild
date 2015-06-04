class User < ActiveRecord::Base
  has_secure_password

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.city = auth.info.location
      user.password = auth.uid
      user.email = auth.info.email
      user.save!
    end
  end

  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end
end

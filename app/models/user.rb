class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize

    user.email      = auth.info.email
    user.first_name = auth.info.first_name
    user.image      = auth.info.image
    user.save

    user
  end
end

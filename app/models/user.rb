class User < ActiveRecord::Base
  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], Provider: auth_hash['provider'], Name: auth_hash['info']['name'])
    user.Address = auth_hash['info']['location']
    user.save!
    user
  end
end

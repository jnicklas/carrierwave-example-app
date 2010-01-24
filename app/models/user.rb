class User < ActiveRecord::Base
  attr_accessible :email, :avatar, :remote_avatar_url, :avatar_cache, :remove_avatar

  validates_presence_of :email

  mount_uploader :avatar, AvatarUploader
end

class User < ActiveRecord::Base
  #### Seguidos por el usuario
  has_many :followed_users, through: :followed_registers, source: :source_user
  has_many :followed_registers, class_name: "Follow", foreign_key: "target_user_id"

  #### Seguidores del usuario
  has_many :followers, through: :following_registers, source: :target_user
  has_many :following_registers, class_name: "Follow", foreign_key: "source_user_id"

  # Tweets del Usuario
  has_many :tweets
end

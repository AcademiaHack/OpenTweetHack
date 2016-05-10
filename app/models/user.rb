
class User < ActiveRecord::Base
  has_many :twits
  has_many :follows, class_name: "Follow", foreign_key: "user_target_id"
  has_many :followings, class_name: "Follow", foreign_key: "user_source_id"
  has_many :is_following, through: :follows, source: :user_source
  has_many :is_followed, through: :followings, source: :user_target  
end

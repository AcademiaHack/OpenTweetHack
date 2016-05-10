class Follow < ActiveRecord::Base
  belongs_to :user_target, class_name: "User"
  belongs_to :user_source, class_name: "User"

end

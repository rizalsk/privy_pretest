class UserBalance < ApplicationRecord
	belongs_to :user, class_name: "User", :foreign_key => "user_id"
	has_one :history, class_name: "UserBalanceHistory" 
	# named_scope :with_relate, :include => [:history, :user]
	scope :with_history, -> { includes(:history) } # use eager loading

end

class UserBalance < ApplicationRecord
	belongs_to :user, class_name: "User", :foreign_key => "user_id"
	has_one :history, class_name: "UserBalanceHistory" 
	scope :with_history, -> { includes(:history) }
end

class UserBalance < ApplicationRecord
	belongs_to :user, class_name: "User"
	has_one :history, class_name: "UserBalanceHistory"

end

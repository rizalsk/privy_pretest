class User < ApplicationRecord
    has_secure_password
	has_many :user_balance, class_name: "UserBalance"
end

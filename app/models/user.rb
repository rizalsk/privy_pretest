class User < ApplicationRecord
    has_secure_password
    validates :password, :confirmation =>true
    validates_confirmation_of :password
	has_many :user_balance, class_name: "UserBalance"
end

class UserBalanceHistory < ApplicationRecord
	enum type: { credit: 'credit', debit: 'debit'}
	has_one :balance, class_name: "UserBalance"

end

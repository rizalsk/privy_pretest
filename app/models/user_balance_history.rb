class UserBalanceHistory < ApplicationRecord
	self.inheritance_column = :_sti_disabled
	enum type_name: { credit: 'credit', debit: 'debit'}
	belongs_to :balance, class_name: "UserBalance", :foreign_key => "user_balance_id", required: false

	# belongs_to :balance, class_name: "UserBalance", :foreign_key => "user_balance_id"
	validates :user_balance_id, length: { minimum: 1 }, allow_nil: true
	validates :balance, length: {minimum: 1, allow_nil: true}
end

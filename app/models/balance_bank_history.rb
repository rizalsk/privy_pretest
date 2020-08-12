class BalanceBankHistory < ApplicationRecord
	self.inheritance_column = :_sti_disabled
	enum type_name: { credit: 'credit', debit: 'debit'}
	belongs_to :balance, class_name: "BalanceBank", :foreign_key => "balance_bank_id", required: false
	validates :balance, length: {minimum: 1, allow_nil: true}
end

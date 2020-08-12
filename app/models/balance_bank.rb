class BalanceBank < ApplicationRecord
	has_one :history, class_name: "BalanceBankHistory" 
	
end

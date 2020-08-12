class PagesController < ApplicationController
	def index
	end
	def banks
		render 'pages/banks'
	end
	def users
		render 'pages/users'
	end
	def user_balance
		render 'pages/user_balance'
	end
	def bank_balance
		render 'pages/bank_balance'
	end
end

class BanksController < ApplicationController
	def initialize()
	end
	def index
		@bank = Bank.order('name ASC');
	end
end

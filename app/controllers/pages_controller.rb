class PagesController < ApplicationController
	def index
	end
	def banks
		render 'pages/banks'
	end
	def users
		render 'pages/users'
	end
end

class Api::BankBalanceController < ApplicationController
	skip_before_action :authorized
    # remove random token
    skip_before_action :verify_authenticity_token, only: [:index, :create, :update, :destroy]

  	def index
        @balance = BalanceBank.select("*, DATE_FORMAT(created_at, '%Y-%m-%d %T') as transaction_date").order('created_at ASC')
        data = @balance.to_json(:include => [ :history ]);
        render :json => {status:'SUCCESS', message:'Loaded Bank Balance', data: data}, status:200
    end 

    def show
    end

    def create
    end

    def destroy()
    end

    def update
    end
end

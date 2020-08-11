class Api::BanksController < ApplicationController
    skip_before_action :authorized
    # remove random token
    skip_before_action :verify_authenticity_token, only: [:index, :create, :update, :destroy]


  	def index
        bank = Bank.order('name ASC');
        render json:{status:'SUCCESS', message:'Loaded Banks', data:bank}, status:200
    end

    def show
        # bank = Bank.find(params[:id])
        # render json:{status:'SUCCESS', message:'Loaded Bank', data:bank}, status:200
    end

    def create
        bank = Bank.new(bank_params);
        if(bank.save)
            render json:{status:'SUCCESS', message:'Bank Saved', data:bank}, status:200
        else 
            render json:{status:'Failed', message:'Bank not saved', data:bank.errors}, status:422
        end
    end

    def destroy
        bank = Bank.find(params[:id])
        if(bank.destroy)
            render json:{status:"SUCCESS", message:"Bank deleted"}, status:200
        else 
            render json:{status:'SUCCESS', message:'Bank not deleted', data:bank.errors}, status:422
        end
    end

    def update
        bank = Bank.find(params[:id])
        if bank.update_attributes(bank_params)
            render json:{status:"SUCCESS", message:"Bank saved", data:bank}, status:201
        else 
            render json:{status:'SUCCESS', message:'Bank not saved', data:bank.errors}, status:422
        end
    end

    def bank_params
        params.permit(:name, :code);
    end

end
class Api::UsersController < ApplicationController
	skip_before_action :authorized
    # remove random token
    skip_before_action :verify_authenticity_token, only: [:index, :create, :update, :destroy]

  	def index
        data = User.order('username ASC');
        render json:{status:'SUCCESS', message:'Loaded Users', data:data}, status:200
    end 

    def create
        data = User.new(user_params);
         if(data.save)
            render json:{status:'SUCCESS', message:'User Saved', data:data}, status:200
        else 
            render json:{status:'Failed', message:'User not saved', data:data.errors}, status:422
        end
    end

    def destroy
        data = User.find(params[:id])
        if(data.destroy)
            render json:{status:"SUCCESS", message:"User deleted"}, status:200
        else 
            render json:{status:'SUCCESS', message:'User not deleted', data:data.errors}, status:422
        end
    end

    def update
        data = User.find(params[:id])
        if data.update_attributes(user_params)
            render json:{status:"SUCCESS", message:"User saved", data:data}, status:201
        else 
            render json:{status:'SUCCESS', message:'User not saved', data:data.errors}, status:422
        end
    end

    def user_params
        params.permit(:username, :email, :password );
    end
end

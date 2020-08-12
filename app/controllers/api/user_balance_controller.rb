class Api::UserBalanceController < ApplicationController
	skip_before_action :authorized
    # remove random token
    skip_before_action :verify_authenticity_token, only: [:index, :create, :update, :destroy]

  	def index
        @userbalance = UserBalance.select("*, DATE_FORMAT(created_at, '%Y-%m-%d %T') as transaction_date").where( user_id: session[:user_id] ).order('created_at ASC')
        # data = @userbalance.to_json(:include => [:user => { :only => :username }, :history => { :only => [:type, :activity, :ip] }] );
        data = @userbalance.to_json(:include => [ :user, :history ]);
        render :json => {status:'SUCCESS', message:'Loaded User Balance', data: data}, status:200
    end 

    def show

    end

    def create
        useragent = session[:user_agent];
        user_id = params[:user_id];
        activity = params[:activity] ;
        browser = useragent['browser'] ;
        city = useragent['location'] ;
        author = useragent['author'] ;
         
        remote_proxies = request.env['action_dispatch.remote_ip'].instance_variable_get :@proxies
        remote_addr = remote_proxies[0]

        lasthistory = UserBalanceHistory.joins(:balance).where(:user_balances => {:user_id => user_id }).order('created_at DESC').first
        achievehistory = UserBalanceHistory.joins(:balance).where(:user_balances => {:user_id => user_id }).order('balance_achieve DESC').first

        history_balance_before = ( lasthistory ? lasthistory.balance_before : 0 )
        # history_balance_after = ( lasthistory ? lasthistory.balance_before : 0 )
        
        lastbalance = UserBalance.where(:user_id => user_id ).order('created_at DESC').first

        balance = lastbalance ? ( activity == 'topup' ? params[:balance].to_f + lastbalance.balance.to_f : lastbalance.balance.to_f - params[:balance].to_f ) : params[:balance]
        balance_achieve = lastbalance ? ( lastbalance.balance.to_f > balance.to_f ? lastbalance.balance.to_f : balance.to_f ) : params[:balance].to_f

        @storebalance = {
        	"user_id" => user_id,
        	"balance" => balance,
        	"balance_achieve" => balance_achieve,
        }
        newuserbalance = UserBalance.new( @storebalance )
        newuserbalance.save

        @storehistory = {
         	"user_balance_id" => newuserbalance.id,
         	"balance_before" => history_balance_before,
         	"balance_after" => balance,
         	"activity" => params[:activity],
         	"type" => params[:type],
         	"ip" => remote_addr,
        	"user_agent" => browser,
        	"location" => request.location.city,
        	"author" => author,
        }
        data = UserBalanceHistory.new(@storehistory)
        # abort @storehistory.inspect

        if(data.save)
            render json:{status:'SUCCESS', message:'User Balance Saved', data:data}, status:200
        else 
            render json:{status:'Failed', message:'User Balance not saved', data:data.errors}, status:422
        end

    end

    def destroy()
        data = UserBalance.find(params[:id])
        if(data.destroy)
            render json:{status:"SUCCESS", message:"User Balance deleted"}, status:200
        else 
            render json:{status:'SUCCESS', message:'User Balance not deleted', data:data.errors}, status:422
        end
    end

    def update
        data = UserBalance.find(params[:id])
        if data.update_attributes(balance_params)
            render json:{status:"SUCCESS", message:"User Balance saved", data:data}, status:201
        else 
            render json:{status:'SUCCESS', message:'User Balance not saved', data:data.errors}, status:422
        end
    end

    def balance_params
        params.permit( :user_id );
    end 

    def history_params
        params.permit( :type, :activity );
    end 
end

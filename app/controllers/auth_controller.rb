class AuthController < ApplicationController
  require "browser"
  include Browser
  skip_before_action :authorized, only: [:index, :login]
  def index
  end
  def show
  end
  def login
    @user = User.find_by( email: params['email'])
    if @user && @user.authenticate(params['password'])
      exclude_columns = ['password' ]
      user_agent = UserAgent.parse(request.user_agent) 
      browser = Browser.new(user_agent)
      platform = user_agent.platform
      author = platform+' '+@user.email
      user_ip = request.env['action_dispatch.remote_ip'].calculate_ip
      remote_proxies = request.env['action_dispatch.remote_ip'].instance_variable_get :@proxies
      remote_addr = remote_proxies[0]
      session[:user_id] = @user.id
      session[:user] = @user
      session[:user_agent] = {
        'browser' => user_agent.browser+' '+user_agent.version,
        'remote_addr' => remote_addr ,
        'user_ip' => user_ip ,
        'info' => browser,
        'platform' => platform,
        'author' => author,
        'location' => request.location.city,
      }

      flash[:success] = "Welcome #{@user.username}"
       
      redirect_to root_path
    else
      flash.now[:danger] = "Your email or password doesn't correct"
      render :action => "index"
      #render 'index'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "Good bye!"
    render 'index'
  end 

end

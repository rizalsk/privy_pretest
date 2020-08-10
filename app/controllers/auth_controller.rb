class AuthController < ApplicationController
  skip_before_action :authorized, only: [:index, :login]
  def index
  end
  def show
  end
  def login
    @user = User.find_by( email: params['email'])
    if @user && @user.authenticate(params['password'])
      session[:user_id] = @user.id
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

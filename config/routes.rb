Rails.application.routes.draw do
	get 'login', to: 'auth#index'
	post 'login', to: 'auth#login'
	delete 'logout', to: 'auth#destroy'
	get 'profile', to: 'auth#show'

	get 'banks', to: 'pages#banks'
	get 'users', to: 'pages#users'
	get 'user_balance', to: 'pages#user_balance'
	get 'bank_balance', to: 'pages#bank_balance'
    namespace 'api' do
      	resources :banks
      	resources :users
      	resources :user_balance
      	resources :bank_balance
    end

	get 'pages/index'
	root 'pages#index'
end

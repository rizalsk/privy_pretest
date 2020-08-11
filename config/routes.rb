Rails.application.routes.draw do
	get 'login', to: 'auth#index'
	post 'login', to: 'auth#login'
	delete 'logout', to: 'auth#destroy'
	get 'profile', to: 'auth#show'

	get 'banks', to: 'pages#banks'
	get 'users', to: 'pages#users'
    namespace 'api' do
      	resources :banks
      	resources :users
    end

	get 'pages/index'
	root 'pages#index'
end

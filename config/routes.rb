Rails.application.routes.draw do
	get 'login', to: 'auth#index'
	post 'login', to: 'auth#login'
	delete 'logout', to: 'auth#destroy'
	get 'profile', to: 'auth#show'

	resources :banks
    namespace 'api' do
      	resources :banks
    end

	get 'pages/index'
	root 'pages#index'
end

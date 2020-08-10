Rails.application.routes.draw do
  get 'login', to: 'auth#index'
  post 'login', to: 'auth#login'
	delete 'logout', to: 'auth#destroy'
  get 'profile', to: 'auth#show'
	get 'pages/index'
  root 'pages#index'
  get 'authorized', to: 'auth#page_requires_login'
end

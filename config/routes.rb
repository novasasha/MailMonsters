Rails.application.routes.draw do
	
	get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'

	resources :sessions, only: [:create, :destroy]
  	resource :monsters, only: [:index]
  	root 'monsters#index'
end

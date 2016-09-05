Rails.application.routes.draw do
	
	get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'
	get 'email/compose', to: 'monsters#compose', as: 'new_email'
	post '/send', to: 'monsters#send_email'
	get 'email/:id', to: 'monsters#email', as: 'email'
	delete 'email/:id', to: 'monsters#destroy', as: 'email_delete'
	

	resources :sessions, only: [:create, :destroy]
  	resource :monsters, only: [:index]
  	root 'monsters#index'
end

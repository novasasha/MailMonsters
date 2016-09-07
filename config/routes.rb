Rails.application.routes.draw do
	
	get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'
	get 'inbox', to: 'emails#inbox', as: 'inbox'
	get 'monster_selector', to: 'emails#monster_selector', as: 'monster_selector'
	get 'trash', to: 'emails#trash', as: 'trash'
	get 'junk', to: 'emails#junk', as: 'junk'
	get 'email/compose', to: 'emails#compose', as: 'new_email'
	post '/monster_choice', to: 'emails#monster_choice'
	post '/send', to: 'emails#send_email'
	get 'email/:id', to: 'emails#email', as: 'email'
	delete 'email/:id', to: 'emails#destroy', as: 'email_delete'
	

	resources :sessions, only: [:create, :destroy]
  	resource :emails, only: [:index]
  	root 'emails#index'
end

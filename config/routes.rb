Rails.application.routes.draw do

	get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'
	get 'monster_selector', to: 'monsters#monster_selector', as: 'monster_selector'
	get 'email/compose', to: 'emails#compose', as: 'new_email'
	post '/monster_choice', to: 'monsters#monster_choice'
	post '/send', to: 'emails#send_email'
	get 'email/:id', to: 'emails#email', as: 'email'
	get ':mailbox', to: 'emails#mailbox', as: 'mailbox'
	delete 'email/:id', to: 'emails#destroy', as: 'email_delete'


	resources :sessions, only: [:create, :destroy]
  	resource :monsters, only: [:index]
  	root 'monsters#index'
end

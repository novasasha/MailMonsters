Rails.application.routes.draw do

	# these routes handle google Oaut2
	get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'

	# these routes handle selecting a monster for an account
	get 'monster_selector', to: 'monsters#monster_selector', as: 'monster_selector'
	post '/monster_choice', to: 'monsters#monster_choice'

	#these handle searches
	get ':mailbox/search', to: 'emails#search'


	# this leads to a specified mailbox eg. inbox, trash, junk, starred, etc.
	get ':mailbox', to: 'emails#mailbox', as: 'index'

	# this is to create an email to send
	get 'email/new', to: 'emails#new', as: 'new_email'
	# this prints out a specific email
	get ':mailbox/email/:id', to: 'emails#show', as: 'show_email'
	# this sends the email
	post '/create', to: 'emails#create'
	#this deletes the email
	delete 'email/:id', to: 'emails#destroy', as: 'email_delete'



	resources :sessions, only: [:create, :destroy]
  	resource :monsters, only: [:index]
  	root 'monsters#index'
end

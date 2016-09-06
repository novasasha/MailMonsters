Rails.application.routes.draw do
  namespace :api do
    get 'agenda/all'
  end

	namespace :api do
		get 'auth/:provider/callback', to: 'sessions#create'
		get 'auth/failure', to: redirect('/')
		get 'signout', to: 'sessions#destroy', as: 'signout'
	end
	namespace :api, contraints: { format: :json } do
		get 'trash', to: 'monsters#trash', as: 'trash'
		get 'junk', to: 'monsters#junk', as: 'junk'
		get 'email/compose', to: 'monsters#compose', as: 'new_email'
		post '/send', to: 'monsters#send_email'
		get 'email/:id', to: 'monsters#email', as: 'email'
		delete 'email/:id', to: 'monsters#destroy', as: 'email_delete'
		root 'monsters#index'
	end
	

	resources :sessions, only: [:create, :destroy]
  	resource :monsters, only: [:index]
end

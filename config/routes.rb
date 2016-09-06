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
		get 'trash', to: 'mail#trash', as: 'trash'
		get 'junk', to: 'mail#junk', as: 'junk'
		get 'email/compose', to: 'mail#compose', as: 'new_email'
		post '/send', to: 'mail#send_email'
		get 'email/:id', to: 'mail#email', as: 'email'
		delete 'email/:id', to: 'mail#destroy', as: 'email_delete'
		root 'mail#index'
	end


	resources :sessions, only: [:create, :destroy]
  	resource :mail, only: [:index]
end

Rails.application.routes.draw do
  root to: "pages#home"

  match 'user/:id' => 'user#show', via: :get

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	match 'home' => 'user#home', via: :get
	match 'mural/:id' => 'user#mural', via: :get

	resources :posts, :except => [:index]


end

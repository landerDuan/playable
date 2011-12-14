Playable::Application.routes.draw do
  devise_for :users
  
  resources :users
  
  match 'settings'    => 'users#edit',  :via => :get, :as => :settings
  match 'members'     => 'users#index', :via => :get, :as => :members
  match 'my/profile'  => 'users#show',  :via => :get, :as => :profile
  match 'u/:username' => 'users#show',  :via => :get, :as => :username
  match 'update'    => 'users#update',  :via => :put, :as => :update


  namespace :admin do
    root :to => 'users#index'

    resources :users do
      resources :reports, :only => :index
      resources :events, :only => :index
      resources :posts, :only => :index
    end

    resources :roles, :except => :show
    resources :reports
    resources :events do
      collection do
        put :checkin
        put :checkout
      end
    end

    resources :pages
    resources :posts do
       resources :comments
    end
    resources :pages,:products,:categories
  end

  root :to => 'home#index'
end

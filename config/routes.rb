Mascavo::Application.routes.draw do

  authenticated :user do
    root :to => "dashboard#index"
  end

  root :to => "welcome#index"

  devise_for :users

  resources :users

  resources :contacts

  resources :companies

  resources :sources

  resources :deals

  resources :activities

end

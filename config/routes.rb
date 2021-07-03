Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  match "/422", :to => "errors#unprocessable_entity", :via => :all

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :projects do
    resources :tasks
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  # get '/unsubscribe', to: 'pages#unsubscribe'
  # get '/subscribe', to: 'pages#subscribe'

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end

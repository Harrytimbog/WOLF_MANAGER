Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get '/unsubscribe', to: 'pages#unsubscribe'
  get '/subscribe', to: 'pages#subscribe'

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end

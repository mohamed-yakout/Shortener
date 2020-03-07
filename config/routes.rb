Rails.application.routes.draw do
  resources :link_maps

  get '/s/:short_data', to: 'link_maps#redirect', as: :short
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'link_maps#index'
end

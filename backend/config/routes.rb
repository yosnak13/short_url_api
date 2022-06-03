Rails.application.routes.draw do
  get "/urls", to: "urls#index"
  resources :register_url, only: [:index, :new, :create]
end

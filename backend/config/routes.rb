Rails.application.routes.draw do
  get "/urls", to: "urls#index"
  post "/register-url", to: "urls#create"
end

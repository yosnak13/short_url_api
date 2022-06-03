Rails.application.routes.draw do
  get "/urls", to: "urls#index"
  get "/register-url", to "urls#create"
end

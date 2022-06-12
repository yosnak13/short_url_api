Rails.application.routes.draw do
  get "/urls", to: "urls#index"
  post "/register-url", to: "urls#create"
  get '*unmatched_route', to: "urls#show"
end

Rails.application.routes.draw do
  resources :mocks
  get "*all" => "home#index"
  get '/' => 'mocks#index'
end

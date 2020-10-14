Rails.application.routes.draw do
  resources :mocks
  get "*all" => "home#index"
  put "*all" => "home#index"
  post "*all" => "home#index"
  delete "*all" => "home#index"
  get '/' => 'mocks#index'
end

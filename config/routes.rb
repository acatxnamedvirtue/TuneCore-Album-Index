Rails.application.routes.draw do
  resources :songs if Rails.env.test?

  match 'search', to: 'search#search', via: [:get, :post], as: :search
  root to: 'search#search'
  match '(*any)' , to: redirect('/'), via: [:get, :post] unless Rails.env.test?
end

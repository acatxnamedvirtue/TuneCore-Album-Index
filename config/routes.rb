Rails.application.routes.draw do
  resources :artists if Rails.env.test?
  resources :albums if Rails.env.test?
  resources :songs if Rails.env.test?

  match 'search', to: 'songs#search', via: [:get, :post], as: :search
  root to: 'songs#search'
  match '(*any)' , to: redirect('/'), via: [:get, :post] unless Rails.env.test?
end

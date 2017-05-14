Rails.application.routes.draw do
  resources :artists
  resources :albums
  resources :songs

  match '/search', to: 'songs#search', via: [:get, :post]
  root to: 'songs#search'
end

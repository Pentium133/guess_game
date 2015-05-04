Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :team_seasons,  only: [:show, :index], path: '/teams'
end

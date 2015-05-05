Rails.application.routes.draw do
  resources :races
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :team_seasons,  only: [:show, :index], path: '/teams' do
    member do
      get :import
      post :import
    end
  end

  root :to => 'pages#dashboard'
end

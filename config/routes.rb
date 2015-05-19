Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :riders, only: [] do
    get :autocomplete_rider_last_name, :on => :collection
  end

  resources :team_seasons,  only: [:show, :index], path: '/teams' do
    get :autocomplete_team_season_name, :on => :collection
    member do
      get :import
      post :import
    end
  end

  resources :races, only: [:show, :index] do
    resources :stages,  only: [:show, :update]
  end

  root :to => 'pages#dashboard'

end
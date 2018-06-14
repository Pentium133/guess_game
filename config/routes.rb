Rails.application.routes.draw do

  constraints subdomain: 'www' do
    get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  resources :users,  only: [:show]

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
    member do
      get :calculate
    end
    resources :stages,  only: [:show, :update]
  end

  resources :tournaments, only: [:show, :index] do
    resources :rounds,  only: [:show, :update]
  end

  resources :matches, only: [:update] do
    member do
      patch :predicts
    end
  end

  resources :match_predicts, only: [:update]

  root :to => 'pages#dashboard'

end
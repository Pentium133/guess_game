RailsAdmin.config do |config|

  config.main_app_name = ['Guess Games', 'Admin']

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Race' do
    list do
      field :name
      field :race_type
      field :is_ready
      field :season
      field :start_at
      field :end_at
    end
    show do
      field :name
      field :season
      field :race_type
      field :is_ready
      field :start_at
      field :end_at
      field :created_at
      field :updated_at
    end
    edit do
      field :is_ready
      field :name
      field :race_type
      field :season
      field :start_at
      field :end_at
    end
  end

  config.model 'Rider' do
    list do
      field :last_name
      field :first_name
    end
    show do
      field :first_name
      field :last_name
      field :created_at
      field :updated_at
    end
    edit do
      field :first_name
      field :last_name
    end
  end

  config.model 'RiderTeamSeason' do
    visible false
  end

  config.model 'StagePredict' do
    visible false
  end

  config.model 'Season' do
    list do
      field :name
    end
    show do
      field :name
      field :created_at
      field :updated_at
    end
    edit do
      field :name
    end
  end

  config.model 'Stage' do
    field :stage_type, :enum do
      searchable false
    end
    list do
      field :stage_number
      field :name
      field :race
      field :stage_type
      field :start_at
    end
    show do
      field :stage_number
      field :name
      field :profile
      field :stage_type
      field :race
      field :start_at
      field :created_at
      field :updated_at
    end
    edit do
      field :stage_number
      field :name
      field :stage_type
      field :race
      field :profile
      field :remote_profile_url
      field :start_at
    end
  end

  config.model 'Team' do
    list do
      field :code
      field :short_name
      field :country
    end
    show do
      field :code
      field :short_name
      field :country
      field :created_at
      field :updated_at
    end
    edit do
      field :code
      field :short_name
      field :country
    end
  end

  config.model 'TeamSeason' do
    list do
      field :name
      field :team
      field :season
      field :logo
    end
    show do
      field :name
      field :team
      field :season
      field :logo
      field :created_at
      field :updated_at
    end
    edit do
      field :name
      field :team
      field :season
      field :logo
      field :remote_logo_url
    end
  end

  config.model 'User' do
    list do
      field :avatar
      field :username
      field :email
      field :role
      field :last_sign_in_at
    end
    edit do
      field :username
      field :password
      field :password_confirmation
      field :email
      field :role
      field :avatar
    end
    show do
      field :username
      field :email
      field :role
      field :avatar
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :current_sign_in_ip
      field :last_sign_in_ip
      field :created_at
      field :updated_at
    end
  end

  config.model 'Tournament' do
    list do
      field :name
      field :start_at
      field :end_at
    end
    show do
      field :name
      field :start_at
      field :end_at
      field :created_at
      field :updated_at
    end
    edit do
      field :name
      field :start_at
      field :end_at
    end
  end

  config.model 'Round' do
    list do
      field :name
      field :start_at
      field :multiplier
    end
    show do
      field :name
      field :start_at
      field :multiplier
      field :created_at
      field :updated_at
    end
    edit do
      field :name
      field :multiplier
      field :start_at
    end
  end
end


module ActiveRecord
  module RailsAdminEnum
    def enum(definitions)
      super

      definitions.each do |name, values|
        define_method("#{ name }_enum") { self.class.send(name.to_s.pluralize).to_a }

        define_method("#{ name }=") do |value|
          if value.kind_of?(String) and value.to_i.to_s == value
            super value.to_i
          else
            super value
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send(:extend, ActiveRecord::RailsAdminEnum)
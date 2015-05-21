class RidersController < ApplicationController
  autocomplete :rider, :last_name, :extra_data => [:first_name], :display_value => :to_s
end

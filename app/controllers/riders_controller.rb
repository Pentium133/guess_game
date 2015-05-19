class RidersController < ApplicationController
  autocomplete :rider, :last_name
end

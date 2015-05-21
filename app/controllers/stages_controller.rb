class StagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stage, only: [:show, :update]

  def show
    raise 'Not correct result for stage' if @stage.stage_results.count > 6

    @page_title = @stage.name
    race = @stage.race
    add_breadcrumb 'Races', races_path
    add_breadcrumb @stage.race.name, race_path(@stage.race)
    add_breadcrumb @stage.name
  end

  def update
    my_params = stage_params

    if my_params['stage_predicts_attributes'].present?
      my_params['stage_predicts_attributes'].map { |item, value| value['user_id'] = current_user.id }
    end

    if @stage.update(my_params)
      if my_params['stage_results_attributes'].present?
        @stage.calculate_scores
      end
      redirect_to race_stage_path(@stage.race, @stage), notice: 'Stage result was successfully updated.'
    else
      render action: 'show'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage
      @stage = Stage.find(params[:id])
      if @stage.stage_type == 'ttt'
        finisher_class = 'Team'
        @autocomplete_path = autocomplete_team_season_name_team_seasons_path
      else
        finisher_class = 'Rider'
        @autocomplete_path = autocomplete_rider_last_name_riders_path
      end

      fill_results finisher_class

      fill_predicts finisher_class

      fill_scores

      fill_overalL_standing
    end

    def fill_overalL_standing
      logger.debug '=== Fill overal standing'
      @overall = @stage.get_overall
    end

    def fill_scores
      logger.debug '=== Fill score'
      @users = User.select('`users`.*, sum(stage_predicts.score) as score_summ')
        .joins(:stage_predicts)
        .where('stage_predicts.stage_id': @stage.id)
        .group('users.id')
        .order('score_summ desc')
    end

    def fill_results(finisher_class)
      logger.debug '=== Fill results'
      i = 1;
      while @stage.stage_results.count < 6 do
        StageResult.find_or_create_by stage_id: @stage.id, place: i, finisher_type: finisher_class
        i+=1
      end
    end

    def fill_predicts(finisher_class)
      logger.debug '=== Fill predicts'
      p = 1;
      while @stage.stage_predicts.where(user_id: current_user.id).count < 6 do
        StagePredict.find_or_create_by user_id: current_user.id, stage_id: @stage.id, place: p, finisher_type: finisher_class
        p+=1
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stage_params
      params.require(:stage).permit(:id, :race_id,
        :stage_results_attributes  => [:id, :place, :finisher_id, :finisher_type],
        :stage_predicts_attributes => [:id, :place, :finisher_id, :finisher_type])
    end
end

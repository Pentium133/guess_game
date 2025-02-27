class StagesController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  before_action :set_stage, only: [:show, :update]

  def show
    raise 'Not correct result for stage' if @stage.stage_results.count > 6

    @page_title = "#{I18n.t('stages.show.stage')} #{@stage.stage_number} - #{@stage.name}"
    add_breadcrumb I18n.t('menu.races'), races_path
    add_breadcrumb @stage.race.name, race_path(@stage.race)
    add_breadcrumb "#{I18n.t('stages.show..stage')} #{@stage.stage_number} - #{@stage.name}"
  end

  def update
    my_params = stage_params

    if my_params['stage_predicts_attributes'].present? and @stage.start_at > Time.now
      if policy(@stage).manage?
        user_id = params[:user][:id]
      else
        user_id = current_user.id
      end
      my_params['stage_predicts_attributes'].map { |item, value| value['user_id'] = user_id }
      @stage.clear_predicts_for user_id

      # predict_result
      pr = PredictResult.find_or_create_by stage_id: @stage.id, user_id: user_id
      pr.is_online = params[:is_online]
      pr.touch
      pr.save
    end

    if @stage.update(my_params)
      if my_params['stage_results_attributes'].present?
        authorize @stage, :calculate?
        logger.debug '=== Calculate score'
        @stage.calculate_scores
      end
      redirect_to race_stage_path(@stage.race, @stage), notice: 'Stage result was successfully updated.'
    else
      flash.now[:alert] = 'Stage result was not updated.'
      render action: 'show'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage
      @stage = Stage.friendly.find(params[:id])
      raise ActiveRecord::RecordNotFound if @stage.rest_day?

      if @stage.stage_type == 'ttt'
        finisher_class = 'Team'
        @autocomplete_path = autocomplete_team_season_name_team_seasons_path
      else
        finisher_class = 'Rider'
        @autocomplete_path = autocomplete_rider_last_name_riders_path
      end

      @show_scores = (@stage.stage_results.where('finisher_id IS NOT NULL').count > 0)

      if @stage.stage_number.to_i > 0
        @next_stage = Stage.where('race_id = ? and stage_number = ?', @stage.race_id, @stage.stage_number + 1).first
        @prev_stage = Stage.where('race_id = ? and stage_number = ? and stage_number <> 0', @stage.race_id, @stage.stage_number - 1).first
      end

      fill_results finisher_class

      fill_predicts finisher_class if user_signed_in?

      fill_scores

      fill_overall_standing
    end

    def fill_overall_standing
      logger.debug '=== Fill overal standing'
      @overall = @stage.get_overall
      if @stage.stage_type == 'sprint'
        @overall_addition = @stage.get_overall_sprinters
      end
      if @stage.stage_type == 'mountains'
        @overall_addition = @stage.get_overall_mountains
      end
    end

    def fill_scores
      logger.debug '=== Fill score'
      @scores = PredictResult.where(stage_id: @stage.id)
        .includes(:user)
        .order(score: :desc)
        .order(:place)

      if user_signed_in?
        @predicts = @stage.stage_predicts.where(user_id: current_user.id).order(:place)
      end
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
        :stage_predicts_attributes => [:place, :finisher_id, :finisher_type]
      )
    end
end

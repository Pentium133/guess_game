class StagesController < ApplicationController
  before_action :set_stage, only: [:show, :update]

  def show
    raise 'Not correct result for stage' if @stage.stage_results.count > 6

    i = 1;
    while @stage.stage_results.count < 6 do
      StageResult.find_or_create_by stage_id: @stage.id, place: i
      i+=1
    end

    @page_title = @stage.name
    race = @stage.race
    add_breadcrumb 'Races', races_path
    add_breadcrumb @stage.race.name, race_path(@stage.race)
    add_breadcrumb @stage.name
  end

  def update
    if @stage.update(stage_params)
      redirect_to race_stage_path(@stage.race, @stage), notice: 'Stage result was successfully updated.'
    else
      render action: 'show'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage
      @stage = Stage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stage_params
      params.require(:stage).permit(:id, :race_id, :stage_results_attributes => [:id, :place, :rider_id])
    end
end

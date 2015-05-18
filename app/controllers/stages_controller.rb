class StagesController < ApplicationController
  before_action :set_stage, only: [:show]

  def show
    raise 'Not correct result for stage' if @stage.stage_results.count > 6

    i = 1;
    while @stage.stage_results.count < 6 do
      StageResult.find_or_create_by stage_id: @stage.id, place: i
      i+=1
    end

    @page_title = @stage.name
    add_breadcrumb 'Races', races_path
    add_breadcrumb @stage.race.name, race_stage_path(@stage.race_id, @stage)
    add_breadcrumb @stage.name
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage
      @stage = Stage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stage_params
      params.require(:stage).permit(:show)
    end
end

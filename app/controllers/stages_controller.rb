class StagesController < ApplicationController
  before_action :set_stage, only: [:show]

  def show
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

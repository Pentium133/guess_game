class PagesController < ApplicationController
  def dashboard
    @stages_today    = Stage.where(:start_at => (Time.now.beginning_of_day..Time.now.end_of_day))
    @stages_tomorrow = Stage.where(:start_at => (1.day.from_now.beginning_of_day..1.day.from_now.end_of_day))

    @races_today    = Race.where('start_at < ? and end_at > ? and is_ready = 1', Time.now.end_of_day, Time.now.beginning_of_day)
    @races_tomorrow = Race.where('start_at < ? and start_at > ? and is_ready = 1', Time.now + 6.day, Time.now.end_of_day)

    @show_result = false
    @stages_today.each do |stage|
      if stage.stage_results.where('finisher_id IS NOT NULL').any?
        @show_result = true
      end
    end

    @page_title = 'Dashboard'
  end
end
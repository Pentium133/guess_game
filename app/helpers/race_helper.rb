module RaceHelper

  def race_type_for(race)
    case race.race_type
      when 'grand_tour'
        return '<span class="label label-info">Grand Tour</span>'.html_safe
      when 'word_tour'
        return '<span class="label label-info">Word Tour</span>'.html_safe
      when 'classics_tour'
        return '<span class="label label-info">Classics Tour</span>'.html_safe
    end
  end

  def race_status_for(race)
    unless race.is_ready
      str = I18n.t('message.not_ready_for_predictions')
      "<span class=\"label label-danger\">#{str}</span>".html_safe
    end
  end
end

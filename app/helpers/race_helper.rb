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

  def image_for_classification(race_result)
    if race_result.place == 1
      case race_result.result_type
        when 'overall'
          return image_tag '/img/classification-general.png'
        when 'sprinter'
          return image_tag '/img/classification-points.png'
        when 'mountains'
          return image_tag '/img/classification-mountains.png'
      end
    else
      return race_result.place
    end
  end

  def name_for_classification(race_result)
    case race_result.result_type
      when 'overall'
        return I18n.t('message.overall_classifications')
      when 'sprinter'
        return I18n.t('message.sprinters_classifications')
      when 'mountains'
        return I18n.t('message.mountains_classifications')
    end
  end
end

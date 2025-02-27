module ApplicationHelper

  def active_if(options)
    'highlight' if params.merge(options) == params
  end

  def current_page_tag_if(options)
    '<span class="current-page"></span>'.html_safe if params.merge(options) == params
  end

  def stage_type(stage)
    case stage.stage_type
      when 'itt'
        return '<span class="label label-info">ITT</span>'.html_safe
      when 'ttt'
        return '<span class="label label-info">TTT</span>'.html_safe
      when 'sprint'
        return '<span class="label label-danger">S</span>'.html_safe
      when 'mountains'
        return '<span class="label label-success">M</span>'.html_safe
      else
        return ''
    end
  end

  def stage_nomination_info(stage)
    case stage.stage_type
      when 'sprint'
        niminat = '<span class="label label-danger">' + I18n.t('message.sprinters') + '</span>'
      when 'mountains'
        niminat = '<span class="label label-success">' + I18n.t('message.mountains') + '</span>'
      when 'ttt'
        return '<i class="fa fa-clock-o"></i> Team time trial'.html_safe
      when 'itt'
        return '<i class="fa fa-clock-o "></i> Individual time trial'.html_safe
      else
        return ''
    end
    I18n.t('stages.scores_information', niminat: niminat).html_safe
  end

  def predict_status(stage)
    if user_signed_in?
      if stage.predict_results.where(user_id: current_user.id).any?
        '<i class="fa fa-check-circle green"></i>'.html_safe
      else
        '<i class="fa fa-circle-thin red"></i>'.html_safe
      end
    end
  end

  def match_predict_status(match)
    if user_signed_in?
      if match.predict_ready_for? current_user
        '<i class="fa fa-check-circle green"></i>'.html_safe
      else
        '<i class="fa fa-circle-thin red"></i>'.html_safe
      end
    end
  end

  def match_time_class(match, user)
    if match.start_at < Time.now
      'info'
    elsif match.start_at.to_date == Time.now.to_date
      'warning'
    elsif user_signed_in? && match.predict_ready_for?(user)
      'success'
    else
      'default'
    end
  end

  def match_predict_result_status(match_predict)
    if match_predict.noguessed?
      '<span class="badge badge-default">мимо</span>'.html_safe
    elsif match_predict.result?
      '<span class="badge badge-warning">исход</span>'.html_safe
    elsif match_predict.difference?
      '<span class="badge badge-info">разница</span>'.html_safe
    elsif match_predict.score?
      '<span class="badge badge-success">точно!</span>'.html_safe
    end
  end

  def match_predict_result_score(match_predict)
    if match_predict.noguessed?
      css_class = 'default'
    elsif match_predict.result?
      css_class = 'warning'
    elsif match_predict.difference?
      css_class = 'info'
    elsif match_predict.score?
      css_class = 'success'
    end
    "<span class='badge #{css_class}-bg'>#{match_predict.score}</span>".html_safe
  end
end

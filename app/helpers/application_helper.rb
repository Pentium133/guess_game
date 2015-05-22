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
      else
        return ''
    end
  end
end

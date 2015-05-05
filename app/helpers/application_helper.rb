module ApplicationHelper
  def active_if(options)
    'highlight' if params.merge(options) == params
  end

  def current_page_tag_if(options)
    '<span class="current-page"></span>'.html_safe if params.merge(options) == params
  end
end

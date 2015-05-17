class VeloBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder

  def render
    return '' if @elements.count < 2

    @options[:tag] = 'li'
    @options[:separator] = ''
    result = @elements.collect do |element|
      render_element(element)
    end.join(@options[:separator] || " &raquo; ")

    '<ol class="breadcrumb">' + result + '</ol>'
  end

  def render_element(element)
    if element.path == nil
      content = compute_name(element)
    else
      content = @context.link_to_unless_current(compute_name(element), compute_path(element), element.options)
    end
    if @options[:tag]
      @context.content_tag(@options[:tag], content)
    else
      content
    end
  end

end
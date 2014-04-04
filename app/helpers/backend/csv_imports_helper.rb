module Backend::CsvImportsHelper
  def spinner(text=nil, options={})
    html_options = {class: 'spin'}.merge(options)
    result = content_tag(:span, nil, html_options)
    result << text if text
    content_tag(:span, result, class: 'spinner')
  end
end

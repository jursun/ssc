module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    error_header = "#{pluralize(resource.errors.count, "error")} prohibited this #{resource_name} from being saved:"
    error_messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{error_header}</h2>
      <br />
      <ul>#{error_messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
module ApplicationHelper
  def prepare_error_messages(resource)
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    flash[:error] = messages
    html = <<-HTML
    <div id="error_explanation" class="alert-box alert">
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
  
  def render_vietnam_currency(number)
    if number.blank?
      return t("no_price")
    else
      return number_to_currency(number, {:locale => 'vi', :unit => '', :precision => 0, :format => '%n VND'})  
    end
  end
  
  def render_short_text(text, max_length=40)
    if !text.blank?
      if text.length > max_length
        return strip_tags(text).first(max_length) + "..."
      else
        return strip_tags(text)
      end
    end
  end
end

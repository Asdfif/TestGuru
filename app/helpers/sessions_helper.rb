module SessionsHelper

  def flash_alert(type)
    case type
    when :alert
      content_tag :p, flash[type], class: 'flash alert' if flash[type]
    end
  end

end

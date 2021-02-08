module SessionsHelper

  def flash_alert(type)
    content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end

end

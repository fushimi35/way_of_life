module ApplicationHelper
  def title(page_title = '', admin = false)
    base_title = if admin
                    "RUNTEQ BOARD APP(管理画面)"
                 else
                    "RUNTEQ BOARD APP"
                 end

    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
  def active_class(controller_name)
    if params[:controller] == controller_name
      return "active"
    end
  end
  def bg_color(index)
    if index%2 == 0
      return "bg-custom"
    else
      return "bg-custom2"
    end
  end
end

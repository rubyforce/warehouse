module ApplicationHelper
  def active_menu_item(item)
    controller_name == item ? "active" : ""
  end
end


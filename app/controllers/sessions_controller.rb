class SessionsController < Devise::SessionsController

  def create
    super
    unless current_user.first_name.blank? || current_user.last_name.blank?
      flash[:notice] = t('.hello', first_name: current_user.first_name, last_name: current_user.last_name)
    end
  end
end

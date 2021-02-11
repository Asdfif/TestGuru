class SessionsController < Devise::SessionsController

  def create
    super
    unless current_user.first_name.blank? || current_user.last_name.blank?
      flash[:notice] = "Привет, #{current_user.first_name} #{current_user.last_name} ! "
    end
  end
end

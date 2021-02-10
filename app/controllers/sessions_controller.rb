class SessionsController < Devise::SessionsController

  def create
    super
    user = current_user
    flash[:notice] = "Привет, #{user.first_name} #{user.last_name} ! " unless user.first_name.empty? || user.last_name.empty?
  end 

end

class BadgesController < ApplicationController

  before_action :authenticate_user!

  def index
    @badges = Badge.all
  end

  def guru_badges  
    if current_user.id == params[:guru_id].to_i
      @user = User.find(params[:guru_id])
    else     
      redirect_to badges_path
    end
  end

end

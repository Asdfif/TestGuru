class BadgesController < ApplicationController

  before_action :authenticate_user!

  def index
    @badges = Badge.all
    @user = User.find(current_user.id)
  end

end

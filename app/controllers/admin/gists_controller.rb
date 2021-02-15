class Admin::GistsController < Admin::BaseController

  before_action :all_gists, only: %i[index delete_all]

  def index; end

  def delete_all
    @gists.destroy_all
    redirect_to admin_gists_path
  end

  private

  def all_gists
    @gists = Gist.all
  end

end

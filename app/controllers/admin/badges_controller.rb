class Admin::BadgesController < Admin::BaseController

  before_action :all_badges, only: %i[index]

  def index
    
  end

  def edit
    
  end

  def update
    
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = current_user.badges.build(badge_params)
    if @badge.save!
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    
  end

  private

  def all_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:title, :img_url, :rule_type, :rule_value)
  end

end

# def create

#     standart_params = badge_params.each { |key, value| value.reject!(&:blank?) if value.is_a?(Array) }
#     tests = []
#     if standart_params[:categories].present?
#       standart_params[:categories].each { |category|
#         tests.concat(Test.where(category: category).to_a)
#       }
#     end

#     if standart_params[:levels].present?
#       standart_params[:levels].each { |level|
#         tests.concat(Test.where(level: level).to_a)
#       }
#     end

#     if standart_params[:tests].present?
#       tests.concat(standart_params[:tests])
#     end

#     if standart_params[:first_time] == "1"
#       standart_params[:first_time] = true
#     else
#       standart_params[:first_time] = false
#     end

#     standart_params.delete("categories")
#     standart_params.delete("levels")
#     standart_params.delete("tests")

#     @badge = current_user.badges.build(standart_params)
#     tests.uniq!
    
#     @badge.tests.concat(tests)

#     if @badge.save!
#       redirect_to admin_badges_path
#     else
#       render :new
#     end
#   end


  # def badge_params
  #   params.require(:badge).permit(:title, :img_url, :first_time , tests: [], categories: [], levels: [])
  # end

class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: :destroy
  before_action :set_badges, only: %i[index destroy create]

  # GET /admin/badges
  def index; end

  # GET /admin/badges/new
  def new
    @badge = Badge.new
  end

  # POST /admin/badges
  def create
    @badge = Badge.new(badge_params)
    @badge.value = @badge.send(@badge.rule.to_sym)
    if @badge.save
      redirect_to badges_url, notice: 'Badge was successfully created.' 
    else
      render :new 
    end
  end

  # DELETE /admin/badges/1
  def destroy
    @badge.destroy
    redirect_to badges_url, notice: 'Badge was successfully destroyed.'
  end

  private
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def set_badges
      @badges = Badge.all
    end

    def badge_params
      params.require(:badge).permit(:name, :icon_file, :category_id, :level, :test_id, :rule, :value)
    end
end

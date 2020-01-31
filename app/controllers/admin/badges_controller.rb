class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: :destroy

  # GET /badges
  def index
    @badges = Badge.all
  end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # POST /badges
  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to @badge, notice: 'Badge was successfully created.' 
    else
      render :new 
    end
  end

  # DELETE /badges/1
  def destroy
    @badge.destroy
    redirect_to badges_url, notice: 'Badge was successfully destroyed.'
  end

  private
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :icon_file, :category_id, :level, :test_id)
    end
end

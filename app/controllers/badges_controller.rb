class BadgesController < ApplicationController
  before_action :set_badge, only: :destroy

  # GET /badges
  def index
    @badges = Badge.all
  end

end

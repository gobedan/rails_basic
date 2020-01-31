class BadgesController < ApplicationController
  before_action :set_badge, only: :destroy

  # GET /badges
  def index
    #TODO earned + existing
  end

end

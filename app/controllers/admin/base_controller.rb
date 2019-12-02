class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'You are not admin!' unless current_user.is_a?(Admin)
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_tests_path
    else
      super
    end
  end
end

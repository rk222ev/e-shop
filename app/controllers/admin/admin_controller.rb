class Admin::AdminController < ApplicationController
  layout "admin"

  before_action :check_permission

  def check_permission
    redirect_to new_admin_session_path unless admin_signed_in?
  end

end

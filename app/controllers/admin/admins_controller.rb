class Admin::AdminsController < Admin::BaseController
  def index
    @admins = Admin.all.paginate(page: params[:page], per_page: 50)
  end
end

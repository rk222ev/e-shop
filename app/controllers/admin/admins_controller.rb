class Admin::AdminsController < Admin::BaseController
  def index
    @admins = Admin.all.paginate(page: params[:page], per_page: 50)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params.require(:admin)
                  .permit(:email, :password, :password_confirmation))
    if @admin.save
      flash.keep[:success] = t ".success"
      redirect_to admin_admins_path
    else
      flash[:notice] = t ".failure"
      render :new
    end
  end

  def destroy
    Admin.find(params.require(:id)).destroy
    redirect_to admin_admins_path
  end
end

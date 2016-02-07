class Admin::AdminsController < Admin::BaseController
  before_action :assign_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all.paginate(page: params[:page], per_page: 50)
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash.keep[:success] = t ".success"
      redirect_to admin_admins_path
    else
      flash[:notice] = t ".failure"
      render :new
    end
  end

  def update
    @admin.update!(admin_params)
    redirect_to admin_admins_path
  end

  def destroy
    @admin.destroy
    redirect_to admin_admins_path
  end

  private

  def assign_admin
    @admin = Admin.find(params.require(:id))
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end

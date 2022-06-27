class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(dintinct: true).order(:created_at).page params[:page]
  end

  def new; end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path, success: t('defaults.message.updated', item: "ユーザー") 
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: "ユーザー")
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: t('defaults.message.deleted', item: "ユーザー")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :avatar_cache)
  end
end

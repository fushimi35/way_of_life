class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[show edit]
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(dintinct: true).order(:name).page params[:page]
  end

  def new
  end

  def show
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end

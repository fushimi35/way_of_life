class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login
  layout 'admin_login'
  def new; end

  def create
    @user = login(params[:email],params[:password])
    if @user
      path = @user.role == 'admin' ? admin_root_path : boards_path
      redirect_back_or_to(path, success: t('.success'))
    else
      flash.now[:danger] = t('.fail')
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(admin_login_path, success: t('.success'))
  end
end

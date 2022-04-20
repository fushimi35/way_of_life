class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email],params[:password])

    if @user
      redirect_back_or_to(root_path,  success: t('.flash_messages.login_success'))
    else
      flash.now[:danger] = t('.flash_messages.login_danger')
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, flash:{ success: t('.flash_messages.logout_success')})
  end
end

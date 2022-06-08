class ProfilesController < ApplicationController
  def show
  end

  def edit; end

  def update
    if current_user.update(profile_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  private
  def profile_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar, :avatar_cache)
  end
end

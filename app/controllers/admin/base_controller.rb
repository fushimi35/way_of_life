class Admin::BaseController < ApplicationController
  def not_authenticated
    redirect_to admin_login_path, warning: t('defaults.message.require_login')
  end
end

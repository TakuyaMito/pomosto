class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by_email(params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to login_path, info: t("defaults.message.sent")
  end

  def edit
    @token = params[:id]
    @user = User.load_form_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return    
    end
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    return not_authenticated if @user.blank?
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to top_path, info: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end
end

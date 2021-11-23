class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show
    # 今日のポモドーロ数
    @pomo_time = current_user.worktimes.where("created_at >= ?", Date.today).count
    # 合計ポモドーロ数
    @worktime_count = Worktime.where(user_id: current_user.id).count
    # chartkick
    @work_time = current_user.worktimes
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, info: t('defaults.message.update', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end      
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end

class WorktimesController < ApplicationController
  protect_from_forgery
  def new
    @worktime = Worktime.new
  end

  def create
    @worktime = current_user.worktimes.build(worktime_params)
    @worktime.save
  end

  private

  def worktime_params
    params.require(:worktime).permit(:pomo_time)
  end
end
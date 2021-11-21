class WorktimesController < ApplicationController
  protect_from_forgery
  def new
    @worktime = Worktime.new
  end

  def create
    binding.pry
    @worktime = current_user.worktimes.build(worktime_params)
    @worktime.save
      # respond_to do |format|
      #   format.html { redirect_to root_path }
      #   format.json { render json: { pomo_time: @worktime.pomo_time, user_id: @worktime.user_id, id: @worktime.id } }
      # end
    end
  end

  private

  def worktime_params
    params.permit(:pomo_time)
  end
end
class TopsController < ApplicationController
  def index
    @lists = current_user.lists
    @worktime_count = Worktime.group(:current_user).sum(:pomo_time)
  end
  
end
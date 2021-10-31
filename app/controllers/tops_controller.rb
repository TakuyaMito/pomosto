class TopsController < ApplicationController
  def index
    @lists = List.all.includes(:user).order(created_at: :desc)
  end
end

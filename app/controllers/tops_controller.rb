class TopsController < ApplicationController
  def index
    @lists = List.all.includes(:user)
  end
end

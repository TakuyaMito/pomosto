class TopsController < ApplicationController
  def index
    @lists = current_user.lists
  end
end
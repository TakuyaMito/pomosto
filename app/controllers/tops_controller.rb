class TopsController < ApplicationController
  def index
    @lists = current_user.list
  end
end

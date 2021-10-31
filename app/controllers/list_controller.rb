class ListController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to :root
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end

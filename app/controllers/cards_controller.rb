class CardsController < ApplicationController
  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    binding.pry
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private

  def card_params
    params.require(:card).permit(:title, :memo, :list_id)
  end
end

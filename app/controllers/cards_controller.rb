class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def create
    @card = current_user.cards.build(card_params)
    if @card.save
      redirect_to :root
    else
      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:title, :memo).merge(list_id: params[:list_id])
  end
end

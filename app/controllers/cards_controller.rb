class CardsController < ApplicationController
  before_action :find_card, only: %i[show edit update]

  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @card.update(card_params)
      redirect_to :root
    else
      render :new
    end
  end


  private

  def card_params
    params.require(:card).permit(:title, :memo, :list_id)
  end

  def find_card
    @card = Card.find(params[:id])
  end
end

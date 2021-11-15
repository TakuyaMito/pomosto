class CardsController < ApplicationController
  before_action :find_card, only: %i[show edit update destroy]

  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @list = List.find_by(id: params[:list_id])
    @card = Card.new(card_params)
    @card.save
  end

  def show; end

  def edit
    @lists = List.where(user: current_user)
  end

  def update
    @lists = List.where(user: current_user)
    if @card.update(card_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @card.destroy!
  end


  private

  def card_params
    params.require(:card).permit(:title, :memo, :list_id)
  end

  def find_card
    @card = Card.find(params[:id])
  end
end

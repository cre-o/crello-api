class CardsController < ApplicationController
  before_action :set_card, except: [:create]

  def destroy
    if @card.destroy
      render json: { message: "removed" }, status: :ok
    else
      render status: 503
    end
  end

  def create
    list = List.find(params[:list_id])
    list.cards << card = Card.new(name: params[:name], position: params[:position])

    if card.save
      render json: { message: "created", id: card.id }, status: :ok
    else
      render status: 503
    end
  end

  def update
    if @card.update(card_params)
      render json: { message: "updated" }, status: :ok
    else
      render status: 503
    end
  end

  private

    def card_params
      params.permit(:name, :position)
    end

    def set_card
      @card = Card.find(params[:id])
    end
end

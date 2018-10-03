class ListsController < ApplicationController
  before_action :set_list, except: [:create, :sort_cards]

  def destroy
    if @list.destroy
      render json: { message: "removed" }, status: :ok
    else
      render status: 503
    end
  end

  def create
    board = Board.find(params[:board_id])
    board.lists << list = List.new(name: params[:name], position: params[:position])

    lists = board.lists.where.not(id: list).where('position <= ?', 1)
    lists.each_with_index do |r, i|
      r.update(position: 2+i)
    end

    if board.save
      render json: { message: "created", id: list.id }, status: :ok
    else
      render status: 503
    end
  end

  def update
    if @list.update(list_params)
      render json: { message: "updated" }, status: :ok
    else
      render status: 503
    end
  end

  def sort_cards
    list = List.find(params[:to_list_id])
    card = Card.find(params[:card_id])
    new_position = params[:new_position]
    current_first_position = list.cards.any? ? list.cards.first.position : 1

    if params[:from_list_id] != params[:to_list_id]
      list.cards << card
    end

    if current_first_position == new_position
      cards = list.cards.where('position <= ?', new_position)
      cards.each_with_index do |r, i|
        r.update(position: new_position+i+1)
      end
    end

    if ( card.update(position: params[:new_position]) && list.save )
      render json: { message: "sorted" }, status: :ok
    else
      render status: 503
    end
  end

  private

    def list_params
      params.permit(:name, :position)
    end

    def set_list
      @list = List.find(params[:id])
    end
end

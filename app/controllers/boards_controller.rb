class BoardsController < ApplicationController

  def index
    render json: Board.public_boards.as_json({
        except: [:created_at, :updated_at]
        })
  end

  def show
    board = Board.find_by!(resource_id: params[:id])

    render json: {
      board: board.as_json({
        except: [:created_at, :updated_at]
        }),
      lists: board.lists.as_json({
        include: { cards: { except: [:created_at, :updated_at] }},
        except: [:created_at, :updated_at]
        })
    }
  end

end

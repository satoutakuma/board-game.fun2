class Public::FavoritesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @favorite = Favorite.new(customer_id: current_customer.id, game_id: params[:game_id])
    @favorite.save!
  end

  def destroy
    @game = Game.find(params[:game_id])
    @favorite = Favorite.find_by(customer_id: current_customer.id, game_id: params[:game_id])
    @favorite.destroy!
  end
  
  private

  def set_game
    @game = Game.find(params[:game_id])
  end
end

class Public::GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.customer_id = current_customer.id
    if @game.save
      flash[:notice] = "game was successfully created."
      redirect_to game_path(@game)
    else
      @games = Game.all
      @customer = current_customer
      render :index
    end
  end

  def index
    @games = Game.joins(:customer).where(customers: { is_active: true })
    @user = current_customer
    if params[:min_players].present? || params[:max_players].present?
      @games = Game.where("min_players >= ? AND max_players <= ?", params[:min_players].to_i, params[:max_players].to_i).order(min_players: :asc)
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
    @new = Game.new
    @user = current_customer
    @users = @game.customer
    @game_comment = GameComment.new
  end

  def edit
    is_matching_login_customer
    @game = Game.find(params[:id])
  end

  def update
    is_matching_login_customer
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = "game was successfully updated."
      redirect_to game_path(@game)
    else
      flash[:notice] = "error game was not successfully updated."
      @games = Game.all
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
  	@game.destroy
  	redirect_to games_path
  	flash[:notice] = "Game was successfully destroyed."
  end

  def sort_by_players_range
    min_players = params[:min_players].to_i
    max_players = params[:max_players].to_i
    if min_players > 0 && max_players > 0
      @games = Game.where("min_players >= ? AND max_players <= ?", min_players, max_players).order(min_players: :asc)
    else
      @games = Game.all
    end

    render :index
  end

  private
  def game_params
  	params.require(:game).permit(:title, :body, :max_players, :min_players)
  end


  def is_matching_login_customer
    game = Game.find(params[:id])
    unless game.customer == current_customer
      redirect_to games_path
    end
  end
end

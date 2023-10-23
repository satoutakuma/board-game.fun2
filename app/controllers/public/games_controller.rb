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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

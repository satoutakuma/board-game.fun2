class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @user = Customer.find(params[:id])
    @games = @user.games
  end

  def edit
  end

  def update
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :introduction, :is_active)
  end

  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to customer_path(current_customer.id)
    end
  end
end

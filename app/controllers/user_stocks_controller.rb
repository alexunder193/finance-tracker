class UserStocksController < ApplicationController

  def create
    stock = Stock.check_db(params[:ticker])

    # if there is no stock ticker in Stock table
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
    redirect_to my_portfolio_path
  end
end

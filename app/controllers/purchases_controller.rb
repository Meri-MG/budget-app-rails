class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.includes(:category)
  end

  def new
    @purchase = Purchase.new
    @categories = Category.all
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.author_id = current_user.id
    @category = Category.find(params[:category_id])
    @purchase.category_id = @category.id
    if @purchase.save
      flash[:notice] = 'Transaction was created successfully.'
      redirect_to user_category_purchases_path(current_user.id, @category.id)
    else
      flash[:notice] = 'Oops, something went wrong!'
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount)
  end
end

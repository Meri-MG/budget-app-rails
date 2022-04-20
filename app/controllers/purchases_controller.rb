class PurchasesController < ApplicationController
  def index
    # @purchases = Purchase.includes(:category)
    redirect_to category_path
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase =Purchase.new(purchase_params)
    @purchase.author = current_user
    if @purchase.save
      flash[:notice] = 'Transaction was created successfully.'
      redirect_to @purchase.categories.first
    else
      flash[:notice] = 'Oops, something went wrong!'
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount, category_ids: [])
  end
end

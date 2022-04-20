class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @purchases = @category.purchases
    @user = @category.user
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      flash[:notice] = 'Category was created successfully.'
      redirect_to categories_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Category was deleted successfully.'
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end

class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
                               password: ENV["HTTP_BASIC_PASSWORD"]

  def index
    @categories = Category.all
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(param_category)

    if @categories.save
      redirect_to %i[admin categories], notice: "Category created!"
    else
      render :new
    end
  end

  private

  def product_category
    params.require(:category).permit(:name, :created_at, :updated_at)
  end
end

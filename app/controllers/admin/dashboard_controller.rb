class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]

  def show

    @all_products = Product.all
    @all_categories = Category.all

  end
end

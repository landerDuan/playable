class ProductsController < ApplicationController
  main_nav_highlight :products

  def index
  	p @products = Product.all
  end

end
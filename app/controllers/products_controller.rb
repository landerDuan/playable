class ProductsController < InheritedResources::Base
  main_nav_highlight :products
  
  protected
  
  def collection
    @products ||= end_of_association_chain.default_order
  end

end
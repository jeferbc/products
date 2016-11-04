class ProductsController < ApplicationController
  #before_filter :category_id_integer
  before_action :find_product, only:[:edit,:update,:destroy]
  def index
    @products = Product.all
  end
  def new
    @product = Product.new
    @categories =Category.all
  end

  def create
    categories = params[:product][:category_id].map(&:to_i)
    @product = Product.new(product_params)
    categories.each do |category|
      category = Category.find(category)
      @product.categories << category
    end
    # params[:product][:category_id] = params[:product][:category_id].map(&:to_i)
    # byebug
    # @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "El producto fue creado correctamente"
      redirect_to products_path
    else
      render :new
    end
  end

  def update

    params[:product][:category_id] ||= []
    @product.category_ids=params[:product][:category_id]
    if @product.update_attributes(product_params)
      flash[:notice] = "Store was successfully updated."
      redirect_to products_path
    else
      render :edit
    end
  end

  def edit
    @categories = Category.all
  end

  def destroy
    @product.destroy
    flash[:notice] = "Store was successfully destroyed"
    redirect_to products_path
  end

  private

  def category_id_integer
   params[:product][:category_id] = params[:product][:category_id].map(&:to_i)
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end

class ReviewsController < ApplicationController

  before_action :only => [:destroy] do
    unless current_user || current_user.admin
      flash[:notice] = "You are not authorized to visit that page"
      redirect_to products_path
    end
  end

  before_action :only => [:new, :create, :edit, :update] do
    unless current_user && current_user.admin == false
      flash[:notice] = "Only users can create and update reviews."
      redirect_to products_path
    end
  end


  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "review successfully created"
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "review successfully updated"
      redirect_to product_review_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "review successfully deleted"
    redirect_to product_path(@product)
  end

  private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating, :email)
  end
end
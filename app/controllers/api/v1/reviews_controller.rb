class Api::V1::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show; end

  def create
    @review = Review.new(review_params)
    @bicyle = Bicycle.find(params[:bicycle_ids])
    @review.user = current_user
    if @review.save
      render :show, status: :created
    else
      render json: @bicycle.errors, status: :unprocessable_entity
    end
  end

  def update
    if  @review.update(review_params)
      render :show, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    head :no_content
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end

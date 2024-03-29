# frozen_string_literal: true
class ReviewsController < ApplicationController # rubocop:disable Layout/EmptyLineAfterMagicComment,Style/Documentation
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)

    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

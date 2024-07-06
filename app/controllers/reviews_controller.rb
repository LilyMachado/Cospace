# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  before_action :set_workspace

  def index
    @reviews = @workspace.reviews
  end

  def new
    @review = @workspace.reviews.build
  end

  def create
    @review = @workspace.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to workspace_reviews_path(@workspace), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end

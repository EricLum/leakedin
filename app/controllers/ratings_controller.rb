class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      redirect_to rating_path(@rating)
    else
      redirect_to new_rating_path
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def index
    @ratings = Rating.all
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update(rating_params)
  end

  def delete
    @rating = Rating.find(params[:id])
    @rating.destroy
  end

  private

  def rating_params
    params.require(:rating).permit(:review_date, :description, :bathroom_id, :stars)
  end

end
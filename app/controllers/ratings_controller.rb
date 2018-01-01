class RatingsController < ApplicationController

  def new
    @rating = Rating.new
    @bathroom = Bathroom.find(params[:bathroom_id])
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      @bathroom = Bathroom.find(@rating.bathroom.id)
      redirect_to bathroom_path(@bathroom)
    else
      flash[:error] = @rating.errors.full_messages
      redirect_to new_bathroom_rating_path
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
    params.require(:rating).permit(:review_date, :description, :bathroom_id, :stars, :title)
  end

end

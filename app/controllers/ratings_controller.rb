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
    @bathroom = @rating.bathroom
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
    if @rating.save
      redirect_to bathroom_path(@rating.bathroom)
    else
      flash[:error] = @rating.errors.full_messages
      redirect_to edit_bathroom_rating_path(@bathroom, @rating)
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @bathroom = @rating.bathroom
    @rating.destroy
    redirect_to @bathroom
  end

  private

  def rating_params
    params.require(:rating).permit(:review_date, :description, :bathroom_id, :stars, :title)
  end

end

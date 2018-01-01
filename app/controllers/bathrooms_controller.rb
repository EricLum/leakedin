class BathroomsController < ApplicationController
  def new
    @bathroom = Bathroom.new
  end

  def create
    @bathroom = Bathroom.new(bathroom_params)

    if @bathroom.save
      redirect_to bathroom_path(@bathroom)
    else
      flash[:error] = @bathroom.errors.full_messages
      redirect_to new_bathroom_path
    end
  end

  def edit
    @bathroom = Bathroom.find(params[:id])
  end

  def show
    @bathroom = Bathroom.find(params[:id])
  end

  def index
    @bathrooms = Bathroom.all
  end

  def update
    @bathroom = Bathroom.find(params[:id])
    @bathroom.update(bathroom_params)
    if @bathroom.save
      redirect_to bathroom_path(@bathroom)
    else
      flash[:error] = @bathroom.errors.full_messages
      redirect_to edit_bathroom_path(@bathroom)
    end
  end

  def delete
    @bathroom = Bathroom.find(params[:id])
    @bathroom.destroy
  end

  private

  def bathroom_params
    params.require(:bathroom).permit(:stalls, :title, :establishment, :address)
  end
end

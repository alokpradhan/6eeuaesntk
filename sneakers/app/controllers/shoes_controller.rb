class ShoesController < ApplicationController

  def new
    @shoe = User.find(params[:user_id]).shoes.build
  end

  def create
    @shoe = User.find(params[:user_id]).shoes.build(shoe_params)
    if @shoe.save
      flash[:success] = "New shoes, my favorite!"
      redirect_to user_path(@shoe.user)
    else
      flash.now[:error] = "You're probably missing something."
      render :new
    end
  end

  private

  def shoe_params
    params.require(:shoe).permit(:brand, :model, :year, :purchase_date)
  end
end

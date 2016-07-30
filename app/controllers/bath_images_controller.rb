class BathImagesController < ApplicationController
  before_action :current_bath
  
  def new
    @bath_image = BathImage.new(bath: @bath)
  end

  def create
    @bath = Bath.find(params[:bath_id])
    @bath_image = @bath.bath_images.build(bath_image_params)
    @bath_image.user_id = current_user.id
    if @bath_image.save
      flash[:success] = "Image successfully added"
      redirect_to view_path(@bath)
    else
      flash[:danger] = "Unable to create flag"
      render 'new'
    end
    

  end

  def show
  end

  def destroy
  end

private

  def bath_image_params
    params.require(:bath_image).permit(:photo)
  end
  
  def current_bath
    @bath = Bath.find_by_id(params[:bath_id])
  end

end

class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  # GET /images
  # GET /images.json
  def index
    
    @images = Image.all.where(public: "true")
    
  end


  # GET /images/new
  def new
    @current_user = User.find_by_id(current_user.id)
    @image = @current_user.images.new
  end


  # POST /images
  # POST /images.json
  def create
    @current_user = User.find_by_id(current_user.id)
    @image_array = params[:image][:photo]
    # loops through array of images submitted and create and image model for each of them
    for image in @image_array do
      if (@image_array.index(image) == @image_array.length - 1) 
        @image = @current_user.images.new(public: image_params[:public])
        @image.photo.attach(image)
        respond_to do |format|
          if @image.save
            format.html { redirect_to images_url, notice: 'Images were successfully uploaded.' }
            format.json { render :show, status: :created, location: @images }
          else
            format.html { render :new }
            format.json { render json: @image.errors, status: :unprocessable_entity }
          end
        end
      else
          @image = @current_user.images.new(public: image_params[:public])
          @image.photo.attach(image)
          @image.save
      end
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:public, :photo)
    end
end

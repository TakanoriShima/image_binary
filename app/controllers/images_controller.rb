class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    p 'きたきた'
    upload_file = image_params[:photo]
    image = {}
    if upload_file != nil
      image[:photo] = upload_file.read
      image[:filename] = upload_file.original_filename
    end
    image[:memo] = image_params[:memo]
    @image = Image.new(image)
    respond_to do |format|
      if @image.save
        format.html { redirect_to root_path, notice: 'Upload success' }
        format.json { render action: 'show', status: :created, location: @image }
      else
        @images = Image.all
        format.html { render action: 'index' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
  end
  def show_image
    @image = Image.find(params[:id])
    send_data @image.photo, :type => 'image/jpeg', :disposition => 'inline'
  end
  private
  def image_params
    params.require(:image).permit(:file_name, :memo, :photo)
  end
end

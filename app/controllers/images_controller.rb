class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :destroy]
  before_action :validate_user, except: [:index]

  def index
    @images = Image.where(:user_id => current_user.id) if current_user
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def validate_user
      if !signed_in?
        redirect_to images_path, notice: 'Need to be signed in'
      elsif @image && @image.user_id != current_user.id
        redirect_to images_path, notice: 'Not your image'
      end
    end

    def image_params
      params.fetch(:image, {}).permit(:image, :user_id)
    end
end

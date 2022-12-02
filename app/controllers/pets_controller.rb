class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    # @pets = Pet.all
    if params[:query].present?
      @query = params[:query]
      @pets = Pet.where("lower(name) LIKE ? or lower(description) LIKE ? or lower(species) LIKE ? or lower(title) LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @pets = Pet.all
    end

    @markers = Pet.all.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: pet }),
        image_url: helpers.asset_url("paw_vector.png")
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @pet = Pet.new
    @bookmark = Bookmark.new
  end

  def edit
  end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def create

    @pet = Pet.new(pet_params)
    @pet.user = current_user
    @pet.address = current_user.address

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, status: :see_other
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :title, :description, :price, :age, photos: [])
  end
end

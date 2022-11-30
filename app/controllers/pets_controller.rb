class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    # @pets = Pet.all
    if params[:query].present?
      @query = params[:query]
      @pets = Pet.where("lower(name) LIKE ? or lower(description) LIKE ? or lower(species) LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @pets = Pet.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @pet = Pet.new
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
    if @pet.save
      redirect_to pets_path
    else
      render :new
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

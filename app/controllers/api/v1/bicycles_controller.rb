class Api::V1::BicyclesController < Api::V1::BaseController
  before_action :set_bicycle, only: [ :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @bicycles = Bicycle.all
  end

  def show; end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    @bicycle.user = current_user
    if @bicycle.save
      render :show, status: :created
    else
      render json: @bicycle.errors, status: :unprocessable_entity
    end
  end

  def update
    if  @bicycle.update(bicycle_params)
      render :show, status: :ok
    else
      render json: @bicycle.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bicycle.destroy
    head :no_content
  end


  private

  def bicycle_params
    params.require(:bicycle).permit(:name, :brand, :name, :price_day, :bicycle_type, :foldable, :location, :number_wheels, :photo)
  end

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end

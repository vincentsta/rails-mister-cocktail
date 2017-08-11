class CocktailsController < ApplicationController
  layout "homelayout", only: [ :home ]
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def home
    @cocktails = Cocktail.all
    @nb_visible = 5
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @show = true
  end

  def new
    @action = "New"
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @action = "Edit"
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end

class CocktailsController < ApplicationController
  layout "homelayout", only: [ :home ]
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy, :upvote]

  def home
    @cocktails = Cocktail.all.sort
    @nb_visible = 5
    @home = true
  end

  def index
    @cocktails = Cocktail.order(:name)
  end

  def random
    @cocktail = Cocktail.all.sample
    @dose = Dose.new
    @show = true
    render :show
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
    @cocktail.votes = "0"
    if @cocktail.save
      flash[:notice] = "Cocktail #{@cocktail.name} has been created"
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

  def upvote
    @cocktail.votes = @cocktail.votes.to_i + 1
    @cocktail.save
    @dose = Dose.new
    @show = true
    respond_to do |format|
        format.html { render 'cocktails/show' }
        format.js  # <-- idem
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
